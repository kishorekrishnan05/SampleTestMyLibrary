/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct SeatMap : Codable {
    public let flightNumber : Int?
    public let flightDateTime : String?
    public let departure : String?
    public let arrival : String?
    public let codeshareFlightNumber : String?
    public let seatLegendId : String?
    public let cabins : [Cabins]?
    public let legId : String?
    public let fleetType : String?
    public let seatMapAvailabe : Bool?
    public let keyInsightsOrderingList : [KeyInsightsOrderingList]?
    public let keyInsightsActionsOrderingList : [KeyInsightsActionsOrderingList]?
    public let actionFeedbackQuestionList : [ActionFeedbackQuestionList]?

	enum CodingKeys: String, CodingKey {

		case flightNumber = "flightNumber"
		case flightDateTime = "flightDateTime"
		case departure = "departure"
		case arrival = "arrival"
		case codeshareFlightNumber = "codeshareFlightNumber"
		case seatLegendId = "seatLegendId"
		case cabins = "cabins"
		case legId = "legId"
		case fleetType = "fleetType"
		case seatMapAvailabe = "seatMapAvailabe"
		case keyInsightsOrderingList = "keyInsightsOrderingList"
		case keyInsightsActionsOrderingList = "keyInsightsActionsOrderingList"
		case actionFeedbackQuestionList = "actionFeedbackQuestionList"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		flightNumber = try values.decodeIfPresent(Int.self, forKey: .flightNumber)
		flightDateTime = try values.decodeIfPresent(String.self, forKey: .flightDateTime)
		departure = try values.decodeIfPresent(String.self, forKey: .departure)
		arrival = try values.decodeIfPresent(String.self, forKey: .arrival)
		codeshareFlightNumber = try values.decodeIfPresent(String.self, forKey: .codeshareFlightNumber)
		seatLegendId = try values.decodeIfPresent(String.self, forKey: .seatLegendId)
		cabins = try values.decodeIfPresent([Cabins].self, forKey: .cabins)
		legId = try values.decodeIfPresent(String.self, forKey: .legId)
		fleetType = try values.decodeIfPresent(String.self, forKey: .fleetType)
		seatMapAvailabe = try values.decodeIfPresent(Bool.self, forKey: .seatMapAvailabe)
		keyInsightsOrderingList = try values.decodeIfPresent([KeyInsightsOrderingList].self, forKey: .keyInsightsOrderingList)
		keyInsightsActionsOrderingList = try values.decodeIfPresent([KeyInsightsActionsOrderingList].self, forKey: .keyInsightsActionsOrderingList)
		actionFeedbackQuestionList = try values.decodeIfPresent([ActionFeedbackQuestionList].self, forKey: .actionFeedbackQuestionList)
	}

}
