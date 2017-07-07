//
//  LCRefreshControl.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/6.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//

import UIKit

class LCRefreshControl: UIRefreshControl {

    /// 定义变量记录是否需要旋转监听
    private var rotationArrowFlag = false
    /// 定义变量记录当前是否正在执行圈圈动画
    private var loadingViewAnimationFlag = false
    
    override init() {
        super.init()
        setupUI()
        
    }
    
    
    
    func setupUI() {
        
    }
    
    
    //mark - lazy load 
//    private lazy var refreshView
    
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
