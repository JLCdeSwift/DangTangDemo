//
//  LCMeViewController.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/5.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
// wo 我

import UIKit

class LCMeViewController: LCBaseViewController,UITableViewDelegate,UITableViewDataSource {
    var cellCount = 0
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColorFromRGB(rgbValue: 0xad367f)
        tableView.backgroundColor = UIColor.groupTableViewBackground
        // Do any additional setup after loading the view.
    }

    
 /*
     UITableViewDelegate,UITableViewDataSource
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 30
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let choiceView = LCMeChoiceView()
        
        return choiceView
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
         cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell?.textLabel?.text = "测试- "
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    
    //MARK: - lazy load
    lazy var headerView: LCMeHeaderView = {
        let headerView = LCMeHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENW, height: kLCMineHeaderImageHeight))
        headerView.headerBlock = { (index) in
            switch(index){
            case 0:
                print("消息")
            case 1:
                print("设置")

            case 2:
                print("登录")

            default:
                break
            }
        }
        
        
        
        return headerView
    }()
    
    lazy var footerView: LCMeFooterView = {
            let footerView = LCMeFooterView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENW, height: 200))
        footerView.clickedBlock = {
            print("selected")
        }
        
        return footerView
    }()
    
    /// 创建 tableView
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = self.headerView
        tableView.tableFooterView = self.footerView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    
    
    
    // MARK: - 登录方法
   private func login() {
        
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
