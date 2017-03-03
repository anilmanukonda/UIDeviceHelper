//
//  DeviceProperties.swift
//  Watson
//
//  Copyright © 2017 Anil. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication
import CoreLocation

public enum DeviceProperties {
    case battery
    case deviceInfo
    case forceTouch
    case touchId
    case proximityMonitoring
    case beacons
    case location
    
    func details<T: WatsonInfo>() -> T? {
        switch self {
        case .battery:
            UIDevice.current.isBatteryMonitoringEnabled = true
            let stats = BatteryStats(
                batteryLevel: UIDevice.current.batteryLevel,
                batteryState: UIDevice.current.batteryState,
                isLowPowermodeEnabled: ProcessInfo.processInfo.isLowPowerModeEnabled
            )
            return stats as? T
        case .deviceInfo:
            return DeviceInfo() as? T
        case .touchId:
            var error: NSError?
            return LAContext().canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) as? T
        case .proximityMonitoring:
            return UIDevice.current.isProximityMonitoringEnabled as? T
        case .beacons:
            return CLLocationManager.isRangingAvailable() as? T
        case .location:
            return CLLocationManager.locationServicesEnabled() as? T
        case .forceTouch:
            guard let keyWindow = UIApplication.shared.keyWindow else { return false as? T }
            return (keyWindow.traitCollection.forceTouchCapability == .available) as? T
        }
    }

    public static func all() -> [DeviceProperties] {
        return [.battery, .deviceInfo, .forceTouch, .touchId, .proximityMonitoring, .beacons, .location]
    }
}
