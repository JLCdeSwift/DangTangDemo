//
//  LCNavigationController.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/5.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//

import UIKit
import SVProgressHUD


class LCNavigationController: UINavigationController {

    override class func initialize(){
        super.initialize()
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = LCGlobalRedColor()
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
    }
    
    /// 统一定制左上角返回按钮
    ///
    /// - Parameters:
    ///   - viewController: 即将入栈的控制器
    ///   - animated: 是否显示动画
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        /// 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        if viewControllers.count > 0 {
            // push 后隐藏 tabbar
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(navigationBackClick))
        }
        super.pushViewController(viewController, animated: animated)
    }
    /// 返回按钮
    func navigationBackClick() {
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
        //isNetworkActivityIndicatorVisible 指示器的联网动画(状态栏左侧转动的)
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
