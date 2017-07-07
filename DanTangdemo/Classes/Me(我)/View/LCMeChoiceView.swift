//
//  LCMeChoiceView.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/7.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//

import UIKit

class LCMeChoiceView: UIView {

    var flag :Int = 0;
    
   override init(frame:CGRect) {
    super.init(frame: frame)
    setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //- MARK: - 布局
    func setupUI() {
        
    }
    
    
    
    
    
    
    
    //-MARK: - lazy load
    
    private lazy var leftButton :UIButton = {
        let leftButton = UIButton.init()
        
        leftButton.setTitle("喜欢的商品", for: .normal)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        leftButton.setTitleColor(LCColor(r: 0, g: 0, b: 0, a: 0.7), for: .normal)
        leftButton.backgroundColor = UIColor.white
        leftButton.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
        ViewBorder(view: leftButton, radius: klineWidth)
        leftButton.layer.borderColor = UIColor.white.cgColor
        leftButton.isSelected = true
        leftButton.tag = 101
        return leftButton
    }()
    
    
    /// 右边的按钮
    private lazy var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setTitle("喜欢的专题", for: .normal)
        rightButton.setTitleColor(LCColor(r: 0, g: 0, b: 0, a: 0.7), for: .normal)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rightButton.backgroundColor = UIColor.white
        rightButton.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
        rightButton.layer.borderColor = LCColor(r: 230, g: 230, b: 230, a: 1.0).cgColor
        rightButton.layer.borderWidth = klineWidth
        rightButton.tag = 102
        return rightButton
    }()
    
    /// 底部红色条
    private lazy var indicatorView: UIView = {
        let indicatorView = UIView()
        indicatorView.backgroundColor = LCGlobalRedColor()
        return indicatorView
    }()

    
    //
    func btnClick(sender:UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if flag == sender.tag {
            
        }
        else{
            UIView.animate(withDuration: kAnimationDuration) {
                self.flag = sender.tag
                self.indicatorView.centerX = sender.centerX
            }
        }
        
        
        
        
    }
    
    
    

}
