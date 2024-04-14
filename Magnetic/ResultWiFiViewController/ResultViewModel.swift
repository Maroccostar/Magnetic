//
//  ResultViewModel.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 14.04.2024.
//

protocol ResultViewModelType: AnyObject {
    var numberOfDevices: Int { get }
    func device(at index: Int) -> Device
    func processItemSelected(at index: Int)
    var onShowCellDetails: ((Device) -> Void)? { get set }
}

class ResultViewModel: ResultViewModelType {
    private var devices: [Device]
    
    init(devices: [Device] = Source.devices) {
        self.devices = devices
    }
    
    var numberOfDevices: Int {
        return devices.count
    }
    
    func device(at index: Int) -> Device {
        return devices[index]
    }
    
    func processItemSelected(at index: Int) {
        let device = devices[index]
        onShowCellDetails?(device)
    }
    
    var onShowCellDetails: ((Device) -> Void)?
}
