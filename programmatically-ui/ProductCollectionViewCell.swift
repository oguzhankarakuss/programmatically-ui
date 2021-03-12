//
//  ProductCollectionViewCell.swift
//  programmatically-ui
//
//  Created by Oğuzhan Karakuş on 11.03.2021.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()

    // MARK: - User Views
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20.0
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.textColor = .gray
        return label
    }()

    private lazy var recipeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.textColor = .gray
        return label
    }()
    
    private lazy var profileLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var followersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2.0
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var imageWithLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10.0
        return stackView
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var userContainerView: UIView = {
        return UIView()
    }()

    private final func configureUserView() {
        followersStackView.addArrangedSubview(recipeLabel)
        followersStackView.addArrangedSubview(followersLabel)
        
        profileLabelStackView.addArrangedSubview(nameLabel)
        profileLabelStackView.addArrangedSubview(followersStackView)
        
        imageWithLabelsStackView.addArrangedSubview(profileImageView)
        imageWithLabelsStackView.addArrangedSubview(profileLabelStackView)
        
        userContainerView.addSubview(imageWithLabelsStackView)
        
        containerStackView.addArrangedSubview(userContainerView)
        containerStackView.addArrangedSubview(separatorView)
        
        contentView.addSubview(containerStackView)
        
        imageWithLabelsStackView.edgesToSuperview(insets: UIEdgeInsets(top: 15.0,
                                                                       left: 15.0,
                                                                       bottom: 15.0,
                                                                       right: 15.0))
        profileImageView.size(CGSize(width: 40.0, height: 40.0))
        
        separatorView.height(1.0)
        
        recipeLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        containerStackView.edgesToSuperview()
        
        profileImageView.backgroundColor = .blue
        recipeLabel.text = "4 Tarif"
        followersLabel.text = "3 Takipçi"
        nameLabel.text = "Alican"
        
    }
    
    final func commonInit() {
        configureUserView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    
}
