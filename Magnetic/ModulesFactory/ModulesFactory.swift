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
}