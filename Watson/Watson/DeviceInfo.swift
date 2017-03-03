//
//  DeviceInfo.swift
//  Watson
//
//  Copyright © 2017 Anil. All rights reserved.
//

import Foundation

public struct DeviceInfo: WatsonInfo {
    
    public enum DeviceOS: WatsonInfo {
        case iOSTooOld
        case iOS9
        case iOS9Variant
        case iOS10
        case iOS10Variant
        case iOS10Plus
        case iOSUnknown
        
        func description() -> String {
            return ProcessInfo.processInfo.operatingSystemVersionString
        }
    }
    
    public var operatingSystem: DeviceOS {
        return self.osVersion()
    }
    
    public var deviceModel: DeviceModel {
        return DeviceModel.deviceModel(for: platform())
    }
    
    private func osVersion() -> DeviceOS {
        let processInfo = ProcessInfo.processInfo
        switch (processInfo.operatingSystemVersion.majorVersion, processInfo.operatingSystemVersion.minorVersion) {
        case (4..<9, _):
            return .iOSTooOld
        case (9, 0):
            return .iOS9
        case (9, 0...9):
            return .iOS9Variant
        case (10, 0):
            return .iOS10
        case (10, 0...9):
            return .iOS10Variant
        case (11...15, _):
            return .iOS10Plus
        default:
            return .iOSUnknown
        }
    }
    
    private func platform() -> String {
        var sysinfo = utsname()
        uname(&sysinfo)
        guard let deviceSystemName = String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii) else {
            return "unknown"
        }
        return deviceSystemName.trimmingCharacters(in: .controlCharacters)
    }
}
