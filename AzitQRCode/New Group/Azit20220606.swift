//
//  Azit20220606.swift
//  AzitQRCode
//
//  Created by Choi Inho on 2022/05/24.
//

import SwiftUI

struct Azit20220606: View {
	@State private var session : String = "Morning"
	@State private var name = ""
	@State private var size = "L"
	@State private var showQRModal = false
	@State private var showSizeModal = false
	@State private var isSelected = false

	
	var body: some View {
		VStack {
				Form {
					Section {
						ItemTitle("SESSION을 정해주세요.")
						Picker(selection: self.$session, label: Text("안녕하세요")) {
							Text("Morning").tag("Morning")
							Text("Afternoon").tag("Afternoon")
						}.pickerStyle(.segmented)
					}
					
					Section {
						HStack {
							Image(systemName: "tshirt")
							Text("티셔츠 사이즈를 골라주세요.")
							Spacer()
							Image(systemName: "chevron.right")
						}
						.sheet(isPresented: self.$showSizeModal, content: {SelectTshirt(size: self.$size, showModal: self.$showSizeModal)})
						.onTapGesture {
							self.showSizeModal.toggle()
						}
					}
					
					VStack(alignment: .leading) {
						ItemTitle("이름을 입력해주세요.")
						TextField("이름", text: self.$name)
							.disableAutocorrection(true)
							.textFieldStyle(RoundedBorderTextFieldStyle())
							.padding(.top, 0)
						
					} // VStack
					
				} // Form
			
			ZStack {
				RoundedRectangle(cornerRadius: 8)
					.foregroundColor(self.name == "" ? .gray : .blue)
				
				Text("QR코드 생성하기")
			}
			.sheet(isPresented: self.$showQRModal, content: { })
			.frame(height : 60)
			.padding()
			.onTapGesture {
				if self.name != "" && self.isSelected {
					self.showQRModal.toggle()
				}
			}
			
		} // VStack
	} // View
		
}

struct Azit20220606_Previews: PreviewProvider {
    static var previews: some View {
		Azit20220606()
			.preferredColorScheme(.dark)
	}
}

struct ItemTitle : View {
	var text : String
	
	init(_ str : String){
		self.text = str
	}
	
	var body: some View {
		Text(text)
			.fontWeight(.heavy)
			.font(.headline)
	}
}
