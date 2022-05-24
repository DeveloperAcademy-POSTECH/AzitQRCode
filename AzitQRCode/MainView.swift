//
//  ContentView.swift
//  AzitQRCode
//
//  Created by Choi Inho on 2022/05/24.
//

import SwiftUI

struct MainView: View {
	
	
    var body: some View {
		NavigationView{
			
			
			List {
				NavigationLink(
					destination: Azit20220606()
						.navigationBarBackButtonHidden(true)
						.navigationBarTitle("애지트 티셔츠 보관창고")
				) {
					HStack {
						Text("Azit With WWDC")
							.padding()
						Spacer()
						//Image(systemName: "chevron.right")
					}
				} // NavigationLink
			} // List
		} // NavigationView
		.navigationBarTitle("Azit QR Code")
		
    } // View
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

