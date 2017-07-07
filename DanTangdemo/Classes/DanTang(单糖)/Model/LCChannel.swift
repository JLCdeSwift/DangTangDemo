//
//  LCchannel.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/6.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//

import Foundation

class LCchannel: NSObject {

    
    var editable: Bool?
    var id: Int?
    var name: String?
    
    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        name = dict["name"] as? String
        editable = dict["editable"] as? Bool
    }

    
}
