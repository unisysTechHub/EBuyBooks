//
//  BookPriceView.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 05/03/21.
//

import SwiftUI

struct BookPriceView: View {
    

     var header : String
     var price : Double
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text(header).frame(width: geo.size.width, height: geo.size.height/2, alignment: .center).font(.headline)
        Text("$\(String(price))").frame(width: geo.size.width, height: geo.size.height/2, alignment: .center)    }
        }
    }
}

struct BookPriceView_Previews: PreviewProvider {
    static var previews: some View {
        BookPriceView(header:"Price", price:  500.00)
    }
}
