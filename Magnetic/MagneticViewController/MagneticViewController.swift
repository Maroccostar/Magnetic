//
//  ViewController.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 04.04.2024.
//

import UIKit

class MagneticViewController: UIViewController {
    

    override func viewDidLoad() {
         super.viewDidLoad()
        
        navigationItem.titleView = UIView()
        title = "Main"
        view.backgroundColor = UIColor(resource: .colorBackground)
        setButton()
    }
}

// MARK: - Private
private extension MagneticViewController {
    func setButton() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(resource: .imageMagnetLogo), for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "Magnetic"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(label)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc func buttonTapped() {
        let vc = ModulesFactory.createMainScreen()
        navigationController?.pushViewController(vc, animated: true)
    }
}

