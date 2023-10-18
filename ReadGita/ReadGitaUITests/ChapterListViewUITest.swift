//
//  ChapterListViewUITest.swift
//  ReadGitaUITests
//
//  Created by Pallavi Sharma on 17/10/23.
//

import XCTest

final class ChapterListViewUITest: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }

    func testChapterListViewUI() {
        app.launch()
        app.buttons[Constant.chooseChapter].tap()
        let back = app.buttons[Constant.arrow]
        XCTAssertTrue(back.exists)
        let scrollViewExists = NSPredicate(format: "exists == true")
        let scrollViewExpectation = expectation(for: scrollViewExists, evaluatedWith: app.scrollViews["list"], handler: nil)

        // Wait for the expectation to be fulfilled or time out
        wait(for: [scrollViewExpectation], timeout: 10)
        let linkToTap = app.scrollViews["list"].buttons.firstMatch
        if app.staticTexts[Constant.chapters].exists {
            linkToTap.tap()
            let verses = app.staticTexts[Constant.verses]
            XCTAssertTrue(verses.exists)
        } else {
            linkToTap.tap()
            let bg = app.scrollViews.staticTexts[Constant.BG]
            XCTAssertTrue(bg.exists)
        }
    }
}
