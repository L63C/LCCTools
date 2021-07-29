//
//  LCPrefix.swift
//  LCCTools
//
//  Created by L63 on 2021/4/22.
//

import UIKit

public struct LC<Base> {
   public let base: Base
    init(_ base: Base) {
        self.base = base
    }
}
public protocol LCCompatible { }
public extension LCCompatible {
    static var lc:LC<Self>.Type{
        get{
            LC<Self>.self
        }
        set{}
    }
    var lc: LC<Self>{
        get {
            LC(self)
        }
        set {}
    }
    
}
