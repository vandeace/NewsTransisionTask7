//
//  ContentView.swift
//  NewsTransisionTask7
//
//  Created by Muhammad Jafar Ash Siddiq on 11/12/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State var data : [CardView] = cardViews
    @State var indexShow : Int = 0
    
    
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Whats new on SwiftUI")
                    .font(.system(size: 40, design: .rounded))
                .padding(.trailing,20)
                .fontWeight(.black)
            }
            ForEach(Array(data.enumerated()), id: \.offset) { index, datum in
                if index == indexShow {
                    PageView(datum: datum)
                        .onTapGesture {
                            if indexShow == 3 {
                                indexShow = 0
                            } else {
                                indexShow += 1
                            }
                            
                        }
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
        }
        .padding(.horizontal)
        .preferredColorScheme(.dark)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PageView: View {
    
    @State var datum : CardView
    
    var body: some View {
        VStack(alignment: .leading){
            Image("\(datum.image)")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(height: 400)
                .cornerRadius(10)
            VStack(alignment: .leading){
                Text("\(datum.category)")
                    .font(.system(size: 20, design: .rounded))
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
                    .padding(.bottom,1)
                Text("\(datum.heading)")
                    .font(.system(size: 24, design: .rounded))
                    .fontWeight(.black)
                Text("\(datum.author)")
                    .font(.system(size: 16, design: .rounded))
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
                HStack{
                    ForEach(1...(datum.rating), id: \.self) { item in
                        Image(systemName: "star.fill")
                            .font(.caption)
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.vertical,1)
                Text("\(datum.excerpt)")
                    .foregroundColor(.gray)
                    .font(.system(.body, design: .rounded))
            }.padding(.horizontal,10)
            
        }
        
    }
}
