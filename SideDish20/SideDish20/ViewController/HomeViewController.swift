//
//  HomeViewController.swift
//  SideDish20
//
//  Created by 안상희 on 2022/04/19.
//

import UIKit

class HomeViewController: UIViewController {
    var products = [HomeModel]()
    let homeCollectionViewCellId = "homeCollectionViewCell"

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        registerXib()

        let nibName = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: homeCollectionViewCellId)

        for _ in 1...25 {
            let model = HomeModel()
            model?.image = "img01"
            model?.name = "뜨끈한 국밥"
            model?.description = "아주 따뜻해유"
            model?.discountedPrice = "12,370원"
            model?.originalPrice = "18,380원"
            model?.specialMessage = "이벤트특가"
            products.append(model!)
        }
        collectionView.reloadData()
    }

    private func registerXib() {
        let nibName = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: homeCollectionViewCellId)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionViewCell",
                                                            for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = UIImage(named: "img01")
        cell.nameLabel.text = products[indexPath.item].name
        cell.descriptionLabel.text = products[indexPath.item].description
        cell.discountedPriceLabel.text = products[indexPath.item].discountedPrice
        cell.originalPriceLabel.text = products[indexPath.item].originalPrice
        cell.specialMessagelabel.text = products[indexPath.item].specialMessage
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 130)
    }
}
