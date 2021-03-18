//
//  ProductCollectionViewCell.swift
//  programmatically-ui
//
//  Created by Oğuzhan Karakuş on 11.03.2021.
//

import UIKit
import MobilliumBuilders

final class ProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var userView: UserView = {
        return UserView()
    }()
    
    private let recipeDetailView = UIViewBuilder()
        .backgroundColor(.clear)
        .build()
    
    private let recipeDettailStackView = UIStackViewBuilder()
        .axis(.vertical)
        .alignment(.leading)
        .build()
    
    private let recipeNameLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 15, weight: .bold))
        .textColor(.black)
        .build()

    private let recipeCategoryLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 15, weight: .semibold))
        .textColor(.gray)
        .build()
    
    private let imageContentView = UIViewBuilder()
        .backgroundColor(.clear)
        .build()
    
    private let imageView = UIImageViewBuilder()
        .contentMode(.scaleAspectFill)
        .backgroundColor(UIColor.lightGray.withAlphaComponent(0.5))
        .clipsToBounds(true)
        .build()
    
    private let statContainerView = UIViewBuilder()
        .backgroundColor(.clear)
        .build()
    
    private let statsLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 13, weight: .semibold))
        .textColor(.gray)
        .build()
    
    // MARK: - Init
    private final func commonInit() {
        configureContainerView()
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
    
    func set(model: CellModel) {
        userView.imageUrl = model.imageUrl
        userView.recipeText = "\(model.recipeCount) Tarif"
        userView.followersText = "\(model.followersCount) Takipçi"
        userView.nameText = model.username
        recipeNameLabel.text = model.recipeName
        recipeCategoryLabel.text = model.recipeCategory
        if let urlString = model.recipeImageUrl, let url = URL(string: urlString) {
            imageView.kf.setImage(with: url)
        }
        statsLabel.text = model.statsText
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        userView.recipeText = nil
        userView.followersText = nil
        userView.nameText = nil
        recipeNameLabel.text = nil
        recipeCategoryLabel.text = nil
        userView.imageUrl = nil
        imageView.image = nil
    }
    
}

// MARK: - Configures
private extension ProductCollectionViewCell {
    final func configureContainerView() {
        contentView.backgroundColor = .white
        containerStackView.addArrangedSubview(userView)
        containerStackView.addArrangedSubview(separatorView)
        containerStackView.addArrangedSubview(recipeDetailView)
        containerStackView.addArrangedSubview(imageContentView)
        containerStackView.addArrangedSubview(statContainerView)
        
        separatorView.height(1.0)
        
        contentView.addSubview(containerStackView)
        containerStackView.edgesToSuperview()
        
        recipeDetailView.addSubview(recipeDettailStackView)
        recipeDettailStackView.edgesToSuperview(insets: .init(top: 10, left: 15, bottom: 10, right: 15))
        recipeDettailStackView.addArrangedSubview(recipeNameLabel)
        recipeDettailStackView.addArrangedSubview(recipeCategoryLabel)
        
        imageContentView.addSubview(imageView)
        imageView.edgesToSuperview(insets: .init(top: 0, left: 15, bottom: 0, right: 15))
        imageView.aspectRatio(1)
        
        statContainerView.addSubview(statsLabel)
        statsLabel.edgesToSuperview(insets: .init(top: 12, left: 15, bottom: 12, right: 15))
    }
}

