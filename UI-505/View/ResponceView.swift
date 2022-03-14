//
//  ResponceView.swift
//  UI-505
//
//  Created by nyannyan0328 on 2022/03/14.
//

import SwiftUI

struct ResponceView<Content : View>: View {
    var content : (Properties) -> Content
    
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            let isLandScape = (size.width > size.height)
            let isIpad = UIDevice.current.userInterfaceIdiom == .pad
            
            content(Properties(isLandScape: isLandScape, isIpad: isIpad, isSplit: isSplit(), size: size))
                .frame(width: size.width, height: size.height)
                .onAppear {
                    
                    updateFraction(fraction: isLandScape && !isSplit() ? 0.3 : 0.5)
                }
                .onChange(of: isSplit(), perform: { newValue in
                    
                    
                    
                    updateFraction(fraction: isLandScape && !isSplit() ? 0.3 : 0.5)
                    
                })
                .onChange(of: isLandScape) { newValue in
                    
                    updateFraction(fraction: newValue && isSplit()  ? 0.3 : 0.5)
                }
            
        
        }
    }
    
    func updateFraction(fraction : Double){
        
        NotificationCenter.default.post(name: NSNotification.Name("UPDATEFRACTION"),object: nil,userInfo: [
        
        
        
            "fraction" : fraction
        
        ])
        
    }
    func isSplit() -> Bool{
        
        
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            return false
        }
        
        return screen.windows.first?.frame.size != UIScreen.main.bounds.size
    }
}


struct Properties{
    
    var isLandScape : Bool
    var isIpad : Bool
    var isSplit : Bool
    var size : CGSize
}
