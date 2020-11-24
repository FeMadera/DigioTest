//
//  DigioCashCell.swift
//  testDigio
//
//  Created by Felipe madeira on 20/11/20.
//

import UIKit

struct DigioCashDTO {
    var cashImg = ""
}

class DigioCashCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var cashImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(with dto: DigioCashDTO)  {
        DispatchQueue.main.async {
            self.cashImg.downloaded(from: dto.cashImg)
            self.backgroundView?.roundCorners(corners:[.topRight,.bottomRight,.topLeft,.bottomLeft], radius: 24.0)
            self.bgView.roundCorners(corners:[.topRight,.bottomRight,.topLeft,.bottomLeft], radius: 24.0)
            self.cashImg.roundCorners(corners: [.topRight,.bottomRight,.topLeft,.bottomLeft], radius: 24.0)
            self.cashImg.shadownBack()
        }
    }
}
