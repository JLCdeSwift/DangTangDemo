//
//  LCHomeCell.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/6.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//

import UIKit

//typealias Block = (UIButton)->()


class LCHomeCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var praiseBtn: UIButton!
    
    //var btnBlock : Block?
    
    
    func btnBlock(sender:UIButton,completed:() -> ()) {
        completed()
        
    }
    
    
    
    var homeItem: LCHomeItem? {
        didSet {
            
            let url = homeItem!.cover_image_url
            bgImageView.kf.setImage(with: URL(string: url!)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
            }
           titleLabel.text = homeItem?.title
            praiseBtn.setTitle("" + String(describing: homeItem?.likes_count) + "", for: UIControlState.normal)
            
        }
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        praiseBtn.addTarget(self, action: Selector(("praiseBtnClicked:")), for: .touchUpInside)
        
        
    }
    func praiseBtnClicked(sender:UIButton) {
        btnBlock(sender: sender) {
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
