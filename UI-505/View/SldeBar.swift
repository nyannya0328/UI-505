//
//  SldeBar.swift
//  UI-505
//
//  Created by nyannyan0328 on 2022/03/14.
//

import SwiftUI

struct SldeBar: View {
    var prop : Properties
    @Binding var currentTab : String
    var body: some View {
     
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 13) {
                
                
                Image("Logo")
                    .aspectRatio(contentMode: .fill)
                
                
                sideBarButton(icon: "tray.and.arrow.up.fill", title: "In Box")
                    .padding(.top,40)
                
                sideBarButton(icon: "paperplane", title: "Sent")
                sideBarButton(icon: "doc.fill", title: "Draft")
                sideBarButton(icon: "trash", title: "Deleted")
                
                
            }
            .padding()
            .padding(.top,15)
            
        }
        .padding(.leading,10)
        .frame(width: (prop.isLandScape ? prop.size.width : prop.size.height) / 4 > 300 ? 300 : (prop.isLandScape ? prop.size.width : prop.size.height) / 4)
        .background(
        
        Color("LightWhite")
            .ignoresSafeArea()
        
        )
    }
    @ViewBuilder
    func sideBarButton(icon : String,title : String) -> some View{
        
        
        Button {
            currentTab = title
        } label: {
            
            
            VStack{
                
                HStack(spacing:8){
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                        .opacity(currentTab == title ? 1 : 0)
                    
                    Image(systemName: icon)
                        .font(.callout)
                        .foregroundColor(currentTab == title ? Color("DarkBlue") : .gray)
                    
                    
                    
                    
                    Text(title)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(currentTab == title ? .black : .gray)
                        
                    
                    
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                
                Divider()
                
                
            }
           
        }

        
        
        
    }
}

struct SldeBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct PaddingModifrer : ViewModifier{
    
    var prop : Properties
    @Binding var padding : CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay {
                
                
                GeometryReader{proxy in
                    
                    Color.clear
                        .preference(key: PaddingKey.self, value: proxy.frame(in: .global))
                        .onPreferenceChange(PaddingKey.self) { value in
                            
                            self.padding = -(value.width / 2.2)
                            
                        }
                }
                
                
            }
    }
}

struct PaddingKey : PreferenceKey{
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        
        value = nextValue()
    }
    
}
