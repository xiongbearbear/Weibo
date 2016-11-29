//
//  XBBBaseViewController.swift
//  Weibo
//
//  Created by xiong on 16/11/28.
//  Copyright © 2016年 xiong. All rights reserved.
//

import UIKit

class XBBBaseViewController: UIViewController {

    // 自定义导航条
    lazy var navigationBar:UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    
    // 自定义导航条目 - 以后设置导航栏内容,统一使用 navItem
    lazy var navItem = UINavigationItem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    /// 重写 title 的 didSet
    override var title: String? {
        didSet{
            navItem.title = title
        
        }
    }

}

// MARK: - 设置界面
extension XBBBaseViewController{
    
    func setupUI(){
        view.backgroundColor = UIColor.cz_random()
        // 添加导航
        view.addSubview(navigationBar)
        //将 item 设置给 bar
        navigationBar.items = [navItem]
        // 设置 navBar 的渲染颜色
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        // 设置 navBar 的字体颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray]
        
        
    }


}
