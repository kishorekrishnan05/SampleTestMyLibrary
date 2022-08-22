/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct Pnr : Codable {
	let sessionId : String?
	let recordLocator : String?
	let dateCreated : String?
	let description : String?
	let isActive : Bool?
	let ticketType : String?
	let numberOfPassengers : String?
	let trips : String?
	let passengers : [Passengers]?
	let segments : String?
	let lastTripDateDepartureDate : String?
	let lastTripDateArrivalDate : String?
	let checkinEligible : String?
	let alreadyCheckedin : String?
	let notValid : String?
	let validforCheckin : String?
	let pnrCanceled : String?
	let uaRecordLocator : String?
	let coRecordLocator : String?
	let pnrOwner : String?
	let oaRecordLocators : [String]?
	let oaRecordLocatorMessageTitle : String?
	let oaRecordLocatorMessage : String?
	let isEligibleToSeatChange : Bool?
	let emailAddress : String?
	let seatOffer : String?
	let bundleInfo : String?
	let petRecordLocators : String?
	let upgradeMessage : String?
	let farelockExpirationDate : String?
	let farelockPurchaseMessage : String?
	let earnedMilesHeader : String?
	let earnedMilesText : String?
	let ineligibleToEarnCreditMessage : String?
	let oaIneligibleToEarnCreditMessage : String?
	let awardTravel : Bool?
	let psSaTravel : Bool?
	let supressLMX : Bool?
	let overMileageLimitMessage : String?
	let overMileageLimitAmount : String?
	let syncedWithConcur : String?

	enum CodingKeys: String, CodingKey {

		case sessionId = "sessionId"
		case recordLocator = "recordLocator"
		case dateCreated = "dateCreated"
		case description = "description"
		case isActive = "isActive"
		case ticketType = "ticketType"
		case numberOfPassengers = "numberOfPassengers"
		case trips = "trips"
		case passengers = "passengers"
		case segments = "segments"
		case lastTripDateDepartureDate = "lastTripDateDepartureDate"
		case lastTripDateArrivalDate = "lastTripDateArrivalDate"
		case checkinEligible = "checkinEligible"
		case alreadyCheckedin = "alreadyCheckedin"
		case notValid = "notValid"
		case validforCheckin = "validforCheckin"
		case pnrCanceled = "pnrCanceled"
		case uaRecordLocator = "uaRecordLocator"
		case coRecordLocator = "coRecordLocator"
		case pnrOwner = "pnrOwner"
		case oaRecordLocators = "oaRecordLocators"
		case oaRecordLocatorMessageTitle = "oaRecordLocatorMessageTitle"
		case oaRecordLocatorMessage = "oaRecordLocatorMessage"
		case isEligibleToSeatChange = "isEligibleToSeatChange"
		case emailAddress = "emailAddress"
		case seatOffer = "seatOffer"
		case bundleInfo = "bundleInfo"
		case petRecordLocators = "petRecordLocators"
		case upgradeMessage = "upgradeMessage"
		case farelockExpirationDate = "farelockExpirationDate"
		case farelockPurchaseMessage = "farelockPurchaseMessage"
		case earnedMilesHeader = "earnedMilesHeader"
		case earnedMilesText = "earnedMilesText"
		case ineligibleToEarnCreditMessage = "ineligibleToEarnCreditMessage"
		case oaIneligibleToEarnCreditMessage = "oaIneligibleToEarnCreditMessage"
		case awardTravel = "awardTravel"
		case psSaTravel = "psSaTravel"
		case supressLMX = "supressLMX"
		case overMileageLimitMessage = "overMileageLimitMessage"
		case overMileageLimitAmount = "overMileageLimitAmount"
		case syncedWithConcur = "syncedWithConcur"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sessionId = try values.decodeIfPresent(String.self, forKey: .sessionId)
		recordLocator = try values.decodeIfPresent(String.self, forKey: .recordLocator)
		dateCreated = try values.decodeIfPresent(String.self, forKey: .dateCreated)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
		ticketType = try values.decodeIfPresent(String.self, forKey: .ticketType)
		numberOfPassengers = try values.decodeIfPresent(String.self, forKey: .numberOfPassengers)
		trips = try values.decodeIfPresent(String.self, forKey: .trips)
		passengers = try values.decodeIfPresent([Passengers].self, forKey: .passengers)
		segments = try values.decodeIfPresent(String.self, forKey: .segments)
		lastTripDateDepartureDate = try values.decodeIfPresent(String.self, forKey: .lastTripDateDepartureDate)
		lastTripDateArrivalDate = try values.decodeIfPresent(String.self, forKey: .lastTripDateArrivalDate)
		checkinEligible = try values.decodeIfPresent(String.self, forKey: .checkinEligible)
		alreadyCheckedin = try values.decodeIfPresent(String.self, forKey: .alreadyCheckedin)
		notValid = try values.decodeIfPresent(String.self, forKey: .notValid)
		validforCheckin = try values.decodeIfPresent(String.self, forKey: .validforCheckin)
		pnrCanceled = try values.decodeIfPresent(String.self, forKey: .pnrCanceled)
		uaRecordLocator = try values.decodeIfPresent(String.self, forKey: .uaRecordLocator)
		coRecordLocator = try values.decodeIfPresent(String.self, forKey: .coRecordLocator)
		pnrOwner = try values.decodeIfPresent(String.self, forKey: .pnrOwner)
		oaRecordLocators = try values.decodeIfPresent([String].self, forKey: .oaRecordLocators)
		oaRecordLocatorMessageTitle = try values.decodeIfPresent(String.self, forKey: .oaRecordLocatorMessageTitle)
		oaRecordLocatorMessage = try values.decodeIfPresent(String.self, forKey: .oaRecordLocatorMessage)
		isEligibleToSeatChange = try values.decodeIfPresent(Bool.self, forKey: .isEligibleToSeatChange)
		emailAddress = try values.decodeIfPresent(String.self, forKey: .emailAddress)
		seatOffer = try values.decodeIfPresent(String.self, forKey: .seatOffer)
		bundleInfo = try values.decodeIfPresent(String.self, forKey: .bundleInfo)
		petRecordLocators = try values.decodeIfPresent(String.self, forKey: .petRecordLocators)
		upgradeMessage = try values.decodeIfPresent(String.self, forKey: .upgradeMessage)
		farelockExpirationDate = try values.decodeIfPresent(String.self, forKey: .farelockExpirationDate)
		farelockPurchaseMessage = try values.decodeIfPresent(String.self, forKey: .farelockPurchaseMessage)
		earnedMilesHeader = try values.decodeIfPresent(String.self, forKey: .earnedMilesHeader)
		earnedMilesText = try values.decodeIfPresent(String.self, forKey: .earnedMilesText)
		ineligibleToEarnCreditMessage = try values.decodeIfPresent(String.self, forKey: .ineligibleToEarnCreditMessage)
		oaIneligibleToEarnCreditMessage = try values.decodeIfPresent(String.self, forKey: .oaIneligibleToEarnCreditMessage)
		awardTravel = try values.decodeIfPresent(Bool.self, forKey: .awardTravel)
		psSaTravel = try values.decodeIfPresent(Bool.self, forKey: .psSaTravel)
		supressLMX = try values.decodeIfPresent(Bool.self, forKey: .supressLMX)
		overMileageLimitMessage = try values.decodeIfPresent(String.self, forKey: .overMileageLimitMessage)
		overMileageLimitAmount = try values.decodeIfPresent(String.self, forKey: .overMileageLimitAmount)
		syncedWithConcur = try values.decodeIfPresent(String.self, forKey: .syncedWithConcur)
	}

}
