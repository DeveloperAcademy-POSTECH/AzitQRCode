//
//  SelectTshirt.swift
//  AzitQRCode
//
//  Created by Choi Inho on 2022/05/24.
//

import SwiftUI

struct SelectTshirt: View {
	
	@Binding var size : String
	@Binding var showModal : Bool
	
    var body: some View {
		VStack {
			Text("사이즈를 골라주세요.")
				.font(.largeTitle)
				.fontWeight(.black)
			
			Picker(selection: self.$size, label: Text("Size를 골라주세요.")) {
				Text("S").tag("S")
				Text("M").tag("M")
				Text("L").tag("L")
				Text("XL").tag("XL")
				Text("2XL").tag("2XL")
				Text("3XL").tag("3XL")
			}
			.pickerStyle(.wheel)
			.padding()
			
			Button(action: {self.showModal.toggle()}){
				ZStack{
					RoundedRectangle(cornerRadius: 8)
						.frame(height: 60)
						.foregroundColor(.blue)
					Text("결 정")
						.foregroundColor(.white)
				}
			}.padding()
		}
    }
}

struct SelectTshirt_Previews: PreviewProvider {
    static var previews: some View {
		SelectTshirt(size: .constant("L"), showModal: .constant(true))
    }
}
