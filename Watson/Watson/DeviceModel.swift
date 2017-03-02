//
//  DeviceModel.swift
//  Watson
//
//  Created by Manukonda, Anil-CW on 3/2/17.
//  Copyright © 2017 Anil. All rights reserved.
//

import Foundation

enum DeviceModel: String {
    
    static var deviceMap: [String:[String]] {
        return [
        "iPhone4S": ["iPhone4,1"],
        "iPhone5": ["iPhone5,1", "iPhone5,2"],
        "iPhone5C": ["iPhone5,3", "iPhone5,4"],
        "iPhone5S": ["iPhone6,1", "iPhone6,2"],
        "iPhone6": ["iPhone7,2"],
        "iPhone6Plus": ["iPhone7,1"],
        "iPhone6S": ["iPhone8,1"],
        "iPhone6SPlus": ["iPhone8,2"],
        "iPhone7": ["iPhone9,1", "iPhone9,3"],
        "iPhone7Plus": ["iPhone9,2", "iPhone9,4"],
        "iPad2": ["iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4"],
        "iPad3": ["iPad3,1", "iPad3,2", "iPad3,3"],
        "iPad4": ["iPad3,4", "iPad3,5", "iPad3,6"],
        "iPadAir": ["iPad4,1", "iPad4,2", "iPad4,3"],
        "iPadAir2": ["iPad5,3", "iPad5,4"],
        "iPadMini": ["iPad2,5", "iPad2,6", "iPad2,7"],
        "iPadMini2": ["iPad4,4", "iPad4,5", "iPad4,6"],
        "iPadMini3": ["iPad4,7", "iPad4,8", "iPad4,9"],
        "iPadMini4": ["iPad5,1", "iPad5,2"],
        "iPadPro9": ["iPad6,3", "iPad6,4"],
        "iPadPro12": ["iPad6,7", "iPad6,8"]
        ]
    }
    
    case iPhone4S
    case iPhone5
    case iPhone5C
    case iPhone5S
    case iPhoneSE
    case iPhone6
    case iPhone6Plus
    case iPhone6S
    case iPhone6SPlus
    case iPhone7
    case iPhone7Plus
    case iPad2
    case iPad3
    case iPad4
    case iPadAir
    case iPadAir2
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadPro9
    case iPadPro12
    case other
    
    static func deviceModel(for identifier: String) -> DeviceModel {
        guard let model = deviceMap.first(where: { $0.value.contains(identifier) }) else {
            return DeviceModel.other
        }
        return DeviceModel(rawValue: model.key) ?? DeviceModel.other
    }

}
