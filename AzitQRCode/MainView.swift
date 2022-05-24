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
				listComponent(name: "Azit in 20220606", destination: <#T##AnyView#>)
			} // List
		} // NavigationView
		.navigationTitle("A-zit QR Code")
	} // body
		
} // MainView


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}


struct listComponent : View {
	@State var name : String
	@State var destination : AnyView
	var body: some View {
		NavigationLink(destination: destination) {
			HStack {
				Text(name)
					.padding()
				Spacer()
				Image(systemName: "chevron.right")
			}
		}
	}
}
