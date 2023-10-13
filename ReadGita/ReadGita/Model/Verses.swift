
import Foundation
struct Verses : Codable {
	let id : Int?
	let verse_number : Int?
	let chapter_number : Int?
	let text : String?
    let transliteration: String?
    let word_meanings: String?
	let translations : [Translations]?
	let commentaries : [Commentaries]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case verse_number = "verse_number"
		case chapter_number = "chapter_number"
		case text = "text"
        case transliteration = "transliteration"
        case word_meanings = "word_meanings"
		case translations = "translations"
		case commentaries = "commentaries"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		verse_number = try values.decodeIfPresent(Int.self, forKey: .verse_number)
		chapter_number = try values.decodeIfPresent(Int.self, forKey: .chapter_number)
		text = try values.decodeIfPresent(String.self, forKey: .text)
        transliteration = try values.decodeIfPresent(String.self, forKey: .transliteration)
        word_meanings = try values.decodeIfPresent(String.self, forKey: .word_meanings)
		translations = try values.decodeIfPresent([Translations].self, forKey: .translations)
		commentaries = try values.decodeIfPresent([Commentaries].self, forKey: .commentaries)
	}
}
