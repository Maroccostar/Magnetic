//
//  ResultWiFiViewController.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 12.04.2024.
//

import UIKit

class ResultViewController: UIViewController {
    
    var viewModel: ResultViewModelType!
    
    let tableView: UITableView = .init()
    
    private var stackView: UIStackView!
    private var wiFilabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(resource: .colorBackground)
        extendedLayoutIncludesOpaqueBars = true
        
        setupTableView()
        setupViewModel()
        setupLabel()
        setupStackView()

    }
}

// MARK: - UITableViewDataSource
extension ResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfDevices
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeviceCell", for: indexPath) as? DeviceCell else { fatalError() }
        cell.backgroundColor = UIColor(resource: .colorStackView)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.configure(device: viewModel.device(at: indexPath.row))
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ResultViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        let selectedColor = UIColor(resource: .color4ElementsStack)
        UIView.animate() {
            cell.contentView.backgroundColor = selectedColor
        }
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            UIView.animate(withDuration: 0.3) {
                cell.contentView.backgroundColor = UIColor(resource: .colorStackView)
            }
        }
        viewModel.processItemSelected(at: indexPath.row)
    }
}

// MARK: - ResultViewController
extension ResultViewController {
    
    func setupTableView() {
        tableView.register(DeviceCell.self, forCellReuseIdentifier: "DeviceCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.backgroundColor = UIColor(resource: .colorBackground)
    }
    
    func showDeviceDetails(_ device: Device) {
        let vc = ModulesFactory.createDeviceDetailScreen(device: device)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupViewModel() {
        viewModel = ResultViewModel()
        viewModel.onShowCellDetails = { [weak self] detail in
            self?.showDeviceDetails(detail)
        }
    }
    
    func setupStackView() {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = createLabel(size: 28, weight: .bold, text: "\(viewModel.numberOfDevices)")
        label.textAlignment = .left
        label.textColor = UIColor(resource: .colorTitleStackView)
        
        let labelTwo = createLabel(size: 28, weight: .bold, text: "Devices")
        labelTwo.textColor = .white
        labelTwo.textAlignment = .left
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(labelTwo)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 35),
            stackView.widthAnchor.constraint(equalToConstant: 160),
            stackView.bottomAnchor.constraint(equalTo: wiFilabel.bottomAnchor, constant: -25),
            
            label.widthAnchor.constraint(equalToConstant: 40),
            labelTwo.heightAnchor.constraint(equalToConstant: 33)
            
        ])
        self.stackView = stackView
    }
    
    func setupLabel() {
        let label = createLabel(size: 15, weight: .medium, text: "WIFI_Name")
        label.textColor = UIColor(resource: .colorTitleGray)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 160),
            label.heightAnchor.constraint(equalToConstant: 20),
            label.bottomAnchor.constraint(greaterThanOrEqualTo: tableView.topAnchor, constant: -44)
        ])
        self.wiFilabel = label
    }
    
    // MARK: - Create
    func createLabel(size: CGFloat, weight: UIFont.Weight, text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.numberOfLines = 0
        label.textAlignment = .center
        label.layer.borderColor = UIColor.yellow.cgColor
        label.layer.borderWidth = 0
        label.font = UIFont.systemFont(ofSize: size, weight: weight)
        return label
    }
}
