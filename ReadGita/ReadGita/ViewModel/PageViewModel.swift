//
//  PageViewModel.swift
//  Categories
//
//  Created by Pallavi Sharma on 12/10/23.
//

import Foundation

class PageViewModel : ObservableObject {

    /// An enumeration representing the loading
    /// state for this view model.
    enum LoadingState {
       case error(String)
       case loaded([Chapter])
       case idle
       case loading
   }

    // MARK: Instance Variables
    let repository: BookRepositoryProtocol

    // MARK: Variables
    @Published var loadingState = LoadingState.idle

    init(repository: BookRepositoryProtocol) {
        self.repository = repository
    }

    /**
        Updates the loading state of the ViewModel.

        - Parameters:
            - state: A `LoadingState` value representing the updated loading state.

        This private method is used to update the loading state of the ViewModel. It ensures that the `loadingState` property is updated on the main thread, allowing for proper synchronization of UI updates based on the loading state.
     */
    private func publishState(_ state: LoadingState) {
        DispatchQueue.main.async {
            self.loadingState = state
        }
    }

    /**
        Fetches and populates the ViewModel with a list of chapters.

        This method uses the repository to retrieve a list of chapters and updates the ViewModel's loading state accordingly. It handles both success and failure cases by publishing the appropriate loading state.
     */
    func getChapterAll() {
        self.publishState(LoadingState.loading)
        repository.getAllTheChapters{ [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.publishState(LoadingState.loaded(data))
            case .failure(let error):
                self.publishState(LoadingState.error(error.localizedDescription))
            }
        }
    }
}
