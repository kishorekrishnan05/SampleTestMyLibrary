/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct CrmProfile : Codable {
	let averageCSATScore : Double?
	let recentCSATScore : Double?
	let customerValueScore : Int?
	let disserviceIndex : Int?
	let anniversaryNumber : Int?
	let birthdayIndicator : Bool?
	let birthdayMilestone : String?
	let legMillionMilerIndicator : Bool?
	let tripMillionMilerIndicator : Bool?
	let legMillionMilerNumber : Int?
	let millionMiler : Double?
	let customerValueIndicator : String?
	let disserviceIndexIndicator : String?
	let connection : String?
	let topSSR : String?
	let ssr : [String]?
	let lapChild : String?
	let ssrs : [Ssrs]?
	let specialMeals : [SpecialMeals]?
    let preOrderMeals : [PreOrderMeals]?
	let tripHistoryList : [TripHistoryList]?
	let keyInsights : KeyInsights?
	let keyInsightsResponseList : [KeyInsightsResponseList]?
	let actionResponseList : [ActionResponseList]?
	let feedbackConfirmation : Bool?
	let numberInParty : Int?
	let connectingFlight : ConnectingFlight?
	let legPremierUpgradeCode : String?
	let awarenessIndicator : Bool?
	let actionIndicator : Bool?
	let awarenessType : String?

	enum CodingKeys: String, CodingKey {

		case averageCSATScore = "averageCSATScore"
		case recentCSATScore = "recentCSATScore"
		case customerValueScore = "customerValueScore"
		case disserviceIndex = "disserviceIndex"
		case anniversaryNumber = "anniversaryNumber"
		case birthdayIndicator = "birthdayIndicator"
		case birthdayMilestone = "birthdayMilestone"
		case legMillionMilerIndicator = "legMillionMilerIndicator"
		case tripMillionMilerIndicator = "tripMillionMilerIndicator"
		case legMillionMilerNumber = "legMillionMilerNumber"
		case millionMiler = "millionMiler"
		case customerValueIndicator = "customerValueIndicator"
		case disserviceIndexIndicator = "disserviceIndexIndicator"
		case connection = "connection"
		case topSSR = "topSSR"
		case ssr = "ssr"
		case lapChild = "lapChild"
		case ssrs = "ssrs"
		case specialMeals = "specialMeals"
        case preOrderMeals = "preOrderMeals"
		case tripHistoryList = "tripHistoryList"
		case keyInsights = "keyInsights"
		case keyInsightsResponseList = "keyInsightsResponseList"
		case actionResponseList = "actionResponseList"
		case feedbackConfirmation = "feedbackConfirmation"
		case numberInParty = "numberInParty"
		case connectingFlight = "connectingFlight"
		case legPremierUpgradeCode = "legPremierUpgradeCode"
		case awarenessIndicator = "awarenessIndicator"
		case actionIndicator = "actionIndicator"
		case awarenessType = "awarenessType"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		averageCSATScore = try values.decodeIfPresent(Double.self, forKey: .averageCSATScore)
		recentCSATScore = try values.decodeIfPresent(Double.self, forKey: .recentCSATScore)
		customerValueScore = try values.decodeIfPresent(Int.self, forKey: .customerValueScore)
		disserviceIndex = try values.decodeIfPresent(Int.self, forKey: .disserviceIndex)
		anniversaryNumber = try values.decodeIfPresent(Int.self, forKey: .anniversaryNumber)
		birthdayIndicator = try values.decodeIfPresent(Bool.self, forKey: .birthdayIndicator)
		birthdayMilestone = try values.decodeIfPresent(String.self, forKey: .birthdayMilestone)
		legMillionMilerIndicator = try values.decodeIfPresent(Bool.self, forKey: .legMillionMilerIndicator)
		tripMillionMilerIndicator = try values.decodeIfPresent(Bool.self, forKey: .tripMillionMilerIndicator)
		legMillionMilerNumber = try values.decodeIfPresent(Int.self, forKey: .legMillionMilerNumber)
		millionMiler = try values.decodeIfPresent(Double.self, forKey: .millionMiler)
		customerValueIndicator = try values.decodeIfPresent(String.self, forKey: .customerValueIndicator)
		disserviceIndexIndicator = try values.decodeIfPresent(String.self, forKey: .disserviceIndexIndicator)
		connection = try values.decodeIfPresent(String.self, forKey: .connection)
		topSSR = try values.decodeIfPresent(String.self, forKey: .topSSR)
		ssr = try values.decodeIfPresent([String].self, forKey: .ssr)
		lapChild = try values.decodeIfPresent(String.self, forKey: .lapChild)
		ssrs = try values.decodeIfPresent([Ssrs].self, forKey: .ssrs)
		specialMeals = try values.decodeIfPresent([SpecialMeals].self, forKey: .specialMeals)
        preOrderMeals = try values.decodeIfPresent([PreOrderMeals].self, forKey: .preOrderMeals)
		tripHistoryList = try values.decodeIfPresent([TripHistoryList].self, forKey: .tripHistoryList)
        keyInsights = try values.decodeIfPresent(KeyInsights.self, forKey: .keyInsights)
		keyInsightsResponseList = try values.decodeIfPresent([KeyInsightsResponseList].self, forKey: .keyInsightsResponseList)
		actionResponseList = try values.decodeIfPresent([ActionResponseList].self, forKey: .actionResponseList)
		feedbackConfirmation = try values.decodeIfPresent(Bool.self, forKey: .feedbackConfirmation)
		numberInParty = try values.decodeIfPresent(Int.self, forKey: .numberInParty)
		connectingFlight = try values.decodeIfPresent(ConnectingFlight.self, forKey: .connectingFlight)
		legPremierUpgradeCode = try values.decodeIfPresent(String.self, forKey: .legPremierUpgradeCode)
		awarenessIndicator = try values.decodeIfPresent(Bool.self, forKey: .awarenessIndicator)
		actionIndicator = try values.decodeIfPresent(Bool.self, forKey: .actionIndicator)
		awarenessType = try values.decodeIfPresent(String.self, forKey: .awarenessType)
	}

}
