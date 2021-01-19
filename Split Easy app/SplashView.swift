//
//  SplashView.swift
//  Split Easy
//
//  Created by Lawrence Tsui on 19/1/21.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Image(systemName:"dollarsign.square")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .frame(width: 180, alignment: .center)
                      .accessibility(hidden: true)
                .imageScale(.large)
               
                                      .animation(nil)
                .scaleEffect()
                                      .padding()
                                      .animation(.spring())
                  Text("Welcome to")
                    .bold()
            

                  Text("Split easy")
                  
                    
        }
          }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
