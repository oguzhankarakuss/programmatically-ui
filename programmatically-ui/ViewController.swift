//
//  ViewController.swift
//  programmatically-ui
//
//  Created by Oğuzhan Karakuş on 11.03.2021.
//

import UIKit
import TinyConstraints
import Fakery

struct CellModel {
    var imageUrl: String?
    var username: String?
    var recipeCount: Int = 0
    var followersCount: Int = 0
    var recipeName: String?
    var recipeCategory: String?
    var recipeImageUrl: String?
    var commentCount: Int = 0
    var likeCount: Int = 0
}

extension CellModel {
    var statsText: String {
        return "\(commentCount) Yorum \(likeCount) Beğeni"
    }
}

class ViewController: UIViewController {
    
    let faker = Faker(locale: "en-US")
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .cyan
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    var cellItems: [CellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(collectionView)
        
        collectionView.edgesToSuperview(excluding: .top)
        collectionView.topToSuperview(usingSafeArea: true)
        getData()
    }
    
    func getData() {
        for _ in 0...50 {
            var model = CellModel()
            model.imageUrl = faker.internet.templateImage(width: 40, height: 40, backColorHex: faker.commerce.color())
            model.username = faker.internet.username()
            model.recipeCount = faker.number.randomInt(min: 0, max: 230)
            model.followersCount = faker.number.randomInt(min: 0, max: 23636)
            model.recipeName = faker.lorem.sentences(amount: 3)
            model.recipeCategory = faker.lorem.sentence()
            let width = Int(UIScreen.main.bounds.width - 30)
            model.recipeImageUrl = faker.internet.templateImage(width: width,
                                                                height: width,
                                                                backColorHex: faker.commerce.color())
            model.commentCount = faker.number.randomInt(min: 0, max: 230)
            model.likeCount = faker.number.randomInt(min: 0, max: 23636)
            cellItems.append(model)
        }
        collectionView.reloadData()
    }

}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.set(model: cellItems[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let imageHeight = width - 30
        return CGSize(width: UIScreen.main.bounds.size.width, height: 173.0 + imageHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
