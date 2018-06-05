//
//  kkHomeCell.swift
//  iOS_zk
//
//  Created by kunzhang on 2018/6/5.
//  Copyright © 2018年 kunzhang. All rights reserved.
//

import UIKit

class kkHomeCell: UITableViewCell {

    @IBOutlet weak var imgV: UIImageView!
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var btA: UIButton!
    @IBOutlet weak var btB: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var model:kkHomeModel? {
        didSet {
           
            imgV.sd_setImage(with: URL.init(string: (model?.image!)!), placeholderImage: UIImage.init(named: "789"), options: SDWebImageOptions.retryFailed)
            titleLB.text = model?.text
            
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
