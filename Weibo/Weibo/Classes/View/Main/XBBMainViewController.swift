//
//  XBBMainViewController.swift
//  Weibo
//
//  Created by xiong on 16/11/28.
//  Copyright © 2016年 xiong. All rights reserved.
//

import UIKit


// 主控制器
class XBBMainViewController: UITabBarController {
    
    lazy var composeButton:UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildControllers()
        setupComposeButton()
    }
    /**
         portrait : 竖屏:肖像
         landscape: 横屏:风景画
         
         - 使用代码控制设备的方向,好处:需要的时候改变屏幕方向的时候单独处理!
         - 设置支持的方向之后,当前的控制器及自控制器都会遵循这个方向!
         - 如果播放视频,通常是通过 modal 展现的!
     */
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    

    
}
    
// extension 类似于 OC 中的分类,在 Swift 中还可以用来切分代码块
// 可以把相近功能的函数,放在一个 extension 中
// 便于代码维护
// 注意:和 OC 的分类一样,extension 中不能定义属性
// MARK: - 设置界面

extension XBBMainViewController {
    
    //MARK: - 撰写按钮
    func setupComposeButton() {

        tabBar.addSubview(composeButton)
        // 计算按钮的宽度
        let count = CGFloat(childViewControllers.count)
        // 将向内缩减的宽度减少,能够让按钮宽度变大,盖住容错点,防止穿帮
        let w = tabBar.bounds.width / count - 1
        // CGRectInset
        // 插入中间点
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        // 按钮监听方法
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
    }
    
    
    
    //MARK: - 监听方法
    // 撰写微博 FIXME:没有实现
    @objc private func composeStatus() {
        print("撰写微博")
          
        // 测试方向旋转
        let vc = UIViewController()
        let nav = UINavigationController(rootViewController: vc)
        vc.view.backgroundColor = UIColor.cz_random()
        present(nav, animated: true, completion: nil)
        
    }
    
    
    // 设置所有子控制器
    func setupChildControllers(){
        let array = [
        ["clsName":"XBBHomeViewController","title":"首页","imageName":"home"],
        ["clsName":"XBBMessageViewController","title":"消息","imageName":"message_center"],
        ["clsName":"UIViewController"],
        ["clsName":"XBBDiscoverViewController","title":"发现","imageName":"discover"],
        ["clsName":"XBBProfileViewController","title":"我","imageName":"profile"],
        ]
        var arrayM = [UIViewController]()
        
        for dict in array{
            arrayM.append(controllers(dict: dict))
            
        }
        
        viewControllers = arrayM
    }
    
    /// 使用字典创建一个子控制器
    ///
    /// - Parameter dict: 信息字典[clsName,title,imageName ]
    /// - Returns: 子控制器
    private func controllers(dict:[String:String]) -> UIViewController {
    
        
        //1. 取得字典内容
        guard let clsName = dict["clsName"],
        let title = dict["title"],
        let imageName = dict["imageName"],
        // 1> 将 clsName 转换成 cls
        let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? UIViewController.Type
            else{
        return UIViewController()
        }
    
        //2. 创建视图控制器
        let vc = cls.init()
        
        vc.title = title
        
        //3.设置图像
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal) //渲染
        
        //4.设置tabbar标题字体(大小)
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .highlighted) //颜色
        //设置颜色的另一种方法
        // tabBar.tintColor = UIColor.orange
        
        //大小(默认12号字体)
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12)], for: .normal)
        
        
        
        // 实例化导航控制器的时候,会调用 push 方法将rootVC 压在栈底
        let nav = XBBNavigationController(rootViewController: vc)
        
        return nav
        
        
        
    
    }
    
}



