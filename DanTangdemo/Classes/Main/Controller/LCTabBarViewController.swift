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
        
        self.addChildViewControllers()
        // Do any additional setup after loading the view.
    }

    //添加子控制器
    private  func addChildViewControllers() {
        addChildViewController(controller: LCDanTangViewController(), title: "单糖", imageName: "TabBar_home_23x23_")
        addChildViewController(controller: LCProductViewController(), title: "单品", imageName: "TabBar_gift_23x23_")
        addChildViewController(controller: LCCategoryViewController(), title: "分类", imageName: "TabBar_category_23x23_")
        addChildViewController(controller: LCMeViewController(), title: "我", imageName: "TabBar_me_boy_23x23_")
    }
    
    //添加子控制器(初始化)
   private func addChildViewController(controller:UIViewController,title:String,imageName:String) {
        controller.tabBarItem.title = title
    controller.tabBarItem.image = UIImage.init(named: imageName)
    controller.tabBarItem.selectedImage = UIImage.init(named: imageName + "selected")
    let nav = LCNavigationController.init(rootViewController: controller)
    addChildViewController(nav)
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
