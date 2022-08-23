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
    case OpenSeats = "O"
    case OpenEconomyPlusSeats = "S"

    var backgroundColor: UIColor {
        switch self {
        case .occuipedSeats:
            return .colorSeatGray
        case .OpenSeats , .OpenEconomyPlusSeats:
            return .white
    }
    }
        var borderColor: UIColor {
            switch self {
            case .occuipedSeats ,.OpenSeats :
                return .colorFordGray
            case .OpenEconomyPlusSeats:
                return .colorBlue
        }
    }
}
