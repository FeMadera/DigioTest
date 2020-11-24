//
//  DigioProductCell.swift
//  testDigio
//
//  Created by Felipe madeira on 20/11/20.
//

import UIKit

struct DigioProductDTO {
    var productImg = ""
}

class DigioProductCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var productImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }
    
    func fill(with dto: DigioProductDTO) {
        DispatchQueue.main.async {
            self.productImg.downloaded(from: dto.productImg)
            self.bgView.roundCorners(corners: [.allCorners], radius: 18.0)
            self.backgroundView?.roundCorners(corners: [.allCorners], radius: 18.0)
            self.bgView.roundCornersWithShadown()
        }
    }
    
}
