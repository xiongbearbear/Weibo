//
//  Bundle+Extensions.swift
//  反射机制
//
//  Created by xiong on 16/11/27.
//  Copyright © 2016年 xiong. All rights reserved.
//

import Foundation

extension Bundle{
    // 返回命名空间字符串
//    func nameSpace() -> String {
//        
//        //return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
//        return infoDictionary?["CFBundleName"] as? String ?? ""
//    }
    
    // 计算型属性类似于函数,没有参数,有返回值
    var nameSpace:String{
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
 
