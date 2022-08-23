/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct SgementFlightStatus : Codable {
    public let estimatedDepartureDateTime : String?
    public let estimatedArrivalDateTime : String?
    public let actualDepartureDateTime : String?
    public let actualArrivalDateTime : String?
    public let departureTerminal : String?
    public let arrivalTerminal : String?
    public let departureGate : String?
    public let arrivalGate : String?
    public let ship : Ship?
    public let operatingCarrier : OperatingCarrier?
    public let codeShareCarrier : String?
    public let status : String?
    public let enableSeatMap : Bool?
    public let enableStandbyList : Bool?
    public let enableUpgradeList : Bool?
    public let enableAmenity : Bool?
    public let codeShareflightNumber : String?
    public let canPushNotification : Bool?
    public let isSegmentCancelled : Bool?
    public let getInBoundSegment : Bool?
    public let inBoundSegment : String?
    public let isWiFiAvailable : Bool?
    public let lastUpdatedGMT : String?
    public let pushNotificationRegId : String?
    public let statusShort : String?
    public let lastKnownDepartureTime : String?
    public let lastKnownDepartureTimeGMT : String?
    public let blockTime : String?
    public let flightTime : String?
    public let flightTimeChange : String?
    public let arrivalUTCDateTime : String?
    public let departureUTCDateTime : String?
    public let flightAttendantBoardTime : String?
    public let customerBoardTime : String?
    public let flightAttendantBaseCheckIn : String?
    public let flightAttendantDownLineCheckIn : String?
    public let flightAttendantBaseBoardTime : String?
    public let flightAttendantDownLineBoardTime : String?
    public let flightAttendantDeadheadBoardTime : String?
    public let baseFAsCheckInCrew : [String]?
    public let downlineFAsCheckInCrew : [String]?
    public let mixedCrew : [String]?
    public let minimumCrewToBoard : String?
    public let minimumCrewToDepart : String?
    public let mealBoarded : String?
    public let liquorBoarded : String?
    public let languageIncentivePayList : [String]?
    public let awardedJumpseatList : String?
    public let mealDescriptionList : [MealDescriptionList]?
    public let flightMiles : Int?
    public let marketingCarrier : MarketingCarrier?
    public let flightNumber : String?
    public let departure : Departure?
    public let arrival : Arrival?
    public let scheduledDeparture : ScheduledDeparture?
    public let scheduledArrival : ScheduledArrival?
    public let scheduledDepartureDateTime : String?
    public let scheduledArrivalDateTime : String?
    public let scheduledDepartureTimeGMT : String?
    public let scheduledArrivalTimeGMT : String?
    public let formattedScheduledDepartureDateTime : String?
    public let formattedScheduledArrivalDateTime : String?
    public let formattedScheduledDepartureDate : String?
    public let formattedScheduledArrivalDate : String?
    public let formattedScheduledDepartureTime : String?
    public let formattedScheduledArrivalTime : String?

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

    public init(from decoder: Decoder) throws {
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
