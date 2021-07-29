//
//  UIView+Tools.swift
//  CustomSearchBar
//
//  Created by L63 on 2021/2/26.
//

import Foundation
import UIKit
/// 延时相关
@objc  extension UIView{
 public func addSubviewsRandomColors() {
        self.backgroundColor = randomColor()
        if self.subviews.count > 0{
            for subview in self.subviews {
                subview.backgroundColor = randomColor()
                subview.addSubviewsRandomColors()
            }
        }
    }
    func randomColor() -> UIColor {
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

extension LC where Base == UIView {
    public func addSubviewsRandomColors() {
        base.addSubviewsRandomColors()
    }
    public var viewController: UIViewController? {
        get{ base.viewController }
    }
    public var navController: UINavigationController? {
        get { base.navController }
    }
   public var tabBarController: UITabBarController? {
        get { base.tabBarController }
    }
    /// 部分圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
   public func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: base.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = base.bounds
        maskLayer.path = maskPath.cgPath
        base.layer.mask = maskLayer
    }


}
