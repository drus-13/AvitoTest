//
//  MainTableViewCell.swift
//  AvitoTest
//
//  Created by Andrey on 26.08.2021.
//

import UIKit

protocol MainTableViewCellDelegate: AnyObject {
    func getSkillsData(index: Int) -> [String]
}

class MainTableViewCell: UITableViewCell {
    // MARK: - Identifier
    static let identifier: String = "MainTableViewCell"
    
    // MARK: - Label For Name
    private lazy var labelForName: UILabel = {
        let label = UILabel()
        label.text = "Имя сотрудника"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Name Label
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "defaultName"
        label.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Label For Phone
    private lazy var labelForPhone: UILabel = {
        let label = UILabel()
        label.text = "Моб. телефон"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
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
    
    // MARK: - Label For Skills
    private lazy var labelForSkills: UILabel = {
        let label = UILabel()
        label.text = "Ключевые навыки"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Collection View
    private lazy var skillsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - View Controller Delegate
    private weak var delegate: MainTableViewCellDelegate?
    
    // MARK: - Index
    private var index: Int = 0
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
    }
    
    // MARK: - Setup Cell
    private func setupCell() {
        let space: CGFloat = 10.0
        contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: space, bottom: space, right: space))
    }
    
    // MARK: - Label For Name Constraints
    private func setupLabelForNameConstraints() {
        contentView.addSubview(labelForName)
        labelForName.constraint(leading: contentView.leadingAnchor, Constants.CellParametersSize.indentWidth)
        labelForName.constraint(trailing: contentView.trailingAnchor, Constants.CellParametersSize.indentWidth)
        labelForName.constraint(top: contentView.topAnchor)
        labelForName.constraint(height: Constants.CellParametersSize.labelHeight)
    }
    
    // MARK: - Name Label Constraints
    private func setupNameLabelConstraints() {
        contentView.addSubview(nameLabel)
        nameLabel.constraint(leading: contentView.leadingAnchor, Constants.CellParametersSize.indentWidth)
        nameLabel.constraint(trailing: contentView.trailingAnchor, 2*Constants.CellParametersSize.indentWidth)
        nameLabel.constraint(top: labelForName.bottomAnchor, Constants.CellParametersSize.indentHeight)
        nameLabel.constraint(height: Constants.CellParametersSize.labelHeight)
    }
    
    // MARK: - Label For Phone Constraints
    private func setupLabelForPhoneConstraints() {
        contentView.addSubview(labelForPhone)
        labelForPhone.constraint(leading: contentView.leadingAnchor, Constants.CellParametersSize.indentWidth)
        labelForPhone.constraint(trailing: contentView.trailingAnchor, Constants.CellParametersSize.indentWidth)
        labelForPhone.constraint(top: nameLabel.bottomAnchor)
        labelForPhone.constraint(height: Constants.CellParametersSize.labelHeight)
    }
    
    // MARK: - Phone Label Constraints
    private func setupPhoneLabelConstraints() {
        contentView.addSubview(phoneLabel)
        phoneLabel.constraint(leading: contentView.leadingAnchor, Constants.CellParametersSize.indentWidth)
        phoneLabel.constraint(trailing: contentView.trailingAnchor, 2*Constants.CellParametersSize.indentWidth)
        phoneLabel.constraint(top: labelForPhone.bottomAnchor, Constants.CellParametersSize.indentHeight)
        phoneLabel.constraint(height: Constants.CellParametersSize.labelHeight)
    }
    
    // MARK: - Label For Skills Constraints
    private func setupLabelForSkillsConstraints() {
        contentView.addSubview(labelForSkills)
        labelForSkills.constraint(leading: contentView.leadingAnchor, Constants.CellParametersSize.indentWidth)
        labelForSkills.constraint(trailing: contentView.trailingAnchor, Constants.CellParametersSize.indentWidth)
        labelForSkills.constraint(top: phoneLabel.bottomAnchor)
        labelForSkills.constraint(height: Constants.CellParametersSize.labelHeight)
    }
    
    // MARK: - Skills Collection View Constraints
    private func setupSkillsCollectionViewConstraints() {
        contentView.addSubview(skillsCollectionView)
        skillsCollectionView.constraint(leading: contentView.leadingAnchor, Constants.CellParametersSize.indentWidth)
        skillsCollectionView.constraint(trailing: contentView.trailingAnchor, 2*Constants.CellParametersSize.indentWidth)
        skillsCollectionView.constraint(top: labelForSkills.bottomAnchor, Constants.CellParametersSize.indentHeight)
        skillsCollectionView.constraint(height: Constants.CellParametersSize.labelHeight)
    }
    
    // MARK: - Setup Skills Collection View
    private func setupSkillsCollectionView() {
        skillsCollectionView.dataSource = self
        skillsCollectionView.delegate = self
        skillsCollectionView.register(SkillCollectionViewCell.self,
                                      forCellWithReuseIdentifier: SkillCollectionViewCell.identifier)
    }
    
    // MARK: - Configure
    private func configure() {
        contentView.layer.backgroundColor = UIColor.systemGray4.cgColor
        contentView.layer.cornerRadius = 25
        contentView.layer.masksToBounds = true
        
        selectionStyle = .none
        
        
        setupLabelForNameConstraints()
        setupNameLabelConstraints()
        
        setupLabelForPhoneConstraints()
        setupPhoneLabelConstraints()
        
        setupSkillsCollectionView()
        setupLabelForSkillsConstraints()
        setupSkillsCollectionViewConstraints()
    }
    
    // MARK: - Inject Delegate View Controller
    func setMainViewController(controller: MainTableViewCellDelegate) {
        delegate = controller
    }
    
    // MARK: - Set Data In Cell
    func setDataInCell(data: Employee) {
        nameLabel.text = data.name
        phoneLabel.text = data.phoneNumber
    }
    
    // MARK: - Set Index
    func setIndex(index: Int) {
        self.index = index
    }
}

// MARK: - UICollectionViewDataSource
extension MainTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.getSkillsData(index: index).count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: SkillCollectionViewCell.identifier, for: indexPath)
                as? SkillCollectionViewCell else { return UICollectionViewCell() }
        
        let skill = delegate?.getSkillsData(index: index)[indexPath.row]
        
        cell.setDataInCell(data: skill)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let skill = delegate?.getSkillsData(index: index)[indexPath.row]
        let size: CGSize = skill!.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)])
        
        return CGSize(width: size.width + 2*Constants.CellParametersSize.indentWidth, height: Constants.CellParametersSize.labelHeight)
    }
}

// MARK: - UICollectionViewDelegate
extension MainTableViewCell: UICollectionViewDelegate { }
