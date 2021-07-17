//
//  ContentView.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 03/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
       
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/) {
            
            NavigationView {
            BooksListView()
            }
            
        }.frame(width: screen_width, height: screen_height, alignment: .top).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
