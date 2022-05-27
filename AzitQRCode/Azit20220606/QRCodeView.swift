//
//  QRCodeView.swift
//  AzitQRCode
//
//  Created by Choi Inho on 2022/05/25.
//
// original : https://www.hackingwithswift.com/books/ios-swiftui/generating-and-scaling-up-a-qr-code

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
	let context = CIContext()
	let filter = CIFilter.qrCodeGenerator()
	@Binding var session : String
	@Binding var name : String
	@Binding var size : String
	private let screenWidth = UIScreen.main.bounds.size.width
	
	var body: some View {
		VStack {
			Text("6월 6일, at Azit 입장권")
				.font(.largeTitle)
			
			HStack{
				Text("Session")
					.foregroundColor(.gray)
				Spacer()
				Text("\(self.session)")
					.font(.title3)
			}
			.frame(width: screenWidth * 0.5)
			.padding()
			
			HStack{
				Text("Name")
					.foregroundColor(.gray)
				Spacer()
				Text("\(self.name)")
					.font(.title3)
			}
			.frame(width: screenWidth * 0.5)
			.padding()
			
			HStack{
				Text("Size")
					.foregroundColor(.gray)
				Spacer()
				Text("\(self.size.uppercased())")
					.font(.title3)
			}
			.frame(width: screenWidth * 0.5)
			.padding()
			
			Image(uiImage: generateQRCode(from: "\(session),\(name),\(size)"))
				.interpolation(.none)
				.resizable()
				.scaledToFit()
				.frame(width: 200, height: 200)
		}
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

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView(session: .constant("Afternoon"), name: .constant("Toby"), size: .constant("2xl"))
    }
}