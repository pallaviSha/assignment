//
//  BookRepositoryTests.swift
//  ReadGitaTests
//
//  Created by Pallavi Sharma on 16/10/23.
//

import XCTest
@testable import ReadGita

final class BookRepositoryTests: XCTestCase {

    var repository: BookRepository!
    var dataSource: MockDataSource!

        override func setUp() {
            super.setUp()
            dataSource = MockDataSource()
            repository = BookRepository(dataSource: dataSource)
        }

        override func tearDown() {
            repository = nil
            dataSource = nil
            super.tearDown()
        }

        // Test getAllTheChapters method
        func testGetAllTheChapters() {
            let chapter = "[{\"id\":1,\"name\":\"अर्जुनविषादयोग\",\"slug\":\"chapter-1-arjuna-visada-yoga\",\"name_transliterated\":\"ArjunViṣhādYog\",\"name_translated\":\"ArjunaVisadaYoga\",\"verses_count\":47,\"chapter_number\":1,\"name_meaning\":\"Arjuna'sDilemma\",\"chapter_summary\":\"ThefirstchapteroftheBhagavadGita-\\\"ArjunaVishadaYoga\\\"introducesthesetup,thesetting,thecharactersandthecircumstancesthatledtotheepicbattleofMahabharata,foughtbetweenthePandavasandtheKauravas.ItoutlinesthereasonsthatledtotherevelationoftheofBhagavadGita.\\nAsbotharmiesstandreadyforthebattle,themightywarriorArjuna,onobservingthewarriorsonbothsidesbecomesincreasinglysadanddepressedduetothefearoflosinghisrelativesandfriendsandtheconsequentsinsattributedtokillinghisownrelatives.So,hesurrenderstoLordKrishna,seekingasolution.Thus,followsthewisdomoftheBhagavadGita.\",\"chapter_summary_hindi\":\"भगवदगीताकापहलाअध्यायअर्जुनविशादयोगउनपात्रोंऔरपरिस्थितियोंकापरिचयकराताहैजिनकेकारणपांडवोंऔरकौरवोंकेबीचमहाभारतकामहासंग्रामहुआ।यहअध्यायउनकारणोंकावर्णनकरताहैजिनकेकारणभगवदगीताकाईश्वरावेशहुआ।जबमहाबलीयोद्धाअर्जुनदोनोंपक्षोंपरयुद्धकेलिएतैयारखड़ेयोद्धाओंकोदेखतेहैंतोवहअपनेहीरिश्तेदारोंएवंमित्रोंकोखोनेकेडरतथाफलस्वरूपपापोंकेकारणदुखीऔरउदासहोजातेहैं।इसलिएवहश्रीकृष्णकोपूरीतरहसेआत्मसमर्पणकरतेहैं।इसप्रकार,भगवदगीताकेज्ञानकाप्रकाशहोताहै।\"},{\"id\":2,\"name\":\"सांख्ययोग\",\"slug\":\"chapter-2-sankhya-yoga\",\"name_transliterated\":\"SānkhyaYog\",\"name_translated\":\"SankhyaYoga\",\"verses_count\":72,\"chapter_number\":2,\"name_meaning\":\"TranscendentalKnowledge\",\"chapter_summary\":\"ThesecondchapteroftheBhagavadGitais\\\"SankhyaYoga\\\".ThisisthemostimportantchapteroftheBhagavadGitaasLordKrishnacondensestheteachingsoftheentireGitainthischapter.ThischapteristheessenceoftheentireGita.\\n\\\"SankhyaYoga\\\"canbecategorizedinto4maintopics-\\n1.ArjunacompletelysurrendershimselftoLordKrishnaandacceptshispositionasadiscipleandKrishnaashisGuru.HerequestsKrishnatoguidehimonhowtodismisshissorrow.\\n2.Explanationofthemaincauseofallgrief,whichisignoranceofthetruenatureofSelf.\\n3.KarmaYoga-thedisciplineofselflessactionwithoutbeingattachedtoitsfruits.\\n4.DescriptionofaPerfectMan-Onewhosemindissteadyandone-pointed.\",\"chapter_summary_hindi\":\"भगवदगीताकादूसराअध्यायसांख्ययोगहै।यहअध्यायभगवदगीताकासबसेमहत्वपूर्णअध्यायहैक्योंकिइसमेंभगवानश्रीकृष्णसंपूर्णगीताकीशिक्षाओंकोसंघनितकरतेहैं।यहअध्यायपूरीगीताकासारहै।सांख्ययोगको4मुख्यविषयोंमेंवर्गीकृतकियाजासकताहै-१.अर्जुननेपूरीतरहसेभगवानकृष्णकोआत्मसमर्पणकियाऔरउन्हेंअपनेगुरुकेरूपमेंस्वीकारकिया।२.सभीदु:खोंकेमुख्यकारणोंकीव्याख्या,जोस्वकीवास्तविकप्रकृतिकीअज्ञानताहै।३.कर्मयोग-अपनेकर्मोंकेफलोंसेजुड़ेबिनानि:स्वार्थक्रियाकाअनुशासन।४.एकपरिपूर्णमनुष्यकाविवरण-जिसकामस्तिष्कस्थिरऔरएक-इशाराहै।\"}]".data(using: .utf8)
            guard let chapterData = chapter else {
                XCTFail("Expected success, got failure")
                return
            }
            dataSource.getAllChaptersResult = try! .success(JSONDecoder().decode([Chapter].self, from: chapterData))

            repository.getAllTheChapters { result in
                switch result {
                case .success(let chapters):
                    XCTAssertEqual(chapters.count, 2)
                case .failure(_):
                    XCTFail("Expected success, got failure")
                }
            }
        }

