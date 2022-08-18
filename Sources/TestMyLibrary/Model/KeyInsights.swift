/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct KeyInsights : Codable {
	let mPLevelAndReason : String?
	let numYearsAsMPMember : String?
	let corporateAffiliation : String?
	let homeAirport : String?
	let reasonForUpperClass : String?
	let percentUpperClassBookings : String?
	let atRiskScore : String?
	let lastCSATScore : String?
	let lastCSATDate : String?
	let recentDisservice : String?
	let millionMilerStatus : String?
	let nearMillionMiler : String?
	let reachedMillionMiler : String?
	let nearElite : String?
	let reachedElite : String?
	let mileagePlusAnniversary : String?
	let behavioralSegmentation : String?
	let numberOfChaseUACreditCards : String?
	let mostFreqEngagedPartner : String?
	let lastRedemptionDate : String?
	let redemptionLifeCycle : String?

	enum CodingKeys: String, CodingKey {

		case mPLevelAndReason = "MPLevelAndReason"
		case numYearsAsMPMember = "NumYearsAsMPMember"
		case corporateAffiliation = "CorporateAffiliation"
		case homeAirport = "HomeAirport"
		case reasonForUpperClass = "ReasonForUpperClass"
		case percentUpperClassBookings = "PercentUpperClassBookings"
		case atRiskScore = "AtRiskScore"
		case lastCSATScore = "LastCSATScore"
		case lastCSATDate = "LastCSATDate"
		case recentDisservice = "RecentDisservice"
		case millionMilerStatus = "MillionMilerStatus"
		case nearMillionMiler = "NearMillionMiler"
		case reachedMillionMiler = "ReachedMillionMiler"
		case nearElite = "NearElite"
		case reachedElite = "ReachedElite"
		case mileagePlusAnniversary = "MileagePlusAnniversary"
		case behavioralSegmentation = "BehavioralSegmentation"
		case numberOfChaseUACreditCards = "NumberOfChaseUACreditCards"
		case mostFreqEngagedPartner = "MostFreqEngagedPartner"
		case lastRedemptionDate = "LastRedemptionDate"
		case redemptionLifeCycle = "RedemptionLifeCycle"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		mPLevelAndReason = try values.decodeIfPresent(String.self, forKey: .mPLevelAndReason)
		numYearsAsMPMember = try values.decodeIfPresent(String.self, forKey: .numYearsAsMPMember)
		corporateAffiliation = try values.decodeIfPresent(String.self, forKey: .corporateAffiliation)
		homeAirport = try values.decodeIfPresent(String.self, forKey: .homeAirport)
		reasonForUpperClass = try values.decodeIfPresent(String.self, forKey: .reasonForUpperClass)
		percentUpperClassBookings = try values.decodeIfPresent(String.self, forKey: .percentUpperClassBookings)
		atRiskScore = try values.decodeIfPresent(String.self, forKey: .atRiskScore)
		lastCSATScore = try values.decodeIfPresent(String.self, forKey: .lastCSATScore)
		lastCSATDate = try values.decodeIfPresent(String.self, forKey: .lastCSATDate)
		recentDisservice = try values.decodeIfPresent(String.self, forKey: .recentDisservice)
		millionMilerStatus = try values.decodeIfPresent(String.self, forKey: .millionMilerStatus)
		nearMillionMiler = try values.decodeIfPresent(String.self, forKey: .nearMillionMiler)
		reachedMillionMiler = try values.decodeIfPresent(String.self, forKey: .reachedMillionMiler)
		nearElite = try values.decodeIfPresent(String.self, forKey: .nearElite)
		reachedElite = try values.decodeIfPresent(String.self, forKey: .reachedElite)
		mileagePlusAnniversary = try values.decodeIfPresent(String.self, forKey: .mileagePlusAnniversary)
		behavioralSegmentation = try values.decodeIfPresent(String.self, forKey: .behavioralSegmentation)
		numberOfChaseUACreditCards = try values.decodeIfPresent(String.self, forKey: .numberOfChaseUACreditCards)
		mostFreqEngagedPartner = try values.decodeIfPresent(String.self, forKey: .mostFreqEngagedPartner)
		lastRedemptionDate = try values.decodeIfPresent(String.self, forKey: .lastRedemptionDate)
		redemptionLifeCycle = try values.decodeIfPresent(String.self, forKey: .redemptionLifeCycle)
	}

}