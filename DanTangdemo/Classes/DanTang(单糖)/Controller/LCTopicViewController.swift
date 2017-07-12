//
//  LCTopicViewController.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/11.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//

import UIKit

class LCTopicViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var type : Int!
    //MARK: 首页列表内容
    var items = [LCHomeItem]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyan
        self.tableView.backgroundColor = UIColor.groupTableViewBackground
        weak var weakSelf = self
        LCNetWorkManager.shareNetManager.loadHomeInfo(id: type) { (homeItems) in
            weakSelf?.items = homeItems
            weakSelf?.tableView.reloadData()
        }
        
        tableView.refreshControl?.addTarget(self, action: #selector(loadHomeData), for: .valueChanged)
        
        
        // Do any additional setup after loading the view.
    }
    //MARK: 获取
    func loadHomeData() {
        // 获取首页数据
        weak var weakSelf = self
        LCNetWorkManager.shareNetManager.loadHomeInfo(id: type) { (homeItems) in
            weakSelf!.items = homeItems
            weakSelf!.tableView.reloadData()
            weakSelf?.tableView.refreshControl?.endRefreshing()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     UITableViewDelegate,UITableViewDataSource
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return 44
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 5
//    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.01
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        
//        return nil
//        
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let homeCell = tableView.dequeueReusableCell(withIdentifier: "homecell") as! LCHomeCell
        homeCell.selectionStyle = .none
        homeCell.homeItem = items[indexPath.row]
        homeCell.btnBlock = {
            print("点击了点赞")
        }
        return homeCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // 创建 tableView
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
        tableView.rowHeight = 160
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, self.tabBarController!.tabBar.height, 0)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UINib.init(nibName: String.init(describing: LCHomeCell.self), bundle: nil), forCellReuseIdentifier: "homecell")
        return tableView
    }()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
