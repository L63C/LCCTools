//
//  UITableView+Tools.swift
//  LCCTools
//
//  Created by L63 on 2021/4/13.
//

import Foundation
import UIKit

@objc extension UITableView{
    public func lc_getoffsetX() -> CGFloat {
        guard let navController = self.navController else {
            return 0
        }
        let isTranslucent = navController.navigationBar.isTranslucent
        if isTranslucent {
            return -navController.navigationBar.frame.maxY
        }else{
            return 0
        }
    }
    public func lc_scrollToTop(animated:Bool) {
        self.setContentOffset(CGPoint.init(x: 0, y: lc_getoffsetX()), animated: animated)
    }
}


extension LC where Base == UITableView {
    public func getoffsetX() -> CGFloat {
        base.lc_getoffsetX()
    }
    public func scrollToTop(animated:Bool) {
        base.lc_scrollToTop(animated: animated)
    }
}
