//
//  CartItemView.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 08/03/21.
//

import SwiftUI

struct CartItemView: View {
    
    var book : Book
    var serialNo : Int
    var body: some View {
        HStack {
            Text("\(serialNo).")
         
                HStack {
                   
                        VStack {
                            Image("swiftbookimagesmall")
                            Text(book.title!)
                        }.frame(width: (screen_width - CGFloat(32))*2/3, height: 100, alignment: .center)
                    VStack {
                        Text("Price").bold().foregroundColor(.red)
                        Text(String(book.price!)).bold().foregroundColor(.red)
                    }.frame(width: (screen_width - CGFloat(32))/3, height: 100, alignment: .center)
                    
                }.frame(width: (screen_width - CGFloat(32)), height: 100, alignment: .leading)
            
        }.padding(4).frame(width: (screen_width - CGFloat(4)), height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
    }
}

struct CartItemView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(book: Book(),serialNo: 1)
    }
}
