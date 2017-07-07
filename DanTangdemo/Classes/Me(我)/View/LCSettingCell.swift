//
//  LCSettingCell.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/7.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//

import UIKit

class LCSettingCell: UITableViewCell {

    //-MARK: -属性
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var arrowView: UIImageView!
    
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var switchView: UISwitch!
    
    //var 定义可选变量,可能有值,可能为nil
    
    var setting: LCSettings? {
        didSet {
            //使用! 可以成功设置图片的前提是iconimage有值,iconimage可能有值的前提是setting有值
            iconImageView.image = UIImage.init(named: setting!.iconImage!)
            leftLabel.text = setting?.leftTitle
            rightLabel.text = setting?.rightTitle;
            arrowView.isHidden = setting!.isHiddenRightTip!
            switchView.isHidden = setting!.isHiddenSwitch!
            
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
