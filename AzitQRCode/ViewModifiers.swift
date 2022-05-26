//
//  ViewModifiers.swift
//  AzitQRCode
//
//  Created by Choi Inho on 2022/05/26.
//

import Foundation
import SwiftUI

// https://stackoverflow.com/questions/57517803/how-to-remove-the-default-navigation-bar-space-in-swiftui-navigationview
struct HiddenNavigationBar: ViewModifier {
	func body(content: Content) -> some View {
		content
		.navigationBarTitle("", displayMode: .inline)
		.navigationBarHidden(true)
	}
}

extension View {
	func hiddenNavigationBarStyle() -> some View {
		modifier( HiddenNavigationBar() )
	}
}
