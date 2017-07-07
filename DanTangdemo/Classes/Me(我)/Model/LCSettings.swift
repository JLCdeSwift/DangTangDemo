//
//  LCSettings.swift
//  DanTangdemo
//
//  Created by 冀柳冲 on 2017/7/6.
//  Copyright © 2017年 sunny冲哥. All rights reserved.
//

import UIKit

class LCSettings: NSObject {

    var iconImage: String?
    var leftTitle: String?
    var rightTitle: String?
    var isHiddenSwitch: Bool?
    var isHiddenRightTip: Bool?
    
    init(dict: [String: AnyObject]) {
        super.init()
        iconImage = dict["iconImage"] as? String
        leftTitle = dict["leftTitle"] as? String
        rightTitle = dict["rightTitle"] as? String
        isHiddenSwitch = dict["isHiddenSwitch"] as? Bool
        isHiddenRightTip = dict["isHiddenRightTip"] as? Bool
    }

}
