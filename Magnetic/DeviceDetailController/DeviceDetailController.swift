//
//  DeviceDetailController.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 14.04.2024.
//

import UIKit


class DeviceDetailController: UIViewController {
    
    var viewModel: DeviceDetailViewModelType!
    
    private let screenHeight = UIScreen.main.bounds.height
    
    private var backgroundImage: UIImageView!
    private var attentionImage: UIImageView!
    private var stackView: UIStackView!
    private var stackViewConnect: UIStackView!
    private var stackViewIp: UIStackView!
    private var stackViewMac: UIStackView!
    private var stackViewHost: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Device Details"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        view.backgroundColor = UIColor(resource: .colorBackground)
        
        setupStackViewHost()
        setupStackViewMac()
        setupStackViewIp()
        setupStackViewConnect()
        setupBackgroundImageView()
        setupStackView()
        setupAttentionImage()
    }
}


extension DeviceDetailController {
    
    func setupBackgroundImageView() {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .attentionBackground)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        if screenHeight <= 667 {
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -82).isActive = true
        } else {
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -62).isActive = true
        }
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 330)
        ])
        self.backgroundImage = imageView
    }
    
    func setupAttentionImage() {
        let imageView = UIImageView()
        
        if viewModel.device?.imageCell == UIImage(resource: .attentionOk) {
            imageView.image = UIImage(resource: .attentionGreen)
        } else {
            imageView.image = UIImage(resource: .attentionRed)
        }
        
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor, constant: 22)
        ])
        self.attentionImage = imageView
    }
    
    func setupStackView() {
        let stackView = UIStackView()
        stackView.backgroundColor = UIColor(resource: .colorStackView)
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let deviceLabel = createLabel(size: 28, weight: .bold, text: "\(viewModel.device?.devices ?? "")")
        deviceLabel.textColor = UIColor(resource: .colorTitleStackView)
        deviceLabel.textAlignment = .center
        deviceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let ipLabel = createLabel(size: 15, weight: .bold, text: "\(viewModel.device?.ipAddress ?? "")")
        ipLabel.textAlignment = .center
        ipLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(deviceLabel)
        stackView.addArrangedSubview(ipLabel)
        stackView.addArrangedSubview(stackViewConnect)
        stackView.addArrangedSubview(stackViewIp)
        stackView.addArrangedSubview(stackViewMac)
        stackView.addArrangedSubview(stackViewHost)

        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 300),
            
            deviceLabel.heightAnchor.constraint(equalToConstant: 34),
            deviceLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 30),
            
            ipLabel.heightAnchor.constraint(equalToConstant: 40),
            ipLabel.topAnchor.constraint(equalTo: deviceLabel.bottomAnchor, constant: -40),
            
            stackViewConnect.topAnchor.constraint(equalTo: ipLabel.bottomAnchor, constant: 20),
            stackViewConnect.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            stackViewConnect.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
            
            stackViewIp.topAnchor.constraint(equalTo: stackViewConnect.bottomAnchor, constant: 20),
            stackViewIp.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            stackViewIp.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
            
            stackViewMac.topAnchor.constraint(equalTo: stackViewIp.bottomAnchor, constant: 20),
            stackViewMac.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            stackViewMac.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
            
            stackViewHost.topAnchor.constraint(equalTo: stackViewMac.bottomAnchor, constant: 20),
            stackViewHost.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 16),
            stackViewHost.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
            stackViewHost.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -20)

        ])
        self.stackView = stackView
    }
    
    func setupStackViewConnect() {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let nameConnectlabel = createLabel(size: 17, weight: .medium, text: "Connection Type")
        
        let wiFilabel = createLabel(size: 17, weight: .medium, text: "WiFi")
        wiFilabel.textAlignment = .right
        wiFilabel.textColor = UIColor(resource: .colorTitleGray)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameConnectlabel)
        stackView.addArrangedSubview(wiFilabel)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 35),
            
            nameConnectlabel.widthAnchor.constraint(equalToConstant: 240),
            nameConnectlabel.heightAnchor.constraint(equalToConstant: 22),
            
            wiFilabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            wiFilabel.heightAnchor.constraint(equalToConstant: 33)
        ])
        self.stackViewConnect = stackView
    }
    
    func setupStackViewIp() {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let nameIplabel = createLabel(size: 17, weight: .medium, text: "IP Address")
        
        let iPLabel = createLabel(size: 17, weight: .medium, text: "\(viewModel.device?.ipAddress ?? "" )")
        iPLabel.textAlignment = .right
        iPLabel.textColor = UIColor(resource: .colorTitleGray)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameIplabel)
        stackView.addArrangedSubview(iPLabel)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 35),
            
            nameIplabel.widthAnchor.constraint(equalToConstant: 140),
            nameIplabel.heightAnchor.constraint(equalToConstant: 22),
            
            iPLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            iPLabel.heightAnchor.constraint(equalToConstant: 33)
        ])
        self.stackViewIp = stackView
    }
    
    func setupStackViewMac() {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let nameMaclabel = createLabel(size: 17, weight: .medium, text: "MAC Address")
        
        let macLabel = createLabel(size: 17, weight: .medium, text: "\(viewModel.device?.macAddress ?? "" )")
        macLabel.textAlignment = .right
        macLabel.textColor = UIColor(resource: .colorTitleGray)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameMaclabel)
        stackView.addArrangedSubview(macLabel)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 35),
            
            nameMaclabel.widthAnchor.constraint(equalToConstant: 124),
            nameMaclabel.heightAnchor.constraint(equalToConstant: 22),
            
            macLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            macLabel.heightAnchor.constraint(equalToConstant: 33)
        ])
        self.stackViewMac = stackView
    }
    
    func setupStackViewHost() {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let nameHostlabel = createLabel(size: 17, weight: .medium, text: "Hostname")
        
        let hostLabel = createLabel(size: 17, weight: .medium, text: "\(viewModel.device?.hostName ?? "" )")
        hostLabel.textAlignment = .right
        hostLabel.textColor = UIColor(resource: .colorTitleGray)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameHostlabel)
        stackView.addArrangedSubview(hostLabel)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 35),
            
            nameHostlabel.widthAnchor.constraint(equalToConstant: 100),
            nameHostlabel.heightAnchor.constraint(equalToConstant: 22),
            
            hostLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 10),
            hostLabel.heightAnchor.constraint(equalToConstant: 33),
            
            
        ])
        self.stackViewHost = stackView
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
