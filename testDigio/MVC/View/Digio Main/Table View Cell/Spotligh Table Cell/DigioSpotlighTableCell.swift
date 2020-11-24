//
//  DigioTableViewCell.swift
//  testDigio
//
//  Created by Felipe madeira on 20/11/20.
//

import Foundation
import UIKit

struct digioSpotlightTCellDTO {
    var products: DigioCodable?
}


class DigioSpotlighTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectioView: UICollectionView!
    
    var presenter: DigioSpotlightTableCellPresenterDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectioView.delegate = self
        self.collectioView.dataSource = self
        self.registerCollectionCell()
        
    }
    
    func fill(with dto: digioSpotlightTCellDTO ) {
        presenter = DigioSpotlightTableCellPresenter(products: dto.products)
        reloadData()
    }
    
    //MARK: - Methods
    func registerCollectionCell() {
        collectioView.register(UINib(nibName: String(describing:DigioSpotlightCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing:DigioSpotlightCell.self))
        
    }
    
    //MARK: - DigioTableViewCellDelegate
    
    func reloadData() {
        self.collectioView.reloadData()
    }
    
    //MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let  spotlight = presenter?.getSpotlightList() else {return 0}
        return spotlight.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let spotlight = presenter?.getSpotlightList() else {return UICollectionViewCell()}
        let cellSpotlight: DigioSpotlightCell = DigioSpotlightCell.createCell(collectionView, indexPath: indexPath)
        cellSpotlight.fill(with: DigioSpotlightDTO(spotlightImg: spotlight[indexPath.section].bannerURL ?? ""))
        return cellSpotlight
    }
    
}
