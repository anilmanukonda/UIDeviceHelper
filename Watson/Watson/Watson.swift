//
//  Watson.swift
//  Watson
//
//  Copyright © 2017 Anil. All rights reserved.
//

import Foundation
import UIKit

protocol WatsonInfo {}
extension Bool: WatsonInfo {}

public struct BatteryStats: WatsonInfo {
    var batteryLevel: Float = 0.0
    var batteryState: UIDeviceBatteryState = .unknown
    var isLowPowermodeEnabled: Bool = false
}

public struct Watson {
    
    private static let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
            isSim = true
        #endif
        return isSim
    }()
    
    private static var deviceInfo: DeviceInfo?
    static var batteryStats: BatteryStats?
    static var isBeaconsSupported = false
    static var is3DTouchSupported = false
    static var isLocationEnabled = false
    static var isProximityEnabled = false
    static var hasTouchId = false
    private init() {}
    
    static func scan(_ properties: DeviceProperties...) {
        debugPrint("Watson is starting investigation...🕵🏻")
        guard isSimulator else {
            debugPrint("Sorry..too busy playing crime tycoon on iOS simulator")
            return
        }
        for property in properties {
            switch property {
            case .battery:
                debugPrint("Recharging your battery...🔋")
                batteryStats = property.details()
            case .beacons:
                debugPrint("Checking for wireless bugs...🔌🔉")
                isBeaconsSupported = property.details() ?? false
            case .deviceInfo:
                debugPrint("Gathering device details... easy there... not your passwords📱")
                deviceInfo = property.details()
            case .forceTouch:
                debugPrint("Force touch or 3D touch...fat fingers📲")
                is3DTouchSupported = property.details() ?? false
            case .location:
                debugPrint("Locating you...just kidding🗺")
                isLocationEnabled = property.details() ?? false
            case .proximityMonitoring:
                isProximityEnabled = property.details() ?? false
            case .touchId:
                debugPrint("Gathering finger prints🖕🏼")
                hasTouchId = property.details() ?? false
            }
        }
        debugPrint("Case closed...🕵🏻")
    }
    
    static func operatingSystem() -> DeviceInfo.DeviceOS {
        return deviceInfo?.operatingSystem ?? .iOSUnknown
    }
    
    static func deviceModel() -> DeviceModel {
        return deviceInfo?.deviceModel ?? .other
    }
}
