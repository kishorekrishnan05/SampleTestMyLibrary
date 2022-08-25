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
enum QuickView: String, Codable {
    case SSRs = "SSRs"
    case Status = "Status"
    
    
    
}

enum SSRsType : String{
    case Wheelchair = "WCHR"
    case DisabledPassengerDPNA = "Kih"
    case Lapchild = "Kis"
    case PetinCabin = "ksi"
    
    
    
    func SSRs() -> String {
        switch self {
        case .Wheelchair:
            return "eye"
        case .DisabledPassengerDPNA:
            return "action"
        case .Lapchild:
            return "eye"
        case .PetinCabin:
            return "eye"
        } /*{
           case SSRsType.DisabledPassengerDPNA:
           return "eye"
           /*case Day.Monday, Day.Tuesday, Day.Wednessday, Day.Thursday, Day.Friday
            return "Weekday"*/
           case .Wheelchair:
           return "whee"
           case .Lapchild:
           return "lap"
           case .PetinCabin:
           return "p"
           
           }*/
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


