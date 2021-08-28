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
        contentView.layer.backgroundColor = UIColor.systemGray4.cgColor
        contentView.layer.cornerRadius = 25
        contentView.layer.masksToBounds = true
        
        selectionStyle = .none
        let space: CGFloat = 10.0
        contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: space, bottom: space, right: space))
    }
    
    // MARK: - Label For Name Constraints
    private func setupLabelForNameConstraints() {
        contentView.addSubview(labelForName)
        labelForName.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        
        labelForName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                              constant: Constants.CellParametersSize.indentWidth).isActive = true
        
        labelForName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                               constant: -Constants.CellParametersSize.indentWidth).isActive = true
        labelForName.heightAnchor.constraint(equalToConstant: Constants.CellParametersSize.labelHeight).isActive = true
    }
    
    // MARK: - Name Label Constraints
    private func setupNameLabelConstraints() {
        contentView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: labelForName.bottomAnchor,
                                       constant: Constants.CellParametersSize.indentHeight).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                           constant: 2*Constants.CellParametersSize.indentWidth).isActive = true
        
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                            constant: -Constants.CellParametersSize.indentWidth).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: Constants.CellParametersSize.labelHeight).isActive = true
    }
    
    // MARK: - Label For Phone Constraints
    private func setupLabelForPhoneConstraints() {
        contentView.addSubview(labelForPhone)
        labelForPhone.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,
                                           constant: Constants.CellParametersSize.indentHeight).isActive = true
        
        labelForPhone.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: Constants.CellParametersSize.indentWidth).isActive = true
        
        labelForPhone.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -Constants.CellParametersSize.indentWidth).isActive = true
        labelForPhone.heightAnchor.constraint(equalToConstant: Constants.CellParametersSize.labelHeight).isActive = true
    }
    
    // MARK: - Phone Label Constraints
    private func setupPhoneLabelConstraints() {
        contentView.addSubview(phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: labelForPhone.bottomAnchor,
                                        constant: Constants.CellParametersSize.indentHeight).isActive = true
        
        phoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                            constant: 2*Constants.CellParametersSize.indentWidth).isActive = true
        
        phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                             constant: -Constants.CellParametersSize.indentWidth).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: Constants.CellParametersSize.labelHeight).isActive = true
    }
    
    // MARK: - Label For Skills Constraints
    private func setupLabelForSkillsConstraints() {
        contentView.addSubview(labelForSkills)
        labelForSkills.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor,
                                            constant: Constants.CellParametersSize.indentHeight).isActive = true
        
        labelForSkills.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: Constants.CellParametersSize.indentWidth).isActive = true
        
        labelForSkills.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: -Constants.CellParametersSize.indentWidth).isActive = true
        labelForSkills.heightAnchor.constraint(equalToConstant: Constants.CellParametersSize.labelHeight).isActive = true
    }
    
    // MARK: - Skills Collection View Constraints
    private func setupSkillsCollectionViewConstraints() {
        contentView.addSubview(skillsCollectionView)
        skillsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                      constant: 2*Constants.CellParametersSize.indentWidth).isActive = true
        skillsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.CellParametersSize.indentWidth).isActive = true
        skillsCollectionView.topAnchor.constraint(equalTo: labelForSkills.bottomAnchor, constant: Constants.CellParametersSize.indentHeight).isActive = true
        skillsCollectionView.heightAnchor.constraint(equalToConstant: Constants.CellParametersSize.labelHeight).isActive = true
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

extension MainTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let skill = delegate?.getSkillsData(index: index)[indexPath.row]
        let size: CGSize = skill!.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)])
        
        return CGSize(width: size.width + 2*Constants.CellParametersSize.indentWidth, height: Constants.CellParametersSize.labelHeight)
    }
}
