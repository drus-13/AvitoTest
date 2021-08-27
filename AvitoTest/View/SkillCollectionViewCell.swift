//
//  SkillsCollectionViewCell.swift
//  AvitoTest
//
//  Created by Andrey on 27.08.2021.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "SkillsCollectionViewCell"
    
    // MARK: - Skill Label
    private lazy var skillLabel: UILabel = {
        let label = UILabel()
        label.text = "defaultSkill"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSkillLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Skill Label Constraints
    private func setupSkillLabelConstraints() {
        addSubview(skillLabel)
        skillLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        skillLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.backgroundColor = UIColor.yellow.cgColor
        contentView.layer.cornerRadius = 5
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 2.5
        contentView.layer.masksToBounds = true
    }
    
    // MARK: - Set Data In Cell
    func setDataInCell(data: String) {
        skillLabel.text = data
    }
}
