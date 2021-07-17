//
//  BookDetailsView.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 05/03/21.
//

import SwiftUI

struct BookDetailsView: View {
    var bookModel : Book
   @ObservedObject var bookImageStore = BookImageStore()
    @StateObject var addBookToCartViewModel = AddToCartViewModel()
    var body: some View {
        GeometryReader { geo in
           
                VStack {
                    HStack(alignment: .top, spacing: nil, content: {
                        Image(uiImage :self.bookImageStore.bookImage! ).fixedSize().frame(width: 100, height: 200 , alignment: .center).onAppear(){
                            bookImageStore.loadImage(s3ObejctKey: "")
                        }
//                        Image("swiftbookimage").fixedSize().frame(width: 100, height: 200 , alignment: .center)
                        GeometryReader { geo in
                            VStack(alignment: .center, spacing: nil, content: {
                                
                                BookDetailsRow(header: "Title", name: bookModel.title!).frame(width: geo.size.width, height: geo.size.height/4, alignment: .center)
                                Divider().background(Color.black).padding(0)
                                BookDetailsRow(header: "Author", name: bookModel.author!).frame(width: geo.size.width, height: geo.size.height/4, alignment: .center)
                                Divider().background(Color.black).padding(0)
                                BookPriceView(header: "Price", price:  bookModel.price!).frame(width: geo.size.width, height: geo.size.height/4, alignment: .center)
                                
                                
                            }).frame(width: geo.size.width - CGFloat(16), height: 184, alignment: .center).padding(8).alignmentGuide(.top, computeValue: { dimension in
                                dimension[.top]
                            })
                        }
                        
                    })
                    
                    Divider()
                    HStack {
                        
                        Button("AddToCart", action: addBookToCart).frame(width: geo.size.width/2, height: 40, alignment: .center)

                        
                    }.frame(width: geo.size.width, height: 40, alignment: .center)
                    
                }.frame(width: geo.size.width - CGFloat(8), height: 250, alignment: .center)
                .border(Color.black, width: 2)
                .cornerRadius(3.0).padding(4)
            }
        
    }
    func  addBookToCart()  {
        addBookToCartViewModel.apiNetworkRequest(book: self.bookModel)
    }
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsView(bookModel: Book())
    }
}
