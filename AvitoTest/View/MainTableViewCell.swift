//
//  MainTableViewCell.swift
//  AvitoTest
//
//  Created by Andrey on 26.08.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    static let identifier: String = "MainTableViewCell"
    
    // MARK: - Name Label
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "defaultName"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Phone Label
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "defaultPhone"
        label.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupNameLabelConstraints()
        setupPhoneLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Name Label Constraints
    private func setupNameLabelConstraints() {
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: topAnchor,
                                       constant: Constants.CellParametersSize.indentHeight).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                           constant: Constants.CellParametersSize.indentWidth).isActive = true
        
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: Constants.CellParametersSize.labelHeight).isActive = true
    }
    
    // MARK: - Phone Label Constraints
    private func setupPhoneLabelConstraints() {
        addSubview(phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,
                                        constant: Constants.CellParametersSize.indentHeight).isActive = true
        
        phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                            constant: Constants.CellParametersSize.indentWidth).isActive = true
        
        phoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: Constants.CellParametersSize.labelHeight).isActive = true
    }
    
    // MARK: - Set Data In Cell
    func setDataInCell(data: Employee) {
        nameLabel.text = data.name
        phoneLabel.text = data.phoneNumber
    }
}
