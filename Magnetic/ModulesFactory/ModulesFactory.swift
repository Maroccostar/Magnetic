//
//  ModulesFactory.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 07.04.2024.
//

import UIKit

final class ModulesFactory {
    static func createMagneticScreen() -> UIViewController {
        MagneticViewController()
    }
    
    static func createDetectionScreen() -> UIViewController {
        let viewModel = DetectionViewModel()
        let controller = DetectionViewController()
        controller.viewModel = viewModel
        return controller
    }
    
    static func createMainScreen() -> UIViewController {
        let viewModel = MainControllerViewModel()
        let controller = MainViewController()
        controller.viewModel = viewModel
        return controller
    }
    
    static func createWiFiScreen() -> UIViewController {
        let viewModel = WiFiSearchViewModel()
        let controller = WiFiSearchViewController()
        controller.viewModel = viewModel
        return controller
    }
    
    static func createResultWiFiScreen() -> UIViewController {
        let viewModel = ResultViewModel()
        let controller = ResultViewController()
        controller.viewModel = viewModel
        return controller
    }
    
    static func createDeviceDetailScreen(device: Device) -> UIViewController {
        let viewModel = DeviceDetailViewModel(device: device)
        let controller = DeviceDetailController()
        controller.viewModel = viewModel
        return controller
    }
}
