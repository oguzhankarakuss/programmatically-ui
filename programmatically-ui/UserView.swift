//
//  UserView.swift
//  programmatically-ui
//
//  Created by Oğuzhan Karakuş on 11.03.2021.
//

import UIKit
import Kingfisher

final class UserView: UIView {
    
    // MARK: - User Views
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20.0
        imageView.clipsToBounds = true
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
        
        imageWithLabelsStackView.edgesToSuperview(insets: UIEdgeInsets(top: 15.0,
                                                                       left: 15.0,
                                                                       bottom: 15.0,
                                                                       right: 15.0))
        profileImageView.size(CGSize(width: 40.0, height: 40.0))
        
        recipeLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        profileImageView.backgroundColor = .blue
        
        addSubview(userContainerView)
        separatorView.height(1.0)
        userContainerView.edgesToSuperview()
        
    }
    
    // MARK: - Properties
    var imageUrl: String? {
        willSet {
            if let imageUrl = newValue, let url = URL(string: imageUrl) {
                profileImageView.kf.setImage(with: url)
            } else {
                profileImageView.image = nil
            }
        }
    }
    
    var nameText: String? {
        get {
            return nameLabel.text
        } set {
            nameLabel.text = newValue
        }
    }
    
    var recipeText: String? {
        get {
            return recipeLabel.text
        } set {
            recipeLabel.text = newValue
        }
    }
    
    var followersText: String? {
        get {
            return followersLabel.text
        } set {
            followersLabel.text = newValue
        }
    }
    
    // MARK: - Init
    final func commonInit() {
        configureUserView()
    }
    
    convenience init(nameText: String? = nil,
                     recipeText: String? = nil,
                     followersText: String? = nil) {
        self.init()
        recipeLabel.text = recipeText
        followersLabel.text = followersText
        nameLabel.text = nameText
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
