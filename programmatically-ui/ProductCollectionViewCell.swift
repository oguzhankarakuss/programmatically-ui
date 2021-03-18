//
//  ProductCollectionViewCell.swift
//  programmatically-ui
//
//  Created by Oğuzhan Karakuş on 11.03.2021.
//

import UIKit

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
    
}

// MARK: - Configures
private extension ProductCollectionViewCell {
    final func configureContainerView() {
        
        containerStackView.addArrangedSubview(userView)
        containerStackView.addArrangedSubview(separatorView)
        
        contentView.addSubview(containerStackView)
        
        separatorView.height(1.0)
        
        containerStackView.edgesToSuperview()
        
        userView.recipeText = "4 Tarif"
        userView.followersText = "3 Takipçi"
        userView.nameText = "Alican"
        
    }
}
