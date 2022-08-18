/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct SgementFlightStatus : Codable {
	let estimatedDepartureDateTime : String?
	let estimatedArrivalDateTime : String?
	let actualDepartureDateTime : String?
	let actualArrivalDateTime : String?
	let departureTerminal : String?
	let arrivalTerminal : String?
	let departureGate : String?
	let arrivalGate : String?
	let ship : Ship?
	let operatingCarrier : OperatingCarrier?
	let codeShareCarrier : String?
	let status : String?
	let enableSeatMap : Bool?
	let enableStandbyList : Bool?
	let enableUpgradeList : Bool?
	let enableAmenity : Bool?
	let codeShareflightNumber : String?
	let canPushNotification : Bool?
	let isSegmentCancelled : Bool?
	let getInBoundSegment : Bool?
	let inBoundSegment : String?
	let isWiFiAvailable : Bool?
	let lastUpdatedGMT : String?
	let pushNotificationRegId : String?
	let statusShort : String?
	let lastKnownDepartureTime : String?
	let lastKnownDepartureTimeGMT : String?
	let blockTime : String?
	let flightTime : String?
	let flightTimeChange : String?
	let arrivalUTCDateTime : String?
	let departureUTCDateTime : String?
	let flightAttendantBoardTime : String?
	let customerBoardTime : String?
	let flightAttendantBaseCheckIn : String?
	let flightAttendantDownLineCheckIn : String?
	let flightAttendantBaseBoardTime : String?
	let flightAttendantDownLineBoardTime : String?
	let flightAttendantDeadheadBoardTime : String?
	let baseFAsCheckInCrew : [String]?
	let downlineFAsCheckInCrew : [String]?
	let mixedCrew : [String]?
	let minimumCrewToBoard : String?
	let minimumCrewToDepart : String?
	let mealBoarded : String?
	let liquorBoarded : String?
	let languageIncentivePayList : [String]?
	let awardedJumpseatList : String?
	let mealDescriptionList : [MealDescriptionList]?
	let flightMiles : Int?
	let marketingCarrier : MarketingCarrier?
	let flightNumber : String?
	let departure : Departure?
	let arrival : Arrival?
	let scheduledDeparture : ScheduledDeparture?
	let scheduledArrival : ScheduledArrival?
	let scheduledDepartureDateTime : String?
	let scheduledArrivalDateTime : String?
	let scheduledDepartureTimeGMT : String?
	let scheduledArrivalTimeGMT : String?
	let formattedScheduledDepartureDateTime : String?
	let formattedScheduledArrivalDateTime : String?
	let formattedScheduledDepartureDate : String?
	let formattedScheduledArrivalDate : String?
	let formattedScheduledDepartureTime : String?
	let formattedScheduledArrivalTime : String?

	enum CodingKeys: String, CodingKey {

		case estimatedDepartureDateTime = "estimatedDepartureDateTime"
		case estimatedArrivalDateTime = "estimatedArrivalDateTime"
		case actualDepartureDateTime = "actualDepartureDateTime"
		case actualArrivalDateTime = "actualArrivalDateTime"
		case departureTerminal = "departureTerminal"
		case arrivalTerminal = "arrivalTerminal"
		case departureGate = "departureGate"
		case arrivalGate = "arrivalGate"
		case ship = "ship"
		case operatingCarrier = "operatingCarrier"
		case codeShareCarrier = "codeShareCarrier"
		case status = "status"
		case enableSeatMap = "enableSeatMap"
		case enableStandbyList = "enableStandbyList"
		case enableUpgradeList = "enableUpgradeList"
		case enableAmenity = "enableAmenity"
		case codeShareflightNumber = "codeShareflightNumber"
		case canPushNotification = "canPushNotification"
		case isSegmentCancelled = "isSegmentCancelled"
		case getInBoundSegment = "getInBoundSegment"
		case inBoundSegment = "inBoundSegment"
		case isWiFiAvailable = "isWiFiAvailable"
		case lastUpdatedGMT = "lastUpdatedGMT"
		case pushNotificationRegId = "pushNotificationRegId"
		case statusShort = "statusShort"
		case lastKnownDepartureTime = "lastKnownDepartureTime"
		case lastKnownDepartureTimeGMT = "lastKnownDepartureTimeGMT"
		case blockTime = "blockTime"
		case flightTime = "flightTime"
		case flightTimeChange = "flightTimeChange"
		case arrivalUTCDateTime = "arrivalUTCDateTime"
		case departureUTCDateTime = "departureUTCDateTime"
		case flightAttendantBoardTime = "flightAttendantBoardTime"
		case customerBoardTime = "customerBoardTime"
		case flightAttendantBaseCheckIn = "flightAttendantBaseCheckIn"
		case flightAttendantDownLineCheckIn = "flightAttendantDownLineCheckIn"
		case flightAttendantBaseBoardTime = "flightAttendantBaseBoardTime"
		case flightAttendantDownLineBoardTime = "flightAttendantDownLineBoardTime"
		case flightAttendantDeadheadBoardTime = "flightAttendantDeadheadBoardTime"
		case baseFAsCheckInCrew = "baseFAsCheckInCrew"
		case downlineFAsCheckInCrew = "downlineFAsCheckInCrew"
		case mixedCrew = "mixedCrew"
		case minimumCrewToBoard = "minimumCrewToBoard"
		case minimumCrewToDepart = "minimumCrewToDepart"
		case mealBoarded = "mealBoarded"
		case liquorBoarded = "liquorBoarded"
		case languageIncentivePayList = "languageIncentivePayList"
		case awardedJumpseatList = "awardedJumpseatList"
		case mealDescriptionList = "mealDescriptionList"
		case flightMiles = "flightMiles"
		case marketingCarrier = "marketingCarrier"
		case flightNumber = "flightNumber"
		case departure = "departure"
		case arrival = "arrival"
		case scheduledDeparture = "scheduledDeparture"
		case scheduledArrival = "scheduledArrival"
		case scheduledDepartureDateTime = "scheduledDepartureDateTime"
		case scheduledArrivalDateTime = "scheduledArrivalDateTime"
		case scheduledDepartureTimeGMT = "scheduledDepartureTimeGMT"
		case scheduledArrivalTimeGMT = "scheduledArrivalTimeGMT"
		case formattedScheduledDepartureDateTime = "formattedScheduledDepartureDateTime"
		case formattedScheduledArrivalDateTime = "formattedScheduledArrivalDateTime"
		case formattedScheduledDepartureDate = "formattedScheduledDepartureDate"
		case formattedScheduledArrivalDate = "formattedScheduledArrivalDate"
		case formattedScheduledDepartureTime = "formattedScheduledDepartureTime"
		case formattedScheduledArrivalTime = "formattedScheduledArrivalTime"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		estimatedDepartureDateTime = try values.decodeIfPresent(String.self, forKey: .estimatedDepartureDateTime)
		estimatedArrivalDateTime = try values.decodeIfPresent(String.self, forKey: .estimatedArrivalDateTime)
		actualDepartureDateTime = try values.decodeIfPresent(String.self, forKey: .actualDepartureDateTime)
		actualArrivalDateTime = try values.decodeIfPresent(String.self, forKey: .actualArrivalDateTime)
		departureTerminal = try values.decodeIfPresent(String.self, forKey: .departureTerminal)
		arrivalTerminal = try values.decodeIfPresent(String.self, forKey: .arrivalTerminal)
		departureGate = try values.decodeIfPresent(String.self, forKey: .departureGate)
		arrivalGate = try values.decodeIfPresent(String.self, forKey: .arrivalGate)
		ship = try values.decodeIfPresent(Ship.self, forKey: .ship)
		operatingCarrier = try values.decodeIfPresent(OperatingCarrier.self, forKey: .operatingCarrier)
		codeShareCarrier = try values.decodeIfPresent(String.self, forKey: .codeShareCarrier)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		enableSeatMap = try values.decodeIfPresent(Bool.self, forKey: .enableSeatMap)
		enableStandbyList = try values.decodeIfPresent(Bool.self, forKey: .enableStandbyList)
		enableUpgradeList = try values.decodeIfPresent(Bool.self, forKey: .enableUpgradeList)
		enableAmenity = try values.decodeIfPresent(Bool.self, forKey: .enableAmenity)
		codeShareflightNumber = try values.decodeIfPresent(String.self, forKey: .codeShareflightNumber)
		canPushNotification = try values.decodeIfPresent(Bool.self, forKey: .canPushNotification)
		isSegmentCancelled = try values.decodeIfPresent(Bool.self, forKey: .isSegmentCancelled)
		getInBoundSegment = try values.decodeIfPresent(Bool.self, forKey: .getInBoundSegment)
		inBoundSegment = try values.decodeIfPresent(String.self, forKey: .inBoundSegment)
		isWiFiAvailable = try values.decodeIfPresent(Bool.self, forKey: .isWiFiAvailable)
		lastUpdatedGMT = try values.decodeIfPresent(String.self, forKey: .lastUpdatedGMT)
		pushNotificationRegId = try values.decodeIfPresent(String.self, forKey: .pushNotificationRegId)
		statusShort = try values.decodeIfPresent(String.self, forKey: .statusShort)
		lastKnownDepartureTime = try values.decodeIfPresent(String.self, forKey: .lastKnownDepartureTime)
		lastKnownDepartureTimeGMT = try values.decodeIfPresent(String.self, forKey: .lastKnownDepartureTimeGMT)
		blockTime = try values.decodeIfPresent(String.self, forKey: .blockTime)
		flightTime = try values.decodeIfPresent(String.self, forKey: .flightTime)
		flightTimeChange = try values.decodeIfPresent(String.self, forKey: .flightTimeChange)
		arrivalUTCDateTime = try values.decodeIfPresent(String.self, forKey: .arrivalUTCDateTime)
		departureUTCDateTime = try values.decodeIfPresent(String.self, forKey: .departureUTCDateTime)
		flightAttendantBoardTime = try values.decodeIfPresent(String.self, forKey: .flightAttendantBoardTime)
		customerBoardTime = try values.decodeIfPresent(String.self, forKey: .customerBoardTime)
		flightAttendantBaseCheckIn = try values.decodeIfPresent(String.self, forKey: .flightAttendantBaseCheckIn)
		flightAttendantDownLineCheckIn = try values.decodeIfPresent(String.self, forKey: .flightAttendantDownLineCheckIn)
		flightAttendantBaseBoardTime = try values.decodeIfPresent(String.self, forKey: .flightAttendantBaseBoardTime)
		flightAttendantDownLineBoardTime = try values.decodeIfPresent(String.self, forKey: .flightAttendantDownLineBoardTime)
		flightAttendantDeadheadBoardTime = try values.decodeIfPresent(String.self, forKey: .flightAttendantDeadheadBoardTime)
		baseFAsCheckInCrew = try values.decodeIfPresent([String].self, forKey: .baseFAsCheckInCrew)
		downlineFAsCheckInCrew = try values.decodeIfPresent([String].self, forKey: .downlineFAsCheckInCrew)
		mixedCrew = try values.decodeIfPresent([String].self, forKey: .mixedCrew)
		minimumCrewToBoard = try values.decodeIfPresent(String.self, forKey: .minimumCrewToBoard)
		minimumCrewToDepart = try values.decodeIfPresent(String.self, forKey: .minimumCrewToDepart)
		mealBoarded = try values.decodeIfPresent(String.self, forKey: .mealBoarded)
		liquorBoarded = try values.decodeIfPresent(String.self, forKey: .liquorBoarded)
		languageIncentivePayList = try values.decodeIfPresent([String].self, forKey: .languageIncentivePayList)
		awardedJumpseatList = try values.decodeIfPresent(String.self, forKey: .awardedJumpseatList)
		mealDescriptionList = try values.decodeIfPresent([MealDescriptionList].self, forKey: .mealDescriptionList)
		flightMiles = try values.decodeIfPresent(Int.self, forKey: .flightMiles)
		marketingCarrier = try values.decodeIfPresent(MarketingCarrier.self, forKey: .marketingCarrier)
		flightNumber = try values.decodeIfPresent(String.self, forKey: .flightNumber)
		departure = try values.decodeIfPresent(Departure.self, forKey: .departure)
		arrival = try values.decodeIfPresent(Arrival.self, forKey: .arrival)
		scheduledDeparture = try values.decodeIfPresent(ScheduledDeparture.self, forKey: .scheduledDeparture)
		scheduledArrival = try values.decodeIfPresent(ScheduledArrival.self, forKey: .scheduledArrival)
		scheduledDepartureDateTime = try values.decodeIfPresent(String.self, forKey: .scheduledDepartureDateTime)
		scheduledArrivalDateTime = try values.decodeIfPresent(String.self, forKey: .scheduledArrivalDateTime)
		scheduledDepartureTimeGMT = try values.decodeIfPresent(String.self, forKey: .scheduledDepartureTimeGMT)
		scheduledArrivalTimeGMT = try values.decodeIfPresent(String.self, forKey: .scheduledArrivalTimeGMT)
		formattedScheduledDepartureDateTime = try values.decodeIfPresent(String.self, forKey: .formattedScheduledDepartureDateTime)
		formattedScheduledArrivalDateTime = try values.decodeIfPresent(String.self, forKey: .formattedScheduledArrivalDateTime)
		formattedScheduledDepartureDate = try values.decodeIfPresent(String.self, forKey: .formattedScheduledDepartureDate)
		formattedScheduledArrivalDate = try values.decodeIfPresent(String.self, forKey: .formattedScheduledArrivalDate)
		formattedScheduledDepartureTime = try values.decodeIfPresent(String.self, forKey: .formattedScheduledDepartureTime)
		formattedScheduledArrivalTime = try values.decodeIfPresent(String.self, forKey: .formattedScheduledArrivalTime)
	}

}