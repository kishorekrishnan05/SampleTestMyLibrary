/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct AccountSummary : Codable {
	let mileagePlusNumber : String?
	let customerId : Int?
	let name : String?
	let balance : String?
	let balanceExpireDate : String?
	let balanceExpireDisclaimer : String?
	let noMileageExpiration : String?
	let noMileageExpirationMessage : String?
	let eliteStatus : EliteStatus?
	let nextPremierLevel : NextPremierLevel?
	let enrollDate : String?
	let lastFlightDate : String?
	let lastActivityDate : String?
	let eliteMileage : String?
	let eliteSegment : String?
	let lastExpiredMileDate : String?
	let lastExpiredMile : Int?
	let hasUAClubMemberShip : Bool?
	let uAClubMemberShipDetails : String?
	let isMPAccountTSAFlagON : Bool?
	let tsaMessage : String?
	let fourSegmentMinimun : String?
	let premierQualifyingDollars : String?
	let pDQchasewavier : String?
	let pDQchasewaiverLabel : String?
	let millionMilerIndicator : String?
	let membershipCardBarCode : String?
	let membershipCardBarCodeString : String?
	let isCEO : Bool?
	let hashValue : String?
	let membershipCardExpirationDate : String?
	let dateOfBirth : String?
	let milestoneBirthday : String?
	let paxType : String?

	enum CodingKeys: String, CodingKey {

		case mileagePlusNumber = "mileagePlusNumber"
		case customerId = "customerId"
		case name = "name"
		case balance = "balance"
		case balanceExpireDate = "balanceExpireDate"
		case balanceExpireDisclaimer = "balanceExpireDisclaimer"
		case noMileageExpiration = "noMileageExpiration"
		case noMileageExpirationMessage = "noMileageExpirationMessage"
		case eliteStatus = "eliteStatus"
		case nextPremierLevel = "nextPremierLevel"
		case enrollDate = "enrollDate"
		case lastFlightDate = "lastFlightDate"
		case lastActivityDate = "lastActivityDate"
		case eliteMileage = "eliteMileage"
		case eliteSegment = "eliteSegment"
		case lastExpiredMileDate = "lastExpiredMileDate"
		case lastExpiredMile = "lastExpiredMile"
		case hasUAClubMemberShip = "hasUAClubMemberShip"
		case uAClubMemberShipDetails = "uAClubMemberShipDetails"
		case isMPAccountTSAFlagON = "isMPAccountTSAFlagON"
		case tsaMessage = "tsaMessage"
		case fourSegmentMinimun = "fourSegmentMinimun"
		case premierQualifyingDollars = "premierQualifyingDollars"
		case pDQchasewavier = "pDQchasewavier"
		case pDQchasewaiverLabel = "pDQchasewaiverLabel"
		case millionMilerIndicator = "millionMilerIndicator"
		case membershipCardBarCode = "membershipCardBarCode"
		case membershipCardBarCodeString = "membershipCardBarCodeString"
		case isCEO = "isCEO"
		case hashValue = "hashValue"
		case membershipCardExpirationDate = "membershipCardExpirationDate"
		case dateOfBirth = "dateOfBirth"
		case milestoneBirthday = "milestoneBirthday"
		case paxType = "paxType"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		mileagePlusNumber = try values.decodeIfPresent(String.self, forKey: .mileagePlusNumber)
		customerId = try values.decodeIfPresent(Int.self, forKey: .customerId)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		balance = try values.decodeIfPresent(String.self, forKey: .balance)
		balanceExpireDate = try values.decodeIfPresent(String.self, forKey: .balanceExpireDate)
		balanceExpireDisclaimer = try values.decodeIfPresent(String.self, forKey: .balanceExpireDisclaimer)
		noMileageExpiration = try values.decodeIfPresent(String.self, forKey: .noMileageExpiration)
		noMileageExpirationMessage = try values.decodeIfPresent(String.self, forKey: .noMileageExpirationMessage)
		eliteStatus = try values.decodeIfPresent(EliteStatus.self, forKey: .eliteStatus)
		nextPremierLevel = try values.decodeIfPresent(NextPremierLevel.self, forKey: .nextPremierLevel)
		enrollDate = try values.decodeIfPresent(String.self, forKey: .enrollDate)
		lastFlightDate = try values.decodeIfPresent(String.self, forKey: .lastFlightDate)
		lastActivityDate = try values.decodeIfPresent(String.self, forKey: .lastActivityDate)
		eliteMileage = try values.decodeIfPresent(String.self, forKey: .eliteMileage)
		eliteSegment = try values.decodeIfPresent(String.self, forKey: .eliteSegment)
		lastExpiredMileDate = try values.decodeIfPresent(String.self, forKey: .lastExpiredMileDate)
		lastExpiredMile = try values.decodeIfPresent(Int.self, forKey: .lastExpiredMile)
		hasUAClubMemberShip = try values.decodeIfPresent(Bool.self, forKey: .hasUAClubMemberShip)
		uAClubMemberShipDetails = try values.decodeIfPresent(String.self, forKey: .uAClubMemberShipDetails)
		isMPAccountTSAFlagON = try values.decodeIfPresent(Bool.self, forKey: .isMPAccountTSAFlagON)
		tsaMessage = try values.decodeIfPresent(String.self, forKey: .tsaMessage)
		fourSegmentMinimun = try values.decodeIfPresent(String.self, forKey: .fourSegmentMinimun)
		premierQualifyingDollars = try values.decodeIfPresent(String.self, forKey: .premierQualifyingDollars)
		pDQchasewavier = try values.decodeIfPresent(String.self, forKey: .pDQchasewavier)
		pDQchasewaiverLabel = try values.decodeIfPresent(String.self, forKey: .pDQchasewaiverLabel)
		millionMilerIndicator = try values.decodeIfPresent(String.self, forKey: .millionMilerIndicator)
		membershipCardBarCode = try values.decodeIfPresent(String.self, forKey: .membershipCardBarCode)
		membershipCardBarCodeString = try values.decodeIfPresent(String.self, forKey: .membershipCardBarCodeString)
		isCEO = try values.decodeIfPresent(Bool.self, forKey: .isCEO)
		hashValue = try values.decodeIfPresent(String.self, forKey: .hashValue)
		membershipCardExpirationDate = try values.decodeIfPresent(String.self, forKey: .membershipCardExpirationDate)
		dateOfBirth = try values.decodeIfPresent(String.self, forKey: .dateOfBirth)
		milestoneBirthday = try values.decodeIfPresent(String.self, forKey: .milestoneBirthday)
		paxType = try values.decodeIfPresent(String.self, forKey: .paxType)
	}

}
