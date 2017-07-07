//
//  LCMeViewController.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/5.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
// wo 我

import UIKit

class LCMeViewController: LCBaseViewController,UITableViewDelegate,UITableViewDataSource {
    var cellCount = 10
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColorFromRGB(rgbValue: 0xad367f)
        setupTableView()
        // Do any additional setup after loading the view.
    }

    /// 创建 tableView
    private func setupTableView() {
        let tableView = UITableView()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.tableHeaderView = headerView
        //tableView.tableFooterView = footerView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
 /*
     UITableViewDelegate,UITableViewDataSource
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "测试啊- "
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
