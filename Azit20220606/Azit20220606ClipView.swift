//
//  Azit20220606View.swift
//  Azit20220606
//
//  Created by Choi Inho on 2022/05/26.
//

import SwiftUI

struct Azit20220606ClipView: View {
	@State private var session : String = "Morning"
	@State private var name = ""
	@State private var size = "XL"
	@State private var showQRModal = false
	@State private var showSizeModal = false
	@State private var isSelected = false
	@State private var tshirtsRequest = false
	private let formColor : Color = Color(.sRGB, red: 242/255, green: 242/255, blue: 247/255, opacity: 1)
	
	var body: some View {
		VStack {
			Form {
				Section {
					Text("SESSION을 정해주세요.").fontWeight(.semibold)
					Picker(selection: self.$session, label: Text("안녕하세요")) {
						Text("Morning").tag("Morning")
						Text("Afternoon").tag("Afternoon")
						Text("Mentors / Ops").tag("Mentors / Ops")
					}.pickerStyle(.segmented)
				}
				
//				Section {
//					Toggle("티셔츠 신청하셨나요?", isOn: self.$tshirtsRequest)
//					if tshirtsRequest {
//						HStack {
//							Text("티셔츠 사이즈를 골라주세요.")
//							Spacer()
//							Image(systemName: "tshirt")
//							Text(self.size).fontWeight(.semibold)
//							Image(systemName: "chevron.right")
//						}
//						.sheet(isPresented: self.$showSizeModal, content: {SelectTshirt(size: self.$size, showModal: self.$showSizeModal)})
//						.onTapGesture {
//							self.showSizeModal.toggle()
//						}
//					}
//
//				}
				Section {
					VStack(alignment: .leading) {
						Text("영어 닉네임을 입력해주세요.").fontWeight(.semibold)
						TextField("Example) Toby", text: self.$name)
							.disableAutocorrection(true)
							.textFieldStyle(RoundedBorderTextFieldStyle())
							.padding(.top, 0)
					} // VStack
				}
				

				
			} // Form
		
			
			ZStack {
				RoundedRectangle(cornerRadius: 8)
					.foregroundColor(self.name == "" ? .gray : .blue)
				
				Text("QR코드 생성하기")
					.foregroundColor(.white)
			}
			.sheet(isPresented: self.$showQRModal, content: {QRCodeClipView(session: self.$session, name: self.$name)})
			.frame(height : 60)
			.padding()
			.onTapGesture {
				if self.tshirtsRequest == false {
					self.size = "nil"
				}
				if self.name != "" {
					self.showQRModal.toggle()
				}
			}
			.background(formColor)
		} // VStack
		.background(formColor)
	} // body
}

struct Azit20220606_Previews: PreviewProvider {
	static var previews: some View {
		Azit20220606ClipView()
	}
}
