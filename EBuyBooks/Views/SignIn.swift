//
//  SignIn.swift
//  EBuyBooks
//
//  Created by Ramesh kumar penta on 13/03/21.
//

import SwiftUI
import Combine
import Amplify
import AWSMobileClient

struct SignIn: View {
    var body: some View {
       
            
            Button(action: { signInWithWebUI()}) {
                Text("SignIn")}
           
    }
    
    func signInWithWebUI() {
        Amplify.Auth.signOut()
        
        Amplify.Auth.signInWithWebUI(presentationAnchor: ( UIApplication.shared.delegate as! AppDelegate).window!)
            .resultPublisher
            .sink {
                if case let .failure(authError) = $0 {
                    print("Sign in failed \(authError)")
                }
            }
            receiveValue: { signResult in
                
                print("Sign in succeeded token\(AWSMobileClient.default().userSub)")
                
            }
    }

}
struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
