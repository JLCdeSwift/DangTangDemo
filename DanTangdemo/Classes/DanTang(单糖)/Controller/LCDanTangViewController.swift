//
//  LCDanTangViewController.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/5.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//  单糖

import UIKit

class LCDanTangViewController: LCBaseViewController,UIScrollViewDelegate {

    var channels = [LCchannel]()
    //标签
    weak var titlesView = UIView()
    //底部红线
    weak var underlineView = UIView()
    weak var contentView = UIScrollView()
    weak var selectedButton = UIButton()
    
    
    
    
    
    
    
    
    
    func setupChildViewControllers() {
        for channel in channels {
            let vc = LCTopicViewController()
            vc.title = channel.name
            addChildViewController(vc)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        setupnav()
        
        weak var weakSelf = self
        LCNetWorkManager.shareNetManager.loadHomeTopData { (channels) in
            for channel in channels {
                let vc = LCTopicViewController()
                vc.title = channel.name!
                vc.type = channel.id!
                weakSelf!.addChildViewController(vc)
            }
            weakSelf?.setupTitlesView()
            weakSelf?.setupContentView()
        }
        
        
        //setupTitlesView()
        
        
        
        
        
    }
    
    //MARK: 设置导航栏
    func setupnav() {
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "Feed_SearchBtn_18x18_")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: .plain, target: self, action: #selector(rightButtonClick))
    }
    func rightButtonClick() {
        print("点击搜索")
    }
    
    
    //MARK: - 顶部标签栏
    func setupTitlesView() {
        //顶部背景
        let bgview = UIView()
        bgview.frame = CGRect.init(x: 0, y: kTitlesViewY, width: SCREENW, height: kTitlesViewH)
        view.addSubview(bgview)
        //标签
        let titlesView = UIView()
        titlesView.backgroundColor = LCGlobalColor()
        titlesView.frame = CGRect.init(x: 0, y: 0, width: SCREENW, height: kTitlesViewH)
        bgview.addSubview(titlesView)
        //底部红线
        let indicatorView = UIView()
        indicatorView.backgroundColor = LCGlobalColor()
        indicatorView.height = kIndicatorViewH
        indicatorView.y = kTitlesViewH-kIndicatorViewH
        indicatorView.tag = -1
        self.underlineView = indicatorView
        
        //选择按钮
        let arrowButton = UIButton()
        arrowButton.frame = CGRect.init(x: SCREENW - kTitlesViewH, y: 0, width: kTitlesViewH, height: kTitlesViewH)
        arrowButton.setImage(UIImage(named: "arrow_index_down_8x4_"), for: .normal)
        arrowButton.backgroundColor = LCGlobalColor()
        arrowButton.addTarget(self, action: #selector(arrowButtonClicked(sender:)), for: .touchUpInside)
        bgview.addSubview(arrowButton)
        
        //内部子标签
        let count = childViewControllers.count
        let width = titlesView.width / CGFloat(count)
        let height = titlesView.height
        
        for index in 0..<count {
            let button = UIButton()
            button.height = height
            button.width = width
            button.x = CGFloat(index) * width
            button.tag = index
            let vc = childViewControllers[index]
            button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            button.setTitle(vc.title!, for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.setTitleColor(LCGlobalRedColor(), for: .disabled)
            button.addTarget(self, action: #selector(titlesButtonClicked(sender:)), for: .touchUpInside)
            titlesView.addSubview(button)
            //默认点击了第一个按钮
            if index == 0 {
                button.isEnabled = false
                selectedButton = button
                //让按钮内部的Label根据文字来计算内容
                button.titleLabel?.sizeToFit()
                indicatorView.width = button.titleLabel!.width
                indicatorView.centerX = button.centerX
            }
        }
        //底部红色指示器
        titlesView.addSubview(indicatorView)
    }
    
    func arrowButtonClicked(sender:UIButton) {
        UIView.animate(withDuration: kAnimationDuration) {
            sender.imageView?.transform = sender.imageView!.transform.rotated(by: CGFloat(Double.pi))
        }
    }
    
    func titlesButtonClicked(sender:UIButton) {
        
        selectedButton?.isEnabled = true
        sender.isEnabled = false
        selectedButton = sender
        //执行动画
        UIView.animate(withDuration: kAnimationDuration) { 
            self.underlineView?.width = self.selectedButton!.titleLabel!.width
            self.underlineView?.centerX = self.selectedButton!.centerX
        }
        //滚动 切换VC
        var offset = contentView!.contentOffset
        offset.x = CGFloat(sender.tag)*contentView!.width
        
        contentView?.setContentOffset(offset, animated: true)
        
        
        
    }
    //MARK: 底部scrollview
    func setupContentView() {
        //不要自动调整inset
        automaticallyAdjustsScrollViewInsets = false
        
        let contentView = UIScrollView()
        contentView.frame = view.bounds
        contentView.delegate = self
        contentView.contentSize = CGSize(width: contentView.width * CGFloat(childViewControllers.count), height: 0)
        contentView.isPagingEnabled = true
        view.insertSubview(contentView, at: 0)
        self.contentView = contentView
        //添加第一个控制器的view
        scrollViewDidEndScrollingAnimation(contentView)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UIScrollViewDelegate
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        //当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        let vc = childViewControllers[index]
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0
        vc.view.height = scrollView.height
        scrollView.addSubview(vc.view)
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 点击 Button
        let button = titlesView!.subviews[index] as! UIButton
        //titlesClick(button: button)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
