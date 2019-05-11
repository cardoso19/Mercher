//
//  ProductsViewController.swift
//  Mercher
//
//  Created by Davi Bispo de Oliveira Alves on 08/05/19.
//  Copyright © 2019 Arkd. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProductsViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var collectionViewProducts: UICollectionView!
    
    //MARK: Variables
    let viewModel: MainViewModel = MainViewModel()
    let disposeBag: DisposeBag = DisposeBag()
    
    //MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        observers()
        render()
    }
    
    //MARK: Functions
    func observers() {
        collectionView()
    }
    
    func collectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        let size = (collectionViewProducts.frame.size.width - CGFloat(10)) / CGFloat(2)
        flowLayout.itemSize = CGSize(width: size, height: 300)
        collectionViewProducts.setCollectionViewLayout(flowLayout, animated: true)
        collectionViewProducts.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionCell")
        viewModel.state.productCollection.bind(to: collectionViewProducts.rx.items(cellIdentifier: "ProductCollectionCell", cellType: ProductCollectionViewCell.self)) { (index, model, cell) in
            
        }.disposed(by: disposeBag)
    }
}

//MARK: - Whitelabel
extension ProductsViewController: Whitelabel {
    func render() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
