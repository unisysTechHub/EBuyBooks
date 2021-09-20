//
//  BooksListView.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 05/03/21.
//

import SwiftUI
import Amplify

struct BooksListView: View {
    @State var searchString  = ""
    @StateObject var booksListViewModel :BookListViewModel  = BookListViewModel()
    var body: some View {
        
        if booksListViewModel.showProgressBar {
            ProgressView().onAppear(){            booksListViewModel.apiNetworRequest()
                print(screen_width)
            }
                .progressViewStyle(DarkBlueShadowProgressViewStyle())
        }
        else  {
                ScrollView {
            ForEach(booksListViewModel.booksList, id : \.bookId)
                { (bookModel) in
                NavigationLink(
                    destination: BookDetailsView(bookModel: bookModel)
                ) {
                BookDetailsView(bookModel: bookModel).frame(width: screen_width, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            
                }
                
                } .toolbar {
                    ToolbarItem(id: "home", placement: ToolbarItemPlacement.bottomBar, showsByDefault: true){
                        Button(action: {Amplify.Auth.signOut()}, label: {
                            Image(systemName: "homekit")
                        })
                    }
                }          .navigationBarItems(leading:  HStack{
                Text("EBuyBooks").foregroundColor(.white)
                TextField("search books", text: $searchString).frame(width: 175, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color.white).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                    
            }.background(Color.black), trailing: NavigationLink(
                destination: CartItemsListVew(),
                label: {
                    Image(systemName: "cart.fill")                   }).frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2))

        
    }
    }
    
}

struct BooksListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView()
    }
}
