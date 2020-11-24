//
//  DigioHeaderView.swift
//  testDigio
//
//  Created by Felipe madeira on 23/11/20.
//

import UIKit

struct DigioHeaderViewDTO {
    var icIcone = ""
    var title = ""
    var titleContrast = ""
}

class DigioHeaderView: UIView {
    
    @IBOutlet weak var icIcone: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var titleContrast: UILabel!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftLblConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
}
