//
//  CreditView.swift
//  AzitQRCode
//
//  Created by Choi Inho on 2022/05/25.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
		VStack {
			VStack {
				Text("Code & Idea By").padding()
				Link(destination: URL(string: "https://github.com/E-know")!) {
					Text("Toby @2022 Inho Choi")
						.font(.title3)
				}
			}
			VStack {
				Text("Design By").padding()
				Link(destination: URL(string: "https://github.com/hanyeonhee")!) {
					Text("Jessica @2022 Yeonhee Han")
						.font(.title3)
				}
			}
		}
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