        // Test getPerticularChapter method
        func testGetPerticularChapterSuccess() {
            let chapter = "{\"id\":1,\"name\":\"अर्जुनविषादयोग\",\"name_transliterated\":\"ArjunViṣhādYog\",\"name_translated\":\"ArjunaVisadaYoga\",\"verses_count\":47,\"chapter_number\":1,\"name_meaning\":\"Arjuna'sDilemma\",\"chapter_summary\":\"ThefirstchapteroftheBhagavadGita-\\\"ArjunaVishadaYoga\\\"introducesthesetup,thesetting,thecharactersandthecircumstancesthatledtotheepicbattleofMahabharata,foughtbetweenthePandavasandtheKauravas.ItoutlinesthereasonsthatledtotherevelationoftheofBhagavadGita.\\nAsbotharmiesstandreadyforthebattle,themightywarriorArjuna,onobservingthewarriorsonbothsidesbecomesincreasinglysadanddepressedduetothefearoflosinghisrelativesandfriendsandtheconsequentsinsattributedtokillinghisownrelatives.So,hesurrenderstoLordKrishna,seekingasolution.Thus,followsthewisdomoftheBhagavadGita.\"}".data(using: .utf8)
            guard let chapterData = chapter else {
                XCTFail("Expected success, got failure")
                return
            }
            dataSource.getPerticularChapterResult = try! .success(JSONDecoder().decode(Chapter.self, from: chapterData))

            repository.getPerticularChapter("1") { result in
                switch result {
                case .success(let chapter):
                    XCTAssertEqual("\(chapter.id ?? 0)", "1")
                    XCTAssertEqual(chapter.name ?? "", "अर्जुनविषादयोग")
                case .failure(_):
                    XCTFail("Expected success, got failure")
                }
            }
        }

    // Test getAllVersesOfChapter method
    func testGetAllVersesOfChapter() {
        let verse = "[{\"id\":1,\"verse_number\":1,\"chapter_number\":1,\"text\":\"धृतराष्ट्रउवाच\\n\\nधर्मक्षेत्रेकुरुक्षेत्रेसमवेतायुयुत्सवः।\\n\\nमामकाःपाण्डवाश्चैवकिमकुर्वतसञ्जय।।1.1।।\\n\"},{\"id\":1,\"verse_number\":1,\"chapter_number\":1,\"text\":\"धृतराष्ट्रउवाच\\n\\nधर्मक्षेत्रेकुरुक्षेत्रेसमवेतायुयुत्सवः।\\n\\nमामकाःपाण्डवाश्चैवकिमकुर्वतसञ्जय।।1.1।।\\n\"}]".data(using: .utf8)
        guard let verseData = verse else {
            XCTFail("Expected success, got failure")
            return
        }
        dataSource.getAllVersesResult = try! .success(JSONDecoder().decode([Verses].self, from: verseData))
        repository.getAllVersesOfChapter("1") { result in
            switch result {
            case .success(let verses):
                XCTAssertEqual(verses.count, 2)
            case .failure(_):
                XCTFail("Expected success, got failure")
            }
        }
    }

    // Test getPerticularVerseOfChapter method
    func testGetPerticularVerseOfChapter() {
        let verses = "{\"id\":1,\"verse_number\":1,\"chapter_number\":1,\"text\":\"धृतराष्ट्रउवाच\\n\\nधर्मक्षेत्रेकुरुक्षेत्रेसमवेतायुयुत्सवः।\\n\\nमामकाःपाण्डवाश्चैवकिमकुर्वतसञ्जय।।1.1।।\\n\"}".data(using: .utf8)
        guard let verseData = verses else {
            XCTFail("Expected success, got failure")
            return
        }
        dataSource.getPerticularVerseResult = try! .success(JSONDecoder().decode(Verses.self, from: verseData))
        repository.getPerticularVerseOfChapter("1", "1") { result in
            switch result {
            case .success(let verse):
                XCTAssertEqual("\(verse.id ?? 0)", "1")
                XCTAssertEqual("\(verse.chapter_number ?? 0)", "1")
            case .failure(_):
                XCTFail("Expected success, got failure")
            }
        }
    }
}
