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
