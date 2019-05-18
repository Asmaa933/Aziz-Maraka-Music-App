//
//  RegisterResponseModel.swift
//  Aziz Maraka Music App
//
//  Created by AsMaa on 4/30/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//


import Foundation
struct RegisterResponseModel : Codable {
	let name : String?
	let email : String?
	let agency : String?
	let ugroup : Int?
	let loc : String?
	let updated_at : String?
	let created_at : String?
	let id : Int?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case email = "email"
		case agency = "agency"
		case ugroup = "ugroup"
		case loc = "loc"
		case updated_at = "updated_at"
		case created_at = "created_at"
		case id = "id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		agency = try values.decodeIfPresent(String.self, forKey: .agency)
		ugroup = try values.decodeIfPresent(Int.self, forKey: .ugroup)
		loc = try values.decodeIfPresent(String.self, forKey: .loc)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
	}

}
