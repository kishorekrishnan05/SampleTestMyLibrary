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
public enum QuickViewOptionSelected: String {
    case none = ""
    case sSRs = "SSRs"
    case Status = "Status"
    
    
    
}

public enum SSRsType : String{
    case none = ""
    case wheelchair = "WCHR"
    case wheelchair1 = "WCBD"
    case wheelchair2 = "WCBW"
    case wheelchair3 = "WCHC"
    case wheelchair4 = "WCHS"
    case wheelchair5 = "WCMP"
    case disabledPassengerDPNA = "DPNA"
    case Lapchild = "INFT"
    case petinCabin = "PETC"
    case unaccompaniedminor = "UMNR"
    case bassinet = "BSCT"
    case hearingimpaired = "DEAF"
    case visionimpaired = "BLND"
    case language = "LANG"
    case deportedprisoner = "DEPA"
    case deportedprisoner1 = "DEPU"
    case deportedprisoner2 = "ACPR"
    case aIND = "AIND"
    case aLEO = "ALEO"
    case serviceanimal = "ESAN"
    case serviceanimal1 = "SVAN"
    case medicalO2 = "OXYG"
    case medicalO21 = "PPOC"
    case medicalO22 = "MEDA"
    case voluntaryprovisionsofemergencyservice = "VPES"
    case nonGovernment = "NGTR"
    case personalProtective  = "PPEX"
    case governmentEscort  = "GSME"
    case childTravelingwithGovernmentEscort = "GSMC"
    case yPTA = "YPTA"
    case extraSeat = "EXST"
    case extraSeat1 = "CBBG"

    
    
    
    func SSRs() -> String {
        switch self {
        case .none:
            return ""
        case .wheelchair , .wheelchair1 , .wheelchair2 , .wheelchair3 ,.wheelchair4,.wheelchair5:
            return "SSR_Wheelchair"
        case .disabledPassengerDPNA:
            return "SSR_DPNA_full"
        case .Lapchild:
            return "SSR_LapChild"
        case .petinCabin:
            return "SSR_pet_full"
        case .unaccompaniedminor:
            return "SSR_mi_full"
        case .bassinet:
            return "SSR_bass_full"
        case .hearingimpaired:
            return "SSR_hi_full"
        case .visionimpaired:
            return "SSR_vi_full"
        case .language:
            return "SSR_message_full"
        case .deportedprisoner , .deportedprisoner1 , .deportedprisoner2:
            return "SSR_ha_full"
        case .aIND , .aLEO:
            return "SSR_AIND_full"
        case .serviceanimal , .serviceanimal1:
            return "SSR_add pet_full"
        case .medicalO2 , .medicalO21 , .medicalO22:
            return "SSR_ox_full"
        case .voluntaryprovisionsofemergencyservice:
            return "SSR_es_full"
        case .nonGovernment:
            return "SSR_nonGovt"
        case .personalProtective:
            return "SSR_PPEX_full"
        case .governmentEscort:
            return "SSR_escort_full"
        case .childTravelingwithGovernmentEscort:
            return "SSR_child_full"
        case .yPTA:
            return "SSR_YPTA_full"
        case .extraSeat , .extraSeat1:
            return "SSR_ssr_exst_full"
        }
    }
}
public enum StatusType : String{
    case none = ""
    case globalServices = "GS"//
    case oneK = "1K"//
    case premierPlatinum = "PLATINUM"//
    case premierGold = "GOLD"//
    case premierSilver = "SILVER"//
    case generalMember = "GM"
    case starAllianceGold = "Gold"//
    case starAllianceSilver = "Silver"//
    case starAllianceNonMember = "Non" //


    
    
    
    func Status() -> String {
        switch self {
        case .none:
            return ""
        case .globalServices:
            return "ic_mp_status_Global Services"
        case .oneK:
            return "ic_mp_status_1K"
        case .premierPlatinum:
            return "ic_mp_status_Platinum"
        case .premierGold:
            return "ic_mp_status_Gold"
        case .premierSilver:
            return "ic_mp_status_Silver"
        case .generalMember:
            return "ic_mp_status_GM"
        case .starAllianceGold:
            return "ic_mp_status_StarAllianceGold"
        case .starAllianceSilver:
            return "ic_mp_status_StarAllianceSilver"
        case .starAllianceNonMember:
            return ""
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


