//
//  ContentView.swift
//  AzitWWDC
//
//  Created by Choi Inho on 2022/05/25.
//

import SwiftUI

struct AzitWWDCView: View {
	@State private var session : String = "Morning"
	@State private var name = ""
	@State private var size = "XL"
	@State private var showQRModal = false
	@State private var showSizeModal = false
	@State private var isSelected = false

	
	var body: some View {
		VStack {
				Form {
					Section {
						Text("SESSION을 정해주세요.").fontWeight(.semibold)
						Picker(selection: self.$session, label: Text("안녕하세요")) {
							Text("Morning").tag("Morning")
							Text("Afternoon").tag("Afternoon")
						}.pickerStyle(.segmented)
					}
					
					Section {
						HStack {
							Text("티셔츠 사이즈를 골라주세요.")
							Spacer()
							Image(systemName: "tshirt")
							Text(self.size).fontWeight(.semibold)
							Image(systemName: "chevron.right")
						}
						.sheet(isPresented: self.$showSizeModal, content: {SelectTshirt(size: self.$size, showModal: self.$showSizeModal)})
						.onTapGesture {
							self.showSizeModal.toggle()
						}
					}
					Section {
						VStack(alignment: .leading) {
							Text("이름을 입력해주세요.").fontWeight(.semibold)
							TextField("이름", text: self.$name)
								.disableAutocorrection(true)
								.textFieldStyle(RoundedBorderTextFieldStyle())
								.padding(.top, 0)
						} // VStack
					}
					
					ZStack {
						RoundedRectangle(cornerRadius: 8)
							.foregroundColor(self.name == "" ? .gray : .blue)
						
						Text("QR코드 생성하기")
							.foregroundColor(.white)
					}
					.sheet(isPresented: self.$showQRModal, content: {QRCodeView(session: self.$session, name: self.$name, size: self.$size)})
					.frame(height : 60)
					.padding()
					.onTapGesture {
						if self.name != "" {
							print(self.isSelected)
							self.showQRModal.toggle()
						}
					}
				} // Form
			
		} // VStack
	} // body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AzitWWDCView()
    }
}
