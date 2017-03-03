//
//  BatteryStats.swift
//  Watson
//
//  Copyright © 2017 Anil. All rights reserved.
//

import Foundation
import UIKit

public struct BatteryStats: WatsonInfo {
    var batteryLevel: Float = 0.0
    var batteryState: UIDeviceBatteryState = .unknown
    var isLowPowermodeEnabled: Bool = false
}
