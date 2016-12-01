//
//  XBBHomeViewController.swift
//  Weibo
//
//  Created by xiong on 16/11/28.
//  Copyright © 2016年 xiong. All rights reserved.
//

import UIKit
// 定义全局常量,尽量使用 private 修饰,否者到处都是可以访问
private let cellId = "cellId"

class XBBHomeViewController: XBBBaseViewController {
    // 微博数据数组
    lazy var statusList = [String]()
    
    // 加载数据
    override func loadData() {
        for i in 0..<20{
            // 将数据插入到数组的顶部
            statusList.insert(i.description, at: 0)
        
        }
    }


}

// MARK - 表格数据源方法
extension XBBHomeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. 取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        // 2. 设置 cell
        cell.textLabel?.text = statusList[indexPath.row]
        
        // 3. 返回 cell
        return cell
    }
}

// MARK: - 设置界面
extension XBBHomeViewController{

    override func setupUI() {
        super.setupUI()

        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriends))
        
    
        // 注册原型 cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    
    /// 显示好友
    @objc private func showFriends(){
        
        let vc = XBBDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    
    }
}
