//
//  XBBDemoViewController.swift
//  Weibo
//
//  Created by xiong on 16/11/29.
//  Copyright © 2016年 xiong. All rights reserved.
//

import UIKit

class XBBDemoViewController: XBBBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置标题
        title = "第\(navigationController?.childViewControllers.count ?? 0)个"
    }


}


extension XBBDemoViewController {

    override func setupUI() {
        super.setupUI()
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", target: self, action: #selector(showNext))
    }
    
    //MARK: 监听方法
    @objc private func showNext(){
        let vc = XBBDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
