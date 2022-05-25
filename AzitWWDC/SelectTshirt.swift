//
//  SelectTshirt.swift
//  AzitWWDC
//
//  Created by Choi Inho on 2022/05/25.
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
			.border(.black, width: 1)
			.padding()
			
			Button(action: {self.showModal.toggle()}){
				ZStack{
					RoundedRectangle(cornerRadius: 8)
						.frame(height: 60)
						.foregroundColor(.blue)
					Text("결 정")
						.foregroundColor(.white)
						.font(.system(size: 23))
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
