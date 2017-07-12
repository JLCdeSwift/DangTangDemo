//
//  LCMeFooterView.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/7.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//

import UIKit

typealias BLOCK = () -> ()



class LCMeFooterView: UIView {

    var clickedBlock : BLOCK?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - 布局
    func setupUI() {
        addSubview(meBlankButton)
        addSubview(messageLabel)
        meBlankButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 50, height: 50))
            //            make.centerX.equalTo(SCREENW * 0.5)
            //            make.centerY.equalTo(self.height * 0.5)
            make.center.equalTo(self.center)
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(meBlankButton.snp.bottom).offset(kMargin)
            make.left.right.equalTo(self)
        }
        
        
        
    }
    
    
    
    private lazy var meBlankButton: UIButton = {
        let meBlankButton = UIButton()
        meBlankButton.setTitleColor(LCColor(r: 200, g: 200, b: 200, a: 1.0), for: .normal)
        meBlankButton.width = 100
        meBlankButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        meBlankButton.setImage(UIImage(named: "Me_blank_50x50_"), for: .normal)
        meBlankButton.addTarget(self, action: #selector(footerViewButtonClick), for: .touchUpInside)
        meBlankButton.imageView?.sizeToFit()
        return meBlankButton
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = "登录以享受更多功能"
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = LCColor(r: 200, g: 200, b: 200, a: 1.0)
        //messageLabel.addTarget(self, action: #selector(footerViewButtonClick), for: .touchUpInside)
        
        var tap = UITapGestureRecognizer.init(target: self, action: #selector(footerViewButtonClick))
        messageLabel.isUserInteractionEnabled = true
        messageLabel.addGestureRecognizer(tap)
        
        return messageLabel
    }()
    
    func footerViewButtonClick() {
        clickedBlock!()
    }
    
}
