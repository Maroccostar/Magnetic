//
//  ResultModel.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 14.04.2024.
//

import UIKit


struct Device {
    let name: String?
    let imageCell: UIImage
    let ipAddress: String
    let macAddress: String
    let hostName: String
    let devices: String
}

struct ImageCellDetail {
    static let attentionGreen = UIImage(resource: .attentionGreen)
    static let attentionRed = UIImage(resource: .attentionRed)
}

struct ImageCell {
    static var currentImage: UIImage?
    
    static func randomImage() -> UIImage? {
        let imageNames = ["attentionOk", "attentionError"]
        let randomIndex = Int.random(in: 0..<imageNames.count)
        if let image = UIImage(named: imageNames[randomIndex]) {
            currentImage = image
            return image
        } else {
            return nil
        }
    }
}

struct RandomIPAddress {
    static func generateRandomIPAddress() -> String {
        var ipAddress = ""
        for _ in 0..<4 {
            let octet = Int.random(in: 0..<256)
            ipAddress += "\(octet)"
            if ipAddress.count < 11 {
                ipAddress += "."
            }
        }
        return ipAddress
    }
}

struct RandomMacAddress {
    static func generateRandomMac() -> String {
        var macAddress = ""
        for _ in 0..<6 {
            let randomByte = String(format:"%02X", arc4random_uniform(255))
            macAddress += randomByte
            if macAddress.count < 12 {
                macAddress += "-"
            }
        }
        return macAddress
    }
}

struct RandomHostName {
    static func generateRandomHostName() -> String {
        let prefix = ["gwpc", "router", "device", "pc", "server", "host", "terminal", "gateway"]
        let suffix = Int.random(in: 10000000..<99999999)
        let randomPrefix = prefix.randomElement() ?? "gwpc"
        return "\(randomPrefix)-\(suffix).local"
    }
}

struct RandomDeviceType {
    static func generateRandomDeviceType() -> String {
        let deviceTypes = ["Phone", "Camera", "Printer", "Monitor"]
        return deviceTypes.randomElement() ?? "undefined"
    }
}

struct Source {
    static var devices: [Device] {
        return [
            .init(name: "TechConnect", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "CyberWave", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "NetPulse", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "VelocityNet", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "SkyFi", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "TurboNet", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "SmartLink", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "SpeedBoost",imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "AirConnect", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "FastLane", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "PowerNet", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "LinkBoost", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "WaveTech", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "QuickLink", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "StreamNet", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "RapidWave", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "NovaNet", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "ZoomNet", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "SparkLink", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType()),
            .init(name: "InfinityNet", imageCell: ImageCell.randomImage()!, ipAddress: RandomIPAddress.generateRandomIPAddress(), macAddress: RandomMacAddress.generateRandomMac(), hostName: RandomHostName.generateRandomHostName(), devices: RandomDeviceType.generateRandomDeviceType())
        ]
    }
}
