//
//  ContentView.swift
//  AzitQRCode
//
//  Created by Choi Inho on 2022/05/24.
//

import SwiftUI

struct MainView: View {
	
	
    var body: some View {
		NavigationView {
			List {
				NavigationLink(
					destination: AzitWWDCView()
						.navigationBarBackButtonHidden(true)
						.navigationBarTitle("Azit WWDC")
				) {
					HStack {
						Text("Azit With WWDC")
							.padding()
						Spacer()
						//Image(systemName: "chevron.right")
					}
				} // NavigationLink
			} // List
		} // NavigationView
		.navigationBarTitleDisplayMode(.large)
		
		
    } // View
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// https://stackoverflow.com/questions/59234958/swiftui-navigationbarbackbuttonhidden-swipe-back-gesture
extension UINavigationController: UIGestureRecognizerDelegate {
	override open func viewDidLoad() {
		super.viewDidLoad()
		interactivePopGestureRecognizer?.delegate = self
	}

	public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
		return viewControllers.count > 1
	}
}
// END
