//
//  BookDetailsRow.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 05/03/21.
//

import SwiftUI

struct BookDetailsRow: View {
    var header : String
    var name : String
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text(header).frame(width: geo.size.width, height: geo.size.height/2, alignment: .center).font(.headline)
        Text(name).frame(width: geo.size.width, height: geo.size.height/2, alignment: .center)    }
        }
    }
}

struct BookDetailsRow_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsRow(header: "Author", name: "AuthorName")
    }
}
