//
//  LCCollection.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/5.
//  Copyright © 2017年 冀柳冲. All rights reserved.
//  顶部专题合集

import UIKit

class LCCollection: NSObject {
    
    var status:Int?
    var banner_image_url :String?
    var subtitle: String?
    
    var id: Int?
    
    var created_at: Int?
    
    var title: String?
    
    var cover_image_url: String?
    
    var updated_at: Int?
    
    var posts_count: Int?
    /*dict:[String:AnyObject]
     *创建字典
     * [String:AnyObject]
     *  代表所有的key是字符串类型的,value值则是任意类型的
     */
    
    init(dict:[String:AnyObject]) {
        super.init()
        //as? 类型转换,转换不成功(或者没值)返回nil
        //由于 as? 在转换失败的时候也不会出现错误，所以对于如果能确保100%会成功的转换则可使用 as!，否则使用 as?
        status = dict["status"] as?Int
        banner_image_url = dict["banner_image_url"] as? String
        subtitle = dict["subtitle"] as? String
        id = dict["id"] as? Int
        created_at = dict["created_at"] as? Int
        title = dict["title"] as? String
        cover_image_url = dict["cover_image_url"] as? String
        updated_at = dict["updated_at"] as? Int
        posts_count = dict["posts_count"] as? Int

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
