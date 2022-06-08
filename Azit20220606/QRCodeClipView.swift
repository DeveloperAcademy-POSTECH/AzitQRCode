//
//  QRCodeView.swift
//  Azit20220606
//
//  Created by Choi Inho on 2022/05/26.
//
// original : https://www.hackingwithswift.com/books/ios-swiftui/generating-and-scaling-up-a-qr-code

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeClipView: View {
	let context = CIContext()
	let filter = CIFilter.qrCodeGenerator()
	@Binding var session : String
	@Binding var name : String
	private let screenWidth = UIScreen.main.bounds.size.width
	private let screenHeight = UIScreen.main.bounds.size.height
	
	var body: some View {
		VStack {
			Spacer()
			Text("Let's 투게덥 on June 6th")
				.font(.largeTitle)
				.padding(.bottom, screenHeight * 0.05)
			
			HStack{
				Text("Session")
					.foregroundColor(.gray)
				Spacer()
				Text("\(self.session)")
					.font(.title3)
			}
			.frame(width: screenWidth * 0.5)
			.padding(.bottom, screenHeight * 0.01)
			
			HStack{
				Text("Name")
					.foregroundColor(.gray)
				Spacer()
				Text("\(self.name)")
					.font(.title3)
			}
			.frame(width: screenWidth * 0.5)
			
			Image(uiImage: generateQRCode(from: "\(session),\(name)"))
				.interpolation(.none)
				.resizable()
				.scaledToFit()
				.frame(width: 200, height: 200)
			
			
			Spacer()
			
			HStack {
				HStack {
					Text("Code & Idea by")
						.foregroundColor(.gray)
					Text("Toby")
						.fontWeight(.semibold)
				}
				.padding()
				Spacer()
				HStack {
					Text("Design by")
						.foregroundColor(.gray)
					Text("Jessica")
						.fontWeight(.semibold)
				}
				.padding()
			}
		} // VStack
	}
	
	func generateQRCode(from string: String) -> UIImage {
		
		filter.message = Data(string.utf8)

		if let outputImage = filter.outputImage {
			if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
				return UIImage(cgImage: cgimg)
			}
		}

		return UIImage(systemName: "xmark.circle") ?? UIImage()
	}
}
