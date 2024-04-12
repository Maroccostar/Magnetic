//
//  DetectionViewModel.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 04.04.2024.
//

import UIKit

protocol DetectionViewModelType {
    var onFieldDetection: ((Int) -> Void)? { get set }
    func searchMagneticField()
}


class DetectionViewModel: DetectionViewModelType {
    var onFieldDetection: ((Int) -> Void)?
    
    func searchMagneticField() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            let randomValue = Int.random(in: 10...95)
            self?.onFieldDetection?(randomValue)
        }
    }
    
}
