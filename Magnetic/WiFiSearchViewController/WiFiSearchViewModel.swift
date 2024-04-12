//
//  WiFiSearchViewModel.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 12.04.2024.
//

import UIKit

protocol WiFiSearchViewModelType: AnyObject {
    var onScanWiFiNetwork: ((Int) -> Void)? { get set }
    func scanCurrentNetwork()
}

class WiFiSearchViewModel: WiFiSearchViewModelType {
    var onScanWiFiNetwork: ((Int) -> Void)?
    
    func scanCurrentNetwork() {
        DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
            self?.onScanWiFiNetwork?(20)
        }
    }
}
