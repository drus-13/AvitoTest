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
    
    // MARK: - Collection View
    private lazy var skillsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - View Controller Delegate
    private weak var delegate: MainTableViewCellDelegate?
    
    private var index: Int = 0
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupNameLabelConstraints()
        setupPhoneLabelConstraints()
        setupSkillsCollectionView()
        setupSkillsCollectionViewConstraints()
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
    
    // MARK: - Setup Skills Collection View
    private func setupSkillsCollectionView() {
        skillsCollectionView.dataSource = self
        skillsCollectionView.delegate = self
        skillsCollectionView.register(SkillCollectionViewCell.self,
                                      forCellWithReuseIdentifier: SkillCollectionViewCell.identifier)
    }
    
    // MARK: - Skills Collection View Constraints
    private func setupSkillsCollectionViewConstraints() {
        contentView.addSubview(skillsCollectionView)
        skillsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.CellParametersSize.indentWidth).isActive = true
        skillsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.CellParametersSize.indentWidth).isActive = true
        skillsCollectionView.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: Constants.CellParametersSize.indentHeight).isActive = true
        skillsCollectionView.heightAnchor.constraint(equalToConstant: Constants.CellParametersSize.labelHeight).isActive = true
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
        
        cell.setDataInCell(data: skill ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let skill = delegate?.getSkillsData(index: index)[indexPath.row]
        let size: CGSize = skill!.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0)])

        return CGSize(width: size.width + 20, height: Constants.CellParametersSize.labelHeight)
    }
}
