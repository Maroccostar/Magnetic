//
//  WiFiSearchViewController.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 12.04.2024.
//

import UIKit

class WiFiSearchViewController: UIViewController {
    
    var viewModel: WiFiSearchViewModelType!
    
    private var percentLabel: UILabel!
    private var imageGif: UIImageView!
    private var stopButton: UIButton!
    private var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(resource: .colorBackground)
        title = "Scan"

        setupViewModelValue()
        setupGifImageView()
        setupStackViewOne()
        setupPercentLabel()
        setupStopButton()
        setupStackViewTwo()
    }
}


// MARK: - Private
private extension WiFiSearchViewController {
    
    func setupViewModelValue() {
        viewModel.onScanWiFiNetwork = { [weak self] value in
            self?.updatePercentLabel(with: "\(value)%")
        }
    }

    func setupGifImageView() {
        let imageView = UIImageView()
        imageView.loadGif(name: "gifAnimation")
        imageView.contentMode = .scaleAspectFit

        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 10),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
        
        self.imageGif = imageView
    }
    
    func updatePercentLabel(with value: String) {
        DispatchQueue.main.async { [weak self] in
            self?.percentLabel.text = value
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            let vc = ModulesFactory.createResultWiFiScreen()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func setupPercentLabel() {
        let label = createLabel(size: 17, weight: .semibold, text: "\(viewModel.scanCurrentNetwork())")
        label.textAlignment = .center
        imageGif.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: imageGif.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: imageGif.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 44),
            label.heightAnchor.constraint(equalToConstant: 32),
        ])
        
        self.percentLabel = label
    }
    
    func setupStackViewOne() {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = createLabel(size: 15, weight: .regular, text: "Scanning Your Wi-Fi")
        let labelTwo = createLabel(size: 28, weight: .bold, text: "TLind_246_lp")
        labelTwo.textColor = UIColor(resource: .colorTitleStackView)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(labelTwo)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 60),
            stackView.widthAnchor.constraint(equalToConstant: 350),
            stackView.bottomAnchor.constraint(greaterThanOrEqualTo: imageGif.topAnchor, constant: -30)
        ])
    }
    
    func setupStackViewTwo() {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = createLabel(size: 28, weight: .bold, text: "23")
        label.textColor = UIColor(resource: .colorTitleStackView)
        
        let labelTwo = createLabel(size: 17, weight: .semibold, text: "Devices Found...")
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(labelTwo)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(greaterThanOrEqualTo: imageGif.bottomAnchor, constant: 30),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 35),
            stackView.widthAnchor.constraint(equalToConstant: 182),
            stackView.bottomAnchor.constraint(equalTo: stopButton.topAnchor, constant: -50),
            
            label.widthAnchor.constraint(equalToConstant: 42),
            labelTwo.heightAnchor.constraint(equalToConstant: 33)
            
        ])
        
        self.stackView = stackView
    }
    
    func setupStopButton() {
        let button = UIButton(type: .system)
        button.setTitle("Stop", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = UIColor(resource: .colorButton)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        self.stopButton = button
    }

    
    // MARK: - Create
    func createLabel(size: CGFloat, weight: UIFont.Weight, text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        return label
    }
}
