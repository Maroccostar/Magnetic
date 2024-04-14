//
//  File.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 14.04.2024.
//

import Foundation

protocol DeviceDetailViewModelType: AnyObject {
    var device: Device? { get }
}

class DeviceDetailViewModel: DeviceDetailViewModelType {
    let device: Device?
    
    init(device: Device?) {
        self.device = device
    }
}
