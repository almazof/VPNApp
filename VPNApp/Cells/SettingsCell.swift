//
//  SettingsTableViewCell.swift
//  VPNApp
//
//  Created by Jafar on 20.06.2022.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    enum CellType: String {
        case Account
        case Notifications
        case Contact
        case Privacy
    }
    
    struct ViewModel {
        let cellType: CellType
        let cellName: String
        
    }
    
    let viewModel: ViewModel? = nil
    
    
    
    private lazy var blankView = UIView()
    private lazy var cellStackView = UIStackView()
    private lazy var titleLabel = UILabel()
    private lazy var detailLabel = UILabel()
    private lazy var switcher = UISwitch()
    private lazy var chevronImageView = UIImageView()
    
    
    static let reuseID = "SettingsTableViewCell"

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsCell {
    private func setup() {
        
        self.backgroundColor = .appColor
        
        blankView.translatesAutoresizingMaskIntoConstraints = false
        blankView.backgroundColor = .white
        blankView.layer.cornerRadius = 15
        
        
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.alignment = .fill
        cellStackView.distribution = .fill
        cellStackView.axis = .horizontal
        cellStackView.spacing = 3
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "Montserrat-Medium", size: 15)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.font = UIFont(name: "Montserrat-SemiBold", size: 15)
        detailLabel.adjustsFontForContentSizeCategory = true
        detailLabel.textColor = #colorLiteral(red: 0.4310564399, green: 0.2845467925, blue: 0.9575057626, alpha: 1)
        
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.isOn = true
        switcher.onTintColor = #colorLiteral(red: 0.4310564399, green: 0.2845467925, blue: 0.9575057626, alpha: 1)
     
        cellStackView.addArrangedSubview(titleLabel)
        cellStackView.addArrangedSubview(detailLabel)

        
        blankView.addSubview(cellStackView)
       
        contentView.addSubview(blankView)
        contentView.addSubview(switcher)
        
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            
            blankView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            blankView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: blankView.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: blankView.bottomAnchor, multiplier: 1),
            
            
            
            cellStackView.topAnchor.constraint(equalTo: blankView.topAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: blankView.leadingAnchor, constant: 20),
            cellStackView.trailingAnchor.constraint(equalTo: blankView.trailingAnchor, constant: -20),
            cellStackView.bottomAnchor.constraint(equalTo: blankView.bottomAnchor),
            
            switcher.centerYAnchor.constraint(equalTo: blankView.centerYAnchor),
            switcher.trailingAnchor.constraint(equalTo: blankView.trailingAnchor, constant: -16)
            
            
            
        ])
        
    }
    
}

extension SettingsCell {
    func configure(with vm: ViewModel) {
        
        titleLabel.text = vm.cellName

        switch vm.cellType {
        case .Account:
            switcher.isHidden = true
            detailLabel.text = "Бесплатная версия"
            
        case .Notifications:
            switcher.isOn = true
            
        case .Contact:
            switcher.isHidden = true
            self.accessoryType = .disclosureIndicator
            
        case .Privacy:
            switcher.isHidden = true
            self.accessoryType = .disclosureIndicator

        }
    }
    
    
}
