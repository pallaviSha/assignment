
import Foundation
struct Chapter : Codable {
	let id : Int?
	let name : String?
	let name_transliterated : String?
	let name_translated : String?
	let verses_count : Int?
	let chapter_number : Int?
	let name_meaning : String?
	let chapter_summary : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case name_transliterated = "name_transliterated"
		case name_translated = "name_translated"
		case verses_count = "verses_count"
		case chapter_number = "chapter_number"
		case name_meaning = "name_meaning"
		case chapter_summary = "chapter_summary"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		name_transliterated = try values.decodeIfPresent(String.self, forKey: .name_transliterated)
		name_translated = try values.decodeIfPresent(String.self, forKey: .name_translated)
		verses_count = try values.decodeIfPresent(Int.self, forKey: .verses_count)
		chapter_number = try values.decodeIfPresent(Int.self, forKey: .chapter_number)
		name_meaning = try values.decodeIfPresent(String.self, forKey: .name_meaning)
		chapter_summary = try values.decodeIfPresent(String.self, forKey: .chapter_summary)
	}
}
