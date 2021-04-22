//
//  NSObject+Tools.swift
//  CustomSearchBar
//
//  Created by L63 on 2021/3/10.
//

import Foundation

private var kPerformOnceKey: Void?

@objc extension NSObject{
    
    public var performOnceFlag:Bool{
        get{
            return objc_getAssociatedObject(self, &kPerformOnceKey) as? Bool ?? false
        }
        set{
            objc_setAssociatedObject(self, &kPerformOnceKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    public func performOnce(aselector :Selector){
        if performOnceFlag {
            return
        }
        performOnceFlag = true
        perform(aselector)
    }
    public func performOnceBlock(aselector:() -> Void){
        if performOnceFlag {
            return
        }
        performOnceFlag = true
        aselector()
        
    }
}

extension NSObject: LCCompatible {}
extension LC where Base == NSObject {
    public func performOnce(aselector :Selector) {
        base.performOnce(aselector: aselector)
    }
    public func performOnceBlock(aselector:() -> Void) {
        base.performOnceBlock(aselector: aselector)
    }
}
