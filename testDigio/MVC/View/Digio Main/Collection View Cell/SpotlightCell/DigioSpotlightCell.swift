//
//  DigioSpotlightCell.swift
//  testDigio
//
//  Created by Felipe madeira on 20/11/20.
//

import UIKit

struct DigioSpotlightDTO {
    var spotlightImg = ""
}

class DigioSpotlightCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var spotlightImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    func fill(with dto: DigioSpotlightDTO) {
       
        DispatchQueue.main.async {
            self.spotlightImg.downloaded(from: dto.spotlightImg)
            self.backgroundView?.roundCorners(corners:[.topRight,.bottomRight,.topLeft,.bottomLeft], radius: 12.0)
            self.bgView.roundCorners(corners:[.topRight,.bottomRight,.topLeft,.bottomLeft], radius: 12.0)
            self.spotlightImg.roundCorners(corners: [.topRight,.bottomRight,.topLeft,.bottomLeft], radius: 12.0)
            self.spotlightImg.shadownBack()
         
        }
    }

}
