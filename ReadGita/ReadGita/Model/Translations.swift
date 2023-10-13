
import Foundation
struct Translations : Codable {
	let id : Int?
	let description : String?
	let author_name : String?
	let language : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case description = "description"
		case author_name = "author_name"
		case language = "language"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		author_name = try values.decodeIfPresent(String.self, forKey: .author_name)
		language = try values.decodeIfPresent(String.self, forKey: .language)
	}

}
