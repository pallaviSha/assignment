//
//  HomeViewUITests.swift
//  ReadGitaUITests
//
//  Created by Pallavi Sharma on 17/10/23.
//

import XCTest
import SwiftUI

final class HomeViewUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testHomeViewUI() {
        let titleLabel = app.staticTexts[Constant.title]
        XCTAssertTrue(titleLabel.exists)

        let startNewButton = app.buttons[Constant.startNew]
        XCTAssertTrue(startNewButton.exists)

        let chooseChapterButton = app.buttons[Constant.chooseChapter]
        XCTAssertTrue(chooseChapterButton.exists)
    }

    func testChooseChapterButtonTap() {
        let chooseChapterButton = app.buttons[Constant.chooseChapter]
        chooseChapterButton.tap()
        let title = app.staticTexts[Constant.chapters]
        XCTAssertTrue(title.exists)
    }
}
