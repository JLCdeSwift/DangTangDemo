//
//  LCNetWorkManager.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/11.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON



class LCNetWorkManager: NSObject {

    //MARK: 单例
    static let shareNetManager = LCNetWorkManager()
    
    //MARK: 获取首页数据
    func loadHomeInfo(id:Int,finshed:@escaping(_ homeItems:[LCHomeItem]) ->()) -> Void {
        let url = BASE_URL + "v1/channels/\(id)/items"
        let parmaters = ["gender":1,
                         "generation":1,
                         "limit":20,
                         "offset":0]
    Alamofire.request(url, method: .get, parameters: parmaters).responseJSON { (response) in
        
        guard response.result.isSuccess else{
            SVProgressHUD.showError(withStatus: "加载失败")
            return
        }
        if let value = response.result.value {
            let dict = JSON.init(value)
            let code = dict["code"].intValue
            let message = dict["message"].stringValue
            guard code == RETURN_OK else{
                SVProgressHUD.showInfo(withStatus: message)
                return
            }
            let data = dict["data"].dictionary
            //MARK: 字典转模型
            if let items = data!["items"]?.arrayObject {
                
                var homeItems = [LCHomeItem]()
                for item in items {
                    let homeItem = LCHomeItem.init(dict: item as! [String : AnyObject])
                    homeItems.append(homeItem)
                }
                finshed(homeItems)
            }
            
        }
        
        }
        
    }
    
    //MARK: 获取首页顶部选择数据
    func loadHomeTopData(finished:@escaping(_ channels:[LCchannel])->()) {
        let url = BASE_URL + "v2/channels/preset"
        let params = ["gender": 1,
                      "generation": 1]
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                SVProgressHUD.dismiss()
                let data = dict["data"].dictionary
                if let channels = data!["channels"]?.arrayObject {
                    var ym_channels = [LCchannel]()
                    for channel in channels {
                        let ym_channel = LCchannel(dict: channel as! [String: AnyObject])
                        ym_channels.append(ym_channel)
                    }
                    finished(ym_channels)
                }

                
                
                
            }
        }
        
        
    }
}
