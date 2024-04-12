//
//  MainControllerViewModel.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 11.04.2024.
//

import Foundation

protocol MainControllerViewModelType: AnyObject {
    var onShowFieldDetector: (() -> Void)? { get set }
    func processDetectionSelection(detectionVariant: DetectionVariant)
}

class MainControllerViewModel: MainControllerViewModelType {
    var onShowFieldDetector: (() -> Void)?
    
    func processDetectionSelection(detectionVariant: DetectionVariant) {
        switch detectionVariant {
        case .magnetic:
            onShowFieldDetector?()
        default:
#warning("implement support of the other types")
            return
        }
    }
}
