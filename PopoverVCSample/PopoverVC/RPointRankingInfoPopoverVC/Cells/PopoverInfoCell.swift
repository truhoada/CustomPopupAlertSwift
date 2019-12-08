//
//  PopoverInfoCell.swift
//  PopoverVCSample
//
//  Created by TrungHD-D1 on 09.12.19.
//  Copyright © 2019 TrungHD. All rights reserved.
//

import UIKit

class PopoverInfoCell: UITableViewCell {

    @IBOutlet weak var leadingMarkerView: UIView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var separateView: UIView!

    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        leadingMarkerView.layer.cornerRadius = leadingMarkerView.bounds.width/2.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func bindingData(title: String?) {
        lbTitle.text = title
    }
    
    func hideSeparateView(_ isHidden: Bool) {
        separateView.isHidden = isHidden
    }
}
