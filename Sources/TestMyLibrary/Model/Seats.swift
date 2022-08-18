/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Seats : Codable {
	let servicesAndFees : String?
	let number : String?
	let seatvalue : String?
	let fee : String?
	let exit : Bool?
	let limitedRecline : Bool?
	let isEPlus : Bool?
	let program : String?
	let crmInfo : CrmInfo?
	let crmInfoEncrypted : String?
	let ssrs : [Ssrs]?

	enum CodingKeys: String, CodingKey {

		case servicesAndFees = "servicesAndFees"
		case number = "number"
		case seatvalue = "seatvalue"
		case fee = "fee"
		case exit = "exit"
		case limitedRecline = "limitedRecline"
		case isEPlus = "isEPlus"
		case program = "program"
		case crmInfo = "crmInfo"
		case crmInfoEncrypted = "crmInfoEncrypted"
		case ssrs = "ssrs"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		servicesAndFees = try values.decodeIfPresent(String.self, forKey: .servicesAndFees)
		number = try values.decodeIfPresent(String.self, forKey: .number)
		seatvalue = try values.decodeIfPresent(String.self, forKey: .seatvalue)
		fee = try values.decodeIfPresent(String.self, forKey: .fee)
		exit = try values.decodeIfPresent(Bool.self, forKey: .exit)
		limitedRecline = try values.decodeIfPresent(Bool.self, forKey: .limitedRecline)
		isEPlus = try values.decodeIfPresent(Bool.self, forKey: .isEPlus)
		program = try values.decodeIfPresent(String.self, forKey: .program)
		crmInfo = try values.decodeIfPresent(CrmInfo.self, forKey: .crmInfo)
		crmInfoEncrypted = try values.decodeIfPresent(String.self, forKey: .crmInfoEncrypted)
		ssrs = try values.decodeIfPresent([Ssrs].self, forKey: .ssrs)
	}

}
