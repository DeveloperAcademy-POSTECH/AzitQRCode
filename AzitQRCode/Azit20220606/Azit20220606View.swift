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
	@State private var size = "XL"
	@State private var showQRModal = false
	@State private var showSizeModal = false
	@State private var isSelected = false
	@State private var tshirtsRequest = false
	private let formColor : Color = Color(.sRGB, red: 242/255, green: 242/255, blue: 247/255, opacity: 1)
	
	var body: some View {
		ZStack {
			Rectangle()
				.ignoresSafeArea()
				.foregroundColor(formColor)
			
			VStack{
				Form {
					Section {
						Text("SESSION을 정해주세요.").fontWeight(.semibold)
						Picker(selection: self.$session, label: Text("안녕하세요")) {
							Text("Morning").tag("Morning")
							Text("Afternoon").tag("Afternoon")
							Text("Mentors / Ops").tag("Mentors / Ops")
						}.pickerStyle(.segmented)
					}
					
					Section {
						VStack(alignment: .leading) {
							Text("영어 닉네임을 입력해주세요.").fontWeight(.semibold)
							TextField("Example) Toby", text: self.$name)
								.disableAutocorrection(true)
								.textFieldStyle(RoundedBorderTextFieldStyle())
								.padding(.top, 0)
						} // VStack
					} // Section
		
				} // Form
			
				
				ZStack {
					Rectangle()
						.foregroundColor(self.name == "" ? .gray : .clear)
						.background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7294117647, green: 0.4588235294, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.2235294118, green: 0.07450980392, blue: 0.7215686275, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
						.cornerRadius(16)
		

					Text("QR코드 생성하기")
						.foregroundColor(.white)
				}
				.sheet(isPresented: self.$showQRModal, content: {QRCodeView(session: self.$session, name: self.$name)})
				.frame(height : 60)
				.padding()
				.onTapGesture {
					if self.name != "" {
						fastModal()
					}
				}
				
				
			} // VStack
		} // ZStack
	} // body
	
	func fastModal() {
		DispatchQueue.main.async {
			self.showQRModal.toggle()
		}
	}
}


extension UIViewController {
	open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){self.view.endEditing(true)}
}

struct Azit20220606_Previews: PreviewProvider {
    static var previews: some View {
		Azit20220606()
	}
}
