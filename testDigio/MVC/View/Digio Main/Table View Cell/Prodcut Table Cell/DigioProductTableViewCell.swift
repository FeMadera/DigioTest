//
//  DigioProductTableViewCell.swift
//  testDigio
//
//  Created by Felipe madeira on 23/11/20.
//

import UIKit

struct DigioProductTableViewCellDTO {
    var products: DigioCodable?
}

class DigioProductTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectioView: UICollectionView!
    
   private  var presenter: DigioProductTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectioView.delegate = self
        self.collectioView.dataSource = self
        self.registerCollectionCell()
        
    }
    
    func fill(with dto: DigioProductTableViewCellDTO ) {
        presenter = DigioProductTableViewCellPresenter(products: dto.products)
        reloadData()
    }
    
    //MARK: - Methods
    func registerCollectionCell() {
        collectioView.register(UINib(nibName: String(describing:DigioProductCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing:DigioProductCell.self))
        
    }
    
    //MARK: - DigioCollectionViewCellDelegate
    
    func reloadData() {
        self.collectioView.reloadData()
    }
    
    //MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let  product = presenter?.getProductList() else {return 0}
        return product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let products = presenter?.getProductList() else {return UICollectionViewCell()}
        guard let productsImg = products[indexPath.section].imageURL else {return UICollectionViewCell()}
        let cellProduct: DigioProductCell = DigioProductCell.createCell(collectionView, indexPath: indexPath)
        cellProduct.fill(with: DigioProductDTO(productImg: productsImg))
        return cellProduct
    }
    
}
