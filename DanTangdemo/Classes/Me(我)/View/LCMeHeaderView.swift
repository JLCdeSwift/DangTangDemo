//
//  LCMeHeaderView.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/7.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//

import UIKit

typealias HEADBLOCK = (Int) -> ()

class LCMeHeaderView: UIView {

    var headerBlock : HEADBLOCK?
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        /// 添加子控件
        addSubview(bgImageView)
        addSubview(settingButton)
        addSubview(messageButton)
        addSubview(iconButton)
        addSubview(nameLabel)
        bgImageView.snp.makeConstraints { (make) in
            //make.left.bottom.right.equalTo(self)
            make.edges.equalTo(UIEdgeInsetsMake(-20, 0, 0, 0))
        }
        settingButton.snp.makeConstraints { (make) in
            make.right.top.equalTo(self)
            make.size.equalTo(CGSize.init(width: 44, height: 44))
        }
        messageButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 44, height: 44))
            make.left.equalTo(self)
            make.top.equalTo(settingButton.snp.top)
        }
        
        iconButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(SCREENW * 0.5)
            make.size.equalTo(CGSize(width: 75, height: 75))
            make.bottom.equalTo(nameLabel.snp.top).offset(-kMargin)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-3 * kMargin)
            make.left.right.equalTo(self)
            make.height.equalTo(2 * kMargin)
        }

    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// 懒加载，创建背景图片
    lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.image = UIImage(named: "Me_ProfileBackground")
        return bgImageView
    }()
    
    /// 懒加载，创建左上角消息按钮
    lazy var messageButton: UIButton = {
        let messageButton = UIButton()
        messageButton.setImage(UIImage(named: "Me_message_20x20_"), for: .normal)
        messageButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        messageButton.tag = 998
        return messageButton
    }()
    
    /// 懒加载，创建左上角消息按钮
    lazy var settingButton: UIButton = {
        let settingButton = UIButton()
        settingButton.setImage(UIImage(named: "Me_settings_20x20_"), for: .normal)
        settingButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        settingButton.tag = 999
        return settingButton
    }()
    
    /// 懒加载，创建头像按钮
    lazy var iconButton: UIButton = {
        let iconButton = UIButton()
        iconButton.setBackgroundImage(UIImage(named: "Me_AvatarPlaceholder_75x75_"), for: .normal)
        iconButton.layer.cornerRadius = iconButton.width * 0.5
        iconButton.layer.masksToBounds = true
        iconButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        iconButton.tag = 1000
        return iconButton
    }()
    
    /// 懒加载，创建昵称标签
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "hrscy"
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 15.0)
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    
    func buttonClicked(sender:UIButton){
        headerBlock!(sender.tag - 998)
    }

}
