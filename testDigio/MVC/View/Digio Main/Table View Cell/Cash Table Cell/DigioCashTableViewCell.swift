//
//  DigioCashTableViewCell.swift
//  testDigio
//
//  Created by Felipe madeira on 23/11/20.
//

import UIKit
struct DigioCashTableViewCellDTO {
    var products: DigioCodable?
}


class DigioCashTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectioView: UICollectionView!
    
    var presenter: DigioCashTableViewCellPresenterDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectioView.delegate = self
        self.collectioView.dataSource = self
        self.registerCollectionCell()
        
    }
    
    func fill(with dto: DigioCashTableViewCellDTO ) {
        presenter = DigioCashTableViewCellPresenter(products: dto.products)
        reloadData()
    }
    
    //MARK: - Methods
    func registerCollectionCell() {
        collectioView.register(UINib(nibName: String(describing: DigioCashCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: DigioCashCell.self))
    }
    
    //MARK: - DigioCollectionViewCellDelegate
    
    func reloadData() {
        self.collectioView.reloadData()
    }
    
    //MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cash = presenter?.getCashList() else {return UICollectionViewCell()}
        let cellCash: DigioCashCell = DigioCashCell.createCell(collectionView, indexPath: indexPath)
        cellCash.fill(with: DigioCashDTO(cashImg: cash.bannerURL ?? ""))
        return cellCash
    }
}

