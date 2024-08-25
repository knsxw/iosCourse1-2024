//
//  ViewController.swift
//  Shopping List
//
//  Created by Sasori on 24/8/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    var products : [(img: String,name:  String,price: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        products.append(("air", "Mac Book Air", "$999.0"))
        products.append(("mbpro", "Mac Book Pro", "$1499.0"))
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemIndex = indexPath.item
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopping_item", for: indexPath) as! ShoppingCell
        cell.productImageView.image = UIImage(named: products[itemIndex].img)
        cell.productNameLabel.text = products[itemIndex].name
        cell.productPriceLabel.text = products[itemIndex].price
        return cell
    }
    
}
