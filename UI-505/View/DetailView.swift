//
//  DetailView.swift
//  UI-505
//
//  Created by nyannyan0328 on 2022/03/14.
//

import SwiftUI

struct DetailView: View {
    var user : User
    var prop : Properties
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                
                HStack{
                    
                    Button {
                        dismiss()
                        
                    } label: {
                        
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                    .opacity(prop.isLandScape || !prop.isSplit ? (prop.isIpad ? 0 : 1) : 1)
                    
                    Spacer()
                    
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }


                    
                    
                    
                }
                .padding([.horizontal,.bottom])
                
                
                Divider()
                
                
                HStack{
                    
                    Image(user.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        
                        HStack{
                            Text(user.name)
                                .fontWeight(.bold)
                            
                            
                            if !prop.isLandScape{
                                
                                Text("Gmail.com")
                                
                                
                            }
                            
                            
                        }
                        
                        
                        if prop.isLandScape{
                            Text("Gmail.com")
                            
                            
                        }
                        
                        
                        
                        Text(user.title)
                            .font(.title.weight(.heavy))
                      
                        
                    }
                    .frame(maxWidth:.infinity,alignment: .leading)
                    
                    
                    Text("Now")
                        .font(.caption)
                        .foregroundColor(.gray)
  
                   
                    
                }
                
                Text("""
What is Lorem Ipsum?
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
""")
                .font(.footnote)
                .foregroundColor(.gray)
              
            }
            .padding(.top,15)
            .padding()
            
            
        }
        .navigationBarHidden(true)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
