//
//  File.swift
//  
//
//  Created by Kishore on 23/08/22.
//

import Foundation
import UIKit

enum SeatsColor: String, Codable {
    case occuipedSeats = "X"
    case openSeats = "O"
    case openEconomyPlusSeats = "P"
    case openPremiumPlus = "S"
    
    var backgroundColor: UIColor {
        switch self {
        case .occuipedSeats:
            return .colorSeatGray
        case .openSeats , .openEconomyPlusSeats , .openPremiumPlus:
            return .white
        }
    }
    var borderColor: UIColor {
        switch self {
        case .occuipedSeats ,.openSeats :
            return .colorFordGray
        case .openPremiumPlus:
            return .colorBlue
        case .openEconomyPlusSeats:
            return .black
        }
    }
}
public enum QuickView: String, Codable {
    case SSRs = "SSRs"
    case Status = "Status"
    
    
    
}

public enum SSRsType : String{
    case Wheelchair = "WCHR"
    case DisabledPassengerDPNA = "A1"
    case Lapchild = "A2"
    case PetinCabin = "A3"
    case Unaccompaniedminor = "A4"
    case Bassinet = "A5"
    case Hearingimpaired = "A6"
    case Visionimpaired = "A7"
    case Language = "A8"
    case Deportedprisoner = "A9"
    case AINDALFO = "A10"
    case Serviceanimal = "A11"
    case MedicalO2 = "A12"
    case Voluntaryprovisionsofemergencyservice = "A13"
    case NonGovernment = "A14"
    case PersonalProtective  = "A15"
    case GovernmentEscort  = "A16"
    case ChildTravelingwithGovernmentEscort = "A17"
    case YPTA = "A18"

    
    
    
    func SSRs() -> String {
        switch self {
        case .Wheelchair:
            return "Wheelchair"
        case .DisabledPassengerDPNA:
            return "SSR_DPNA_full"
        case .Lapchild:
            return "LapChild"
        case .PetinCabin:
            return "SSR_pet_full"
        case .Unaccompaniedminor:
            return "SSR_mi_full"
        case .Bassinet:
            return "SSR_bass_full"
        case .Hearingimpaired:
            return "SSR_hi_full"
        case .Visionimpaired:
            return "SSR_vi_full"
        case .Language:
            return "SSR_message_full"
        case .Deportedprisoner:
            return "SSR_ha_full"
        case .AINDALFO:
            return "SSR_AIND_full"
        case .Serviceanimal:
            return "SSR_add pet_full"
        case .MedicalO2:
            return "SSR_ox_full"
        case .Voluntaryprovisionsofemergencyservice:
            return "SSR_es_full"
        case .NonGovernment:
            return "nonGovt"
        case .PersonalProtective:
            return "SSR_PPEX_full"
        case .GovernmentEscort:
            return "SSR_escort_full"
        case .ChildTravelingwithGovernmentEscort:
            return "SSR_child_full"
        case .YPTA:
            return "SSR_YPTA_full"
        }
    }
}
/*enum Bar : String{
 case unknown
 case secondCase
 var background : String {
 switch self {
 case .secondCase:
 return "colorFordGray"
 case .unknown:
 return "Colore"
 }
 }
 }
 
 enum Foo {
 
 case bar((Bar) -> String)
 case thirdCase
 }*/
/*enum QuickViewSelected : String{
 case SSRs = "SSRs"
 case Status = "Status"
 var type: String? {
 
 switch self {
 case .SSRs(let ):
 return clay.clayType
 case .flux(let flux):
 return flux.fluxType
 case .stain(let stain):
 return stain.stainType
 case .glassFormer, .accessoryMaterial, .all:
 return nil
 }
 }
 
 /*var bo : SSRsType{
  switch self {
  case .SSRs
  return SSRsType.SSRs(.DisabledPassengerDPNA)
  case .Status:
  return SSRsType
  }
  }*/
 }
 
 func dayType(for day: Day) {
 switch day {
 case Day.Saturday, Day.Sunday:
 return "Weekend"
 case Day.Monday, Day.Tuesday, Day.Wednessday, Day.Thursday, Day.Friday
 return "Weekday"
 }
 }
 
 let result1 = dayType(for: Day.Sunday)
 
 
 
 /** Rewriting the date type function */
 func dayType(for day: SSRsType) -> String {
 switch day {
 case SSRsType.DisabledPassengerDPNA:
 return "Weekend"
 /*case Day.Monday, Day.Tuesday, Day.Wednessday, Day.Thursday, Day.Friday
  return "Weekday"*/
 case .Wheelchair:
 return "Weekend"
 case .Lapchild:
 return "Weekend"
 case .PetinCabin:
 return "Weekend"
 }
 }
 
 let result1 = dayType(for: Day.Sunday)*/


