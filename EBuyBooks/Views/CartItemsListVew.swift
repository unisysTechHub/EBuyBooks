//
//  CartItemsListVew.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 08/03/21.
//

import SwiftUI

struct CartItemsListVew: View {

    @ObservedObject var cartTimesListViewModel : CartItemsListViewModel = CartItemsListViewModel()
    var body: some View {
        if cartTimesListViewModel.showProgressBar {
            ProgressView().onAppear(){            cartTimesListViewModel.apiNetworRequest()
                print(screen_width)
            }
                .progressViewStyle(DarkBlueShadowProgressViewStyle())
        }
        else  {
        ScrollView {
            VStack {
        ForEach(cartTimesListViewModel.carItems, id: \.bookId){
            (carItemModel) in
            CartItemView(book: carItemModel, serialNo: cartTimesListViewModel.carItems.firstIndex(where: { $0.bookId == carItemModel.bookId
            })! + 1)
            
        }
                VStack(alignment : .trailing) {
            HStack {
                if cartTimesListViewModel.cartTotalAmount != 0 {
                Text("Cart Total Amount :").bold().foregroundColor(.black)
                Text(String(cartTimesListViewModel.cartTotalAmount)).foregroundColor(.red).bold()
            }
                else {
                    Text("Cart Empty ").bold().foregroundColor(.red)
                }
                }.padding(4).frame(width: (screen_width - CGFloat(4)), height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                }
            }
        
        }.navigationBarItems( trailing: NavigationLink(
                                destination:BooksListView().navigationBarBackButtonHidden(true)
,
            label: {
                Image(systemName: "house.fill")                   }).frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2))
        }
    }
}

struct CartItemsListVew_Previews: PreviewProvider {
    static var previews: some View {
        CartItemsListVew()
    }
}
