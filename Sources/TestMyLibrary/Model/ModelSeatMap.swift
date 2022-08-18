/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ModelSeatMap : Codable {
	let flightStatusInfo : String?
	let crmSeatMapResponse : CrmSeatMapResponse?
	let sgementFlightStatus : SgementFlightStatus?
	let customerCount : Int?
	let transactionId : String?
	let languageCode : String?
	let machineName : String?
	let callDuration : Int?
	let externalcallDuration : Int?
	let internalcallDuration : Int?
	let exception : String?

	enum CodingKeys: String, CodingKey {

		case flightStatusInfo = "flightStatusInfo"
		case crmSeatMapResponse = "crmSeatMapResponse"
		case sgementFlightStatus = "sgementFlightStatus"
		case customerCount = "customerCount"
		case transactionId = "transactionId"
		case languageCode = "languageCode"
		case machineName = "machineName"
		case callDuration = "callDuration"
		case externalcallDuration = "externalcallDuration"
		case internalcallDuration = "internalcallDuration"
		case exception = "exception"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		flightStatusInfo = try values.decodeIfPresent(String.self, forKey: .flightStatusInfo)
		crmSeatMapResponse = try values.decodeIfPresent(CrmSeatMapResponse.self, forKey: .crmSeatMapResponse)
		sgementFlightStatus = try values.decodeIfPresent(SgementFlightStatus.self, forKey: .sgementFlightStatus)
		customerCount = try values.decodeIfPresent(Int.self, forKey: .customerCount)
		transactionId = try values.decodeIfPresent(String.self, forKey: .transactionId)
		languageCode = try values.decodeIfPresent(String.self, forKey: .languageCode)
		machineName = try values.decodeIfPresent(String.self, forKey: .machineName)
		callDuration = try values.decodeIfPresent(Int.self, forKey: .callDuration)
		externalcallDuration = try values.decodeIfPresent(Int.self, forKey: .externalcallDuration)
		internalcallDuration = try values.decodeIfPresent(Int.self, forKey: .internalcallDuration)
		exception = try values.decodeIfPresent(String.self, forKey: .exception)
	}

}
