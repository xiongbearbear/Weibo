//
//  XBBBaseViewController.swift
//  Weibo
//
//  Created by xiong on 16/11/28.
//  Copyright © 2016年 xiong. All rights reserved.
//

import UIKit
// 面试图: OC 中支持多继承嘛? 如果不支持,如何替代? 答案:使用协议替代:
// Swift 的写法更类似于多继承
// class XBBBaseViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
// Swift 中 利用 extension 可以把"函数"功能分类,便于管理
// 注意:
// 1.extension 中不能有属性
// 2.extension 中不能重新父类方法!重新父类方法,是子类的职责,扩展是对类的扩展!

// 所有住控制器的基类控制器
class XBBBaseViewController: UIViewController{
    // 表格视图 - 如果用户没有登录就不创建
    var tableView:UITableView?
    
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
        setupNavigationBar()
        setupTableView()
    }

    // 设置表格视图
    private func setupTableView(){
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
        // 设置数据源&代理 -> 目的:子类直接实现数据方法
        tableView?.delegate = self
        tableView?.dataSource = self
        
    }
    
    // 设置导航条
    private func setupNavigationBar(){
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

// MARK: - UITableViewDelegate,UITableViewDataSource
extension XBBBaseViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
    // 基类只是准备方法,子类扶着具体的实现
    // 子类的数据源方法不需要 super
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 只是保证没有语法错误!
        return UITableViewCell()
    }
}
