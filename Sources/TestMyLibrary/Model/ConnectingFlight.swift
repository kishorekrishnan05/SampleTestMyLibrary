/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct ConnectingFlight : Codable {
	let airline : String?
	let departureDate : String?
	let departureGate : String?
	let departureTerminal : String?
	let destinationCity : String?
	let flightDelayCancelReason : String?
	let flightNumber : Int?
	let flightStatus : String?
	let flightType : String?
	let gmtEstimatedDepartureDateTime : String?
	let isLessThanMinimumConnectTime : Bool?
	let localEstimatedDepartureDateTime : String?

	enum CodingKeys: String, CodingKey {

		case airline = "airline"
		case departureDate = "departureDate"
		case departureGate = "departureGate"
		case departureTerminal = "departureTerminal"
		case destinationCity = "destinationCity"
		case flightDelayCancelReason = "flightDelayCancelReason"
		case flightNumber = "flightNumber"
		case flightStatus = "flightStatus"
		case flightType = "flightType"
		case gmtEstimatedDepartureDateTime = "gmtEstimatedDepartureDateTime"
		case isLessThanMinimumConnectTime = "isLessThanMinimumConnectTime"
		case localEstimatedDepartureDateTime = "localEstimatedDepartureDateTime"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		airline = try values.decodeIfPresent(String.self, forKey: .airline)
		departureDate = try values.decodeIfPresent(String.self, forKey: .departureDate)
		departureGate = try values.decodeIfPresent(String.self, forKey: .departureGate)
		departureTerminal = try values.decodeIfPresent(String.self, forKey: .departureTerminal)
		destinationCity = try values.decodeIfPresent(String.self, forKey: .destinationCity)
		flightDelayCancelReason = try values.decodeIfPresent(String.self, forKey: .flightDelayCancelReason)
		flightNumber = try values.decodeIfPresent(Int.self, forKey: .flightNumber)
		flightStatus = try values.decodeIfPresent(String.self, forKey: .flightStatus)
		flightType = try values.decodeIfPresent(String.self, forKey: .flightType)
		gmtEstimatedDepartureDateTime = try values.decodeIfPresent(String.self, forKey: .gmtEstimatedDepartureDateTime)
		isLessThanMinimumConnectTime = try values.decodeIfPresent(Bool.self, forKey: .isLessThanMinimumConnectTime)
		localEstimatedDepartureDateTime = try values.decodeIfPresent(String.self, forKey: .localEstimatedDepartureDateTime)
	}

}
