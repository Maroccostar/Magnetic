//
//  DetectionViewController.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 04.04.2024.
//  final version

import UIKit

class DetectionViewController: UIViewController {
    
    var viewModel: DetectionViewModelType!
    
    private var backgroundImage: UIImageView!
    private var scaleImageView: UIImageView!
    private var circleImageView: UIImageView!
    private var poligonImageView: UIImageView!
    private var searchLabel: UILabel!
    private var searchButton: UIButton!
    private var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(resource: .colorBackground)
        
        title = "Magnetic Detection"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        setupBackgroundImageView()
        setupScaleImageView()
        setupSearchLabel()
        setupCircleImageView()
        setupPoligonImageView()
        setupSearchButton()
        
        viewModel.onFieldDetection = { [weak self] value in
            self?.updateSearchLabel(with: "\(value) uT")
            self?.rotateCircle(toValue: CGFloat(value))
            
        }
    }
}


// MARK: - Private
private extension DetectionViewController {
    
    func setupBackgroundImageView() {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .imageMagnet)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 330)
        ])
        self.backgroundImage = imageView
    }
    
    func setupScaleImageView() {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .imageScale)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 48),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 180)
        ])
        self.scaleImageView = imageView
    }

    func setupCircleImageView() {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .ellipse)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: scaleImageView.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: searchLabel.topAnchor, constant: -52),
            imageView.topAnchor.constraint(equalTo: scaleImageView.bottomAnchor, constant: -20),
            imageView.widthAnchor.constraint(equalToConstant: 32),
            imageView.heightAnchor.constraint(equalToConstant: 32)
        ])
        self.circleImageView = imageView
    }
    
    func rotateCircle(toValue value: CGFloat) {
        UIView.animate(withDuration: 0.3) {
            guard let circle = self.circleImageView else { return }
            
            let rotationAngle = (.pi * value) / 100
            
            let transform = CGAffineTransform(rotationAngle: rotationAngle)
            circle.transform = transform
        }
    }
    
    func resetRotateCircle() {
        UIView.animate(withDuration: 1.5) {
            self.circleImageView?.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
    
    func setupPoligonImageView() {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .imagePolygon)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        circleImageView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: circleImageView.topAnchor, constant: 6),
            imageView.leadingAnchor.constraint(equalTo: circleImageView.leadingAnchor, constant: -78),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        self.poligonImageView = imageView
    }
    
    func setupSearchLabel() {
        let label = UILabel()
        label.text = "Search cheking"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 160),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
        self.searchLabel = label
    }
    
    func blinkSearchLabel() {
        UIView.animate(withDuration: 0.8, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.searchLabel.alpha = 0
        }, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            UIView.animate(withDuration: 0.3) {
                self.searchLabel.alpha = 1
            }
        }
    }
    
    func setupSearchButton() {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = UIColor(resource: .colorButton)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.topAnchor.constraint(greaterThanOrEqualTo: searchLabel.bottomAnchor, constant: 40),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        searchButton = button
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    func updateSearchLabel(with value: String) {
        DispatchQueue.main.async { [weak self] in
            self?.searchLabel.text = value
        }
    }
    
    @objc private func searchButtonTapped() {
        if isSearching {
            searchButton.setTitle("Search", for: .normal)
            resetRotateCircle()
        } else {
            viewModel.searchMagneticField()
            searchButton.setTitle("Stop", for: .normal)
            blinkSearchLabel()
        }
        isSearching.toggle()
        updateSearchLabel(with: "Search cheking")
    }
}
