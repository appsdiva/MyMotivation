//
//  ContentView.swift
//  MyMotivation
//
//  Created by Stacey Smith on 4/16/20.
//  Copyright © 2020 AppsDevo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    
    
    
    var body: some View {
        
    ZStack {
        
        //LinearGradient(gradient: Gradient(colors: [ .blue, .black, .purple]), startPoint: .top, endPoint: .bottom)
        //.edgesIgnoringSafeArea(.all)
        
        BackCardView()
                       .background(show ? Color.purple : Color.purple)
                       .cornerRadius(20)
                       .shadow(radius: 20)
                       .offset(x: 0, y: show ? -100 : -60)
                       .offset(x: viewState.width, y: viewState.height)
                       .scaleEffect(0.9)
                       .rotationEffect (.degrees (show ? 0 : 8))
                       //.rotation3DEffect(Angle(degrees: 10), axis: (x: 10.0, y: 0, z: 0))
                       //.blendMode(.hardLight)
                       .animation(.easeIn(duration: 0.5))
                   
                   
        BackCardView()
                       .background(show ? Color.blue : Color.blue)
                       .cornerRadius(20)
                       .shadow(radius: 20)
                       .offset(x: 0, y: show ? -50 : -30)
                       .offset(x: viewState.width, y: viewState.height)
                       .scaleEffect(0.95)
                       .rotationEffect(Angle.degrees(show ? 0 : 4))
                       //.rotation3DEffect(Angle(degrees: 5), axis: (x: 10.0, y: 0, z: 0))
                       .blendMode(.darken)
                       .animation(.easeIn(duration: 0.3))
                   
        
       QuoteView()
                     .offset(x: viewState.width, y: viewState.height)
                      //.blendMode(.hardLight)
                      .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                      .onTapGesture {
                          self.show.toggle()
                  }
        
        .gesture(
            DragGesture().onChanged { value in
                self.viewState = value.translation
                self.show = true
            }
            .onEnded { value in
                self.viewState = .zero
                self.show = false
            }
        )

        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct QuoteView: View  {
    
    let gradient = Gradient(colors: [.blue, .purple, .blue])
    
    var body: some View{
    
 VStack {
            VStack (alignment: .leading) {
                
                Text("'We always know this is true as once a wise man said that great things never come from comfort zones.'")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .foregroundColor(.white)
                    .padding(20)
                
                Text ("Unknown")
                    .foregroundColor(.white)
                    .frame(width: 330, height: 35, alignment: .bottomTrailing)
                    .padding(.horizontal, 20)
                    .font(.headline)
            }
           
    
        }
        
        .frame(width: 380.0, height: 400.0)
        .background(RadialGradient(gradient: gradient, center: .center, startRadius: 10, endRadius: 500)
        )
        .cornerRadius(20)
        .shadow(radius: 30)
       
        
    }
  }


struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 380.0, height: 400.0)
        
        
    }
}
    

