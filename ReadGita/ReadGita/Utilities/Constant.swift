//
//  Constant.swift
//  Categories
//
//  Created by Pallavi Sharma on 10/10/23.
//

import Foundation
import SwiftUI

extension Color {
    static let gray800 = Color(red: 0.765, green: 0.765, blue: 0.765)
}

enum Font {
    static let bold = "Helvetica-Bold"
    static let regular = "HelveticaNeue"
    static let medium = "HelveticaNeue-Medium"
}

enum Constant {
    static let baseURL = "https://bhagavad-gita3.p.rapidapi.com/v2/chapters/"
    static let versesURL = "/verses/"
    static let chapters = "Chapters"
    static let verses = "Verses"
    static let name = "Name:"
    static let chapter = "Chapter:"
    static let chapterName = "Chapter Name:"
    static let chapterMeaning = "Chapter Meaning:"
    static let BG = "BG"
    static let title = "Experience the Gita\n Anywhere, Anytime"
    static let startNew = "Start New"
    static let chooseChapter = "Choose Chapter"
}

enum ImageConstant {
    static let rightArrow = "right-arrow"
    static let arrow = "arrow"
    static let book = "book"
}
