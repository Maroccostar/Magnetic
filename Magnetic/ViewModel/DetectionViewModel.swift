//
//  DetectionViewModel.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 04.04.2024.
//

import UIKit

protocol DetectionViewModelType {
    var onFieldDetection: ((Double) -> Void)? { get set }
    func searchMagneticField()
}


class DetectionViewModel: DetectionViewModelType {
    var onFieldDetection: ((Double) -> Void)?
    
    func searchMagneticField() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.onFieldDetection?(60)
        }
    }
    
}
