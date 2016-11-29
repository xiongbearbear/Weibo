//
//  UIBarButtonItem+ExtensionS.swift
//  Weibo
//
//  Created by xiong on 16/11/29.
//  Copyright © 2016年 xiong. All rights reserved.
//

import UIKit

extension UIBarButtonItem{

    ///  创建 UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: fontSize,默认 16 号
    ///   - target: target
    ///   - action: action
    convenience init(title:String,fontSize:CGFloat = 16,target:Any,action:Selector,isBack:Bool = false) {
        let btn:UIButton = UIButton.cz_textButton(title, fontSize:fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        btn.addTarget(target,action: action, for: .touchUpInside)
        
        let iamgeName = "navigationbar_back_withtext"
        if isBack{
            btn.setImage(UIImage(named:iamgeName), for: .normal)
            btn.setImage(UIImage(named:iamgeName + "_highlighted"), for: .highlighted)
            btn.sizeToFit()
        
        }
        // self.init 实例UIBarButtonItem
        self.init(customView: btn)

    }
}
