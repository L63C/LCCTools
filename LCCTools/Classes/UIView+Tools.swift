//
//  UIView+Tools.swift
//  CustomSearchBar
//
//  Created by L63 on 2021/2/26.
//

import Foundation
import UIKit
/// 延时相关
extension UIView{
  @objc public func addSubviewsRandomColors() {
        self.backgroundColor = randomColor()
        if self.subviews.count > 0{
            for subview in self.subviews {
                subview.backgroundColor = randomColor()
                subview.addSubviewsRandomColors()
            }
        }
    }
    @objc func randomColor() -> UIColor {
        UIColor.init(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1);
    }
    
}
/// 控制器相关
extension UIView {
    //获取view所在的 视图控制器
    var viewController: UIViewController? {
        get {
            var nextResponder = next
            while  (nextResponder != nil){
                if nextResponder is UIViewController {
                    return nextResponder as! UIViewController?
                }
                nextResponder = nextResponder?.next
            }
            return nil
        }
    }
    //获取view所在的 导航控制器
    var navController: UINavigationController? {
        get {
            var nextResponder = next
            while  (nextResponder != nil){
                if nextResponder is UINavigationController {
                    return nextResponder as! UINavigationController?
                }
                nextResponder = nextResponder?.next
            }
            return nil
        }
    }
    //获取view所在的 标签控制器
    var tabBarController: UITabBarController? {
        get {
            var nextResponder = next
            while  (nextResponder != nil){
                if nextResponder is UITabBarController {
                    return nextResponder as! UITabBarController?
                }
                nextResponder = nextResponder?.next
            }
            return nil
        }
    }
}
