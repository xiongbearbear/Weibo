//
//  XBBNavigationController.swift
//  Weibo
//
//  Created by xiong on 16/11/28.
//  Copyright © 2016年 xiong. All rights reserved.
//

import UIKit

class XBBNavigationController: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isHidden = true
    }
    // 重写 push 方法,所有的 push 动作都会调用此方法!
    // viewController 是被push 的控制器,设置他的左侧的按钮作为返回按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        // 如果不是栈底控制器才需要隐藏,跟控制器不需要处理
        if childViewControllers.count > 0{
            //隐藏底部的tabbar
            viewController.hidesBottomBarWhenPushed = true
            
            if let vc = viewController as? XBBBaseViewController{
                
                var title = "返回"
                
                // 取出自定义 navItem
                if childViewControllers .count == 1{
                    title = childViewControllers.first?.title ?? "返回"
                }
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title:title, target: self, action: #selector(popToParent),isBack:true)
            }
        }
    super.pushViewController(viewController, animated: true)
    }
    
    @objc private func popToParent(){
        popViewController(animated: true)
    }

}
