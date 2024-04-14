//
//  DeviceCell.swift
//  Magnetic
//
//  Created by Vasiliy Homenko on 14.04.2024.
//

import UIKit

class DeviceCell: UITableViewCell {
    
    let image = UIImageView()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor.white
        return label
    }()
    
    let ipAddressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(resource: .colorTitleGray)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        [image, nameLabel, ipAddressLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            image.heightAnchor.constraint(equalToConstant: 32),
            image.widthAnchor.constraint(equalToConstant: 32),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            ipAddressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            ipAddressLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 8),
            ipAddressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            ipAddressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(device: Device) {
        image.image = device.imageCell
        nameLabel.text = device.name
        ipAddressLabel.text = device.ipAddress
    }
}
