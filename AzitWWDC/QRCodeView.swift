//
//  QRCodeView.swift
//  AzitWWDC
//
//  Created by Choi Inho on 2022/05/25.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
	let context = CIContext()
	let filter = CIFilter.qrCodeGenerator()
	@Binding var session : String
	@Binding var name : String
	@Binding var size : String
	
	var body: some View {
		VStack {
			Text("Session : \(session)")
				.padding()
			Text("name : \(name)")
				.padding()
			Text("size : \(size)")
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
