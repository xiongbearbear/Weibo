//
//  XBBHomeViewController.swift
//  Weibo
//
//  Created by xiong on 16/11/28.
//  Copyright © 2016年 xiong. All rights reserved.
//

import UIKit

class XBBHomeViewController: XBBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}


extension XBBHomeViewController{

    override func setupUI() {
        super.setupUI()

        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriends))
        
    }
    /// 显示好友
    @objc private func showFriends(){
        
        let vc = XBBDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    
    }


}
