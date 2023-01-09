//
//  File.swift
//  
//
//  Created by Kishore on 23/08/22.
//

import Foundation
import UIKit

public struct  ModelHeader{
    var height: CGFloat?
    var name: String?
    var configuration : String?
    var seatSize : CGFloat?
    var xyPositon : [ModelxyPosition]?
}

public struct  ModelxyPosition {
    var configuationChar : String?
    var xValue : CGFloat?
    var yValue : CGFloat?
}
