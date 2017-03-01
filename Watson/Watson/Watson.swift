//
//  Watson.swift
//  Watson
//
//  Copyright © 2017 Anil. All rights reserved.
//

import Foundation
import UIKit

public enum DeviceOSVersion {
    case iOS_9_below
    case iOS_9_or_above
    case iOS_10
    case iOS_11_or_above
    case iOS_unknown
    
    func description() -> String {
        return ProcessInfo.processInfo.operatingSystemVersionString
    }
}

public enum DeviceModel {
    //case
}

public class Watson {
    
    let agent = Watson()
    public let deviceOS: DeviceOSVersion
    public let deviceModel: DeviceModel
    
    private init() {
        deviceOS = iOSVersion()
    }
    
    func iOSVersion() -> DeviceOSVersion {
        
        let processInfo = ProcessInfo.processInfo
        switch (processInfo.operatingSystemVersion.majorVersion) {
        case (4..<9):
            return .iOS_9_below
        case (9):
            return .iOS_9_or_above
        case (10):
            return .iOS_10
        case (11...15):
            return .iOS_11_or_above
        default:
            return .iOS_unknown
        }
    }
    
    
    func deviceType() {
        debugPrint(ProcessInfo.processInfo.operatingSystemVersionString)
        debugPrint(ProcessInfo.processInfo.operatingSystemVersion)
    }
}
