

import Foundation
struct SignInModel: Codable {
	let token_type : String?
	let expires_in : Int?
	let access_token : String?
	let refresh_token : String?

	enum CodingKeys: String, CodingKey {

		case token_type = "token_type"
		case expires_in = "expires_in"
		case access_token = "access_token"
		case refresh_token = "refresh_token"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		token_type = try values.decodeIfPresent(String.self, forKey: .token_type)
		expires_in = try values.decodeIfPresent(Int.self, forKey: .expires_in)
		access_token = try values.decodeIfPresent(String.self, forKey: .access_token)
		refresh_token = try values.decodeIfPresent(String.self, forKey: .refresh_token)
	}

}
