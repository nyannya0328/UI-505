//
//  Home.swift
//  UI-505
//
//  Created by nyannyan0328 on 2022/03/14.
//

import SwiftUI

struct Home: View {
    
    @State var currentTab : String = "In Box"
    
    @State var showMenu : Bool = false
    
    @State var padding : CGFloat = 0
    
    @State var navigationTag : String?
    var body: some View {
        ResponceView { prop in
            
            HStack(spacing:0){
                
                
                if prop.isLandScape && !prop.isSplit{
                    
                    SldeBar(prop: prop, currentTab: $currentTab)
                        .padding(.leading,prop.isIpad && prop.isLandScape ? padding : 0)
                }
                
                NavigationView{
                    
                    MainView(prop: prop)
                        .navigationBarHidden(true)
                }
                .modifier(PaddingModifrer(prop: prop, padding: $padding))
            
                
                
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .overlay {
                
                ZStack(alignment: .leading) {
                    
                    
                
                    
                    Color.black.opacity(showMenu ? 0.25 : 0).ignoresSafeArea()
                        .onTapGesture {
                            
                            withAnimation{showMenu.toggle()}
                        }
                    
                    if !prop.isLandScape || prop.isSplit{
                    
                    SldeBar(prop: prop, currentTab: $currentTab)
                        .offset(x: showMenu ? 0 : -300)
                    
                    }
                   
                    
                }
                
            }
            
         
        }
        .ignoresSafeArea(.container, edges: .leading)
    }
    
    @ViewBuilder
    func MainView(prop : Properties)->some View{
        
        
        VStack(spacing:0){
            
            HStack(spacing:15){
                
                if !prop.isLandScape || prop.isIpad{
                    
                    
                    Button {
                        withAnimation{
                            
                            showMenu.toggle()
                            
                            
                        }
                    } label: {
                        
                        Image(systemName: "line.3.horizontal")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                    
                    
                }
                
                
                TextField("Search", text: .constant(""))
                
                
                Image(systemName: "magnifyingglass")
            }
            .padding(.vertical,10)
            .padding(.horizontal,20)
            .background(
            
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .fill(.white)
            
            )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                VStack(spacing:20){
                    
                    
                    ForEach(users){user in
                        
                        
                        NavigationLink(tag:user.id,selection: $navigationTag) {
                            
                            
                            DetailView(user: user, prop: prop)
                        } label: {
                            
                            userCardView(user: user, prp: prop)
                            
                            
                        }

                        
                    }
                    
                    
                }
                .padding(.top,20)
                
                
            }
            
            
            
            
            
        }
        .padding()
      //  .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("BG"))
        .onAppear {
            navigationTag = nil
        }
        
        
        
    }
    @ViewBuilder
    func userCardView(user : User,prp:Properties)->some View{
        
        
        VStack(alignment: .leading, spacing: 13) {
            
            
            HStack(spacing:20){
                
                Image(user.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
                
                
                VStack(alignment: .leading, spacing: 13) {
                    
                    
                    Text(user.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    
                    Text(user.title)
                        .font(.caption)
                    
                }
                .foregroundColor(navigationTag == user.id && prp.isIpad ? .white : .black)
                .frame(maxWidth:.infinity,alignment: .leading)
                
                
                Text("Now")
                    .font(.footnote)
                    .foregroundColor(.black)
                    .foregroundColor(navigationTag == user.id && prp.isIpad ? .white : .black)
                    
                
                
            }
            
            
            Text("Jaob Degrom,Gerrit Cole.Aroldis Chapman.Yu DarVish.Roki Sasaki")
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .foregroundColor(navigationTag == user.id && prp.isIpad ? .white : .gray)
                

            
        }
        .padding()
        .background(
        
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill((navigationTag == user.id && prp.isIpad ? Color("DarkBlue") : Color("LightBlue")))
        
        )
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
