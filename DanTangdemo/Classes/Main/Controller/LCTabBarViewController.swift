//
//  LCTabBarViewController.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/5.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//

import UIKit

class LCTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColorFromRGB(rgbValue: 0xf55a5d)
        
        
        // Do any additional setup after loading the view.
    }

    //添加子控制器
    func addChildViewControllers() {
        
    }
    
    //添加子控制器(初始化)
    func addChildViewController(controller:UIViewController,title:String,imageName:String) {
        
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
