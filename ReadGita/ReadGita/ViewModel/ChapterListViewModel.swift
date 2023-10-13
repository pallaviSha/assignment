//
//  ChapterListViewModel.swift
//  Categories
//
//  Created by Pallavi Sharma on 12/10/23.
//

import Foundation

class ChapterListViewModel : ObservableObject {

    /// An enumeration representing the loading
    /// state for this view model.
    enum LoadingState {
       case error(String)
       case loaded([Chapter])
       case verseLoaded([Verses])
       case idle
       case loading
   }

    // MARK: Instance Variables
    let repository: BookRepositoryProtocol

    // MARK: Variables
    @Published var loadingState = LoadingState.idle

    /**
        Initializes the ViewModel with a repository conforming to `BookRepositoryProtocol`.

        - Parameters:
            - repository: An instance of a repository conforming to `BookRepositoryProtocol`.

        This initializer is responsible for setting up the ViewModel with the provided repository, which is used for data retrieval and management. It ensures that the ViewModel is properly configured with the necessary data source.
     */
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
    func getChapterListContent() {
        self.publishState(LoadingState.loading)
        repository.getAllTheChapters { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let chapterData):
                self.publishState(LoadingState.loaded(chapterData))
            case .failure(let err):
                self.publishState(LoadingState.error(err.localizedDescription))
            }
        }
    }

    /**
        Fetches and populates the ViewModel with a list of verses for a specific chapter.

        - Parameters:
            - chapterNo: A string representing the chapter number.

        This method uses the repository to retrieve a list of verses for a specific chapter and updates the ViewModel's loading state accordingly. It handles both success and failure cases by publishing the appropriate loading state.
     */
    func getChapterVerseListContent(chapterNo: String) {
        self.publishState(LoadingState.loading)
        repository.getAllVersesOfChapter(chapterNo) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let versesData):
                self.publishState(LoadingState.verseLoaded(versesData))
            case .failure(let err):
                self.publishState(LoadingState.error(err.localizedDescription))
            }
        }
    }
}
