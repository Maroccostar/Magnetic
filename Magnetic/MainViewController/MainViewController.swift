//
//  MainViewController.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 11.04.2024.
//

import UIKit

enum DetectionVariant: Int, CaseIterable {
    case infared = 1
    case bluetooth = 2
    case magnetic = 3
    case antispy = 4
    
    var nameLabel: String {
        switch self {
        case .infared:
            "Infrared Detection"
        case .bluetooth:
            "Bluetooth Detection"
        case .magnetic:
            "Magnetic Detection"
        case .antispy:
            "Antispy Tips"
        }
    }
    
    var image: UIImage {
        switch self {
        case .infared:
            UIImage(resource: .camera)
        case .bluetooth:
            UIImage(resource: .bluetooth)
        case .magnetic:
            UIImage(resource: .magnet)
        case .antispy:
            UIImage(resource: .antyspy)
        }
    }
    
    
}

class MainViewController: UIViewController {
    
    var viewModel: MainControllerViewModelType!
    
    private var backgroundImageView: UIImageView!
    private var stackViewScan: UIStackView!
    private var stackViewBloksOne: UIStackView!
    private var stackViewBloksTwo: UIStackView!
    
    private var scanButton: UIButton!
    
    private let screenHeight = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Main"
        view.backgroundColor = UIColor(resource: .colorBackground)
        
        setupNavBar()
        setupBackgroundImageView()
        setupStackViewScan()
        setupStackViewBlocksOne()
        setupStackViewBloksTwo()
        setupViewModelBloks()
    }
}

// MARK: Private
private extension MainViewController {

    func setupViewModelBloks() {
        viewModel.onShowFieldDetector = { [weak self] in
            let vc = ModulesFactory.createDetectionScreen()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    var constrSize: CGFloat {
        screenHeight < 668 ? 18 : 28
    }
    
    var constrHeightAnchor: CGFloat {
        screenHeight < 668 ? 28 : 44
    }
    
    var constrTopAnchor: CGFloat {
        screenHeight < 668 ? 6 : 36
    }
    
    var constrHeightAnchorTwo: CGFloat {
        switch screenHeight {
        case ...667:
            return 120
        case 926...:
            return 140
        default:
            return 130
        }
    }

    func setupNavBar() {
        let symbolImage = UIImage(systemName: "slider.vertical.3")
        let rightBarButtonItem = UIBarButtonItem(image: symbolImage, style: .plain, target: self, action: #selector(rightBarButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @objc func rightBarButtonTapped() { }
    
    func setupBackgroundImageView() {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .backgroundMain)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        if screenHeight <= 667 {
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 28).isActive = true
        } else {
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -28).isActive = true
        }
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.heightAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
        ])
        self.backgroundImageView = imageView
    }
    
    func createLabel(size: CGFloat, weight: UIFont.Weight, text: String) -> UILabel {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        return label
    }
    
    func setupStackViewScan() {
        let stackView = UIStackView()
        stackView.backgroundColor = UIColor(resource: .colorStackView)
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        let firstLabel = createLabel(size: 15, weight: .regular, text: "Current Wi-FI")
        firstLabel.textColor = UIColor.white
        firstLabel.textAlignment = .center
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(firstLabel)
        
        let secondLabel = createLabel(size: constrSize, weight: .bold, text: "WiFI_Name")
        secondLabel.textColor = UIColor(resource: .colorTitleStackView)
        secondLabel.textAlignment = .center
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(secondLabel)

        let thirdLabel = createLabel(size: 17, weight: .regular, text: "Ready to scan this network")
        thirdLabel.textColor = UIColor(resource: .colorTitleGray)
        thirdLabel.textAlignment = .center
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(thirdLabel)
        
        let button = UIButton(type: .system)
        button.setTitle("Scan current network", for: .normal)
        button.addTarget(self, action: #selector(scanTapBtn), for: .touchUpInside)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = UIColor(resource: .colorButton)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(button)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 200),
    
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leadingAnchor.constraint(equalTo: stackView.leadingAnchor,constant: 16),
            button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16),
        ])

        self.stackViewScan = stackView
    }
    
    @objc func scanTapBtn() {
        
    }
    
    @objc func selectVariant(sender: UIGestureRecognizer) {
        guard let selectedView = sender.view,
        let detectionVariant = DetectionVariant(rawValue: selectedView.tag) else { return }
        
        selectedView.layer.borderWidth = 2
        selectedView.layer.borderColor = UIColor.white.cgColor
        UIView.animate(options: .curveEaseInOut, animations: {
            selectedView.layer.borderWidth = 0
        }) { [weak self] _ in
            self?.viewModel.processDetectionSelection(detectionVariant: detectionVariant)
        }
    }
    
    // MARK: - Create view
    func createDetectionVariant(variant: DetectionVariant) -> UIView {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectVariant(sender: )))
        
        let detectionView = UIView()
        detectionView.backgroundColor = UIColor(resource: .color4ElementsStack)
        detectionView.translatesAutoresizingMaskIntoConstraints = false
        detectionView.layer.cornerRadius = 8
        detectionView.tag = variant.rawValue
        detectionView.addGestureRecognizer(tapGesture)
        
        let imageView = UIImageView(image: variant.image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        detectionView.addSubview(imageView)
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 0
        vStack.alignment = .center
        vStack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        vStack.isLayoutMarginsRelativeArrangement = true
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        let enumLabel = createLabel(size: 17, weight: .medium, text: "\(variant.nameLabel)")
        
        vStack.addArrangedSubview(enumLabel)
        detectionView.addSubview(vStack)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 35),
            imageView.heightAnchor.constraint(equalToConstant: constrHeightAnchor),
            imageView.topAnchor.constraint(equalTo: detectionView.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: detectionView.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: vStack.topAnchor, constant: -8),
            
            vStack.centerXAnchor.constraint(equalTo: detectionView.centerXAnchor),
            vStack.heightAnchor.constraint(equalToConstant: 50),
            vStack.widthAnchor.constraint(equalToConstant: 90),
            vStack.bottomAnchor.constraint(equalTo: detectionView.bottomAnchor, constant: -16),
        ])
        
        return detectionView
    }
    
    func setupStackViewBlocksOne() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 40
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        let firstTwoCases = Array(DetectionVariant.allCases.prefix(2))
        firstTwoCases.forEach { variant in
            stackView.addArrangedSubview(createDetectionVariant(variant: variant))
        }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: stackViewScan.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: constrHeightAnchorTwo),
            stackView.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        self.stackViewBloksOne = stackView
    }

    func setupStackViewBloksTwo() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 40
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        let lastTwoCases = Array(DetectionVariant.allCases.suffix(2))
        lastTwoCases.forEach { variant in
            stackView.addArrangedSubview(createDetectionVariant(variant: variant))
        }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: stackViewBloksOne.bottomAnchor, constant: constrTopAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: constrHeightAnchorTwo),
            stackView.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        self.stackViewBloksTwo = stackView
    }
}
