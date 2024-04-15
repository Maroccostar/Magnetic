//
//  WiFiSearchViewModel.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 12.04.2024.
//

import UIKit

protocol WiFiSearchViewModelType: AnyObject {
    var onScanWiFiNetwork: ((Int) -> Void)? { get set }
    var onSearchFinished: (([Device]) -> Void)? { get set }
    func scanCurrentNetwork()
}

class WiFiSearchViewModel: WiFiSearchViewModelType {
    var onScanWiFiNetwork: ((Int) -> Void)?
    var onSearchFinished: (([Device]) -> Void)?
    
    func scanCurrentNetwork() {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            self?.onScanWiFiNetwork?(20)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            self?.onScanWiFiNetwork?(100)
            self?.onSearchFinished?(Source.devices)
        }
    }
}
