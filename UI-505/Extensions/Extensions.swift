//
//  Extensions.swift
//  UI-505
//
//  Created by nyannyan0328 on 2022/03/14.
//

import SwiftUI

extension UISplitViewController{
    
    open override func viewDidLoad() {
        
        self.preferredDisplayMode = .twoDisplaceSecondary
        self.preferredSplitBehavior = .displace
        self.preferredPrimaryColumnWidthFraction = 0.3
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateView(notifi:)), name: Notification.Name("UPDATEFRACTION"), object: nil)
        
    }
    
    @objc
    func updateView(notifi : Notification){
        
        
        if let info = notifi.userInfo,let fraction = info["fraction"] as? Double{
            
            
            self.preferredPrimaryColumnWidthFraction = fraction
            
            
        }
        
    }
    
    
    
}
