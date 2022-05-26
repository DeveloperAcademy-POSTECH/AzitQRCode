//
//  ContentView.swift
//  AzitQRCode
//
//  Created by Choi Inho on 2022/05/24.
//

import SwiftUI

struct MainView: View {
	@State var madebyModal = false
	@State var isNavigationBarHidden : Bool = true
	
    var body: some View {
		NavigationView {
				List {
					NavigationLink(
						destination: Azit20220606()
							.navigationBarBackButtonHidden(true)
							.navigationBarTitle("6월 6일, 애지트 축제")
					) {
						HStack {
							Text("6월 6일, 애지트 축제")
								.padding()
							Spacer()
						}
					} // NavigationLink
					
					NavigationLink(
						destination: CreditView()
							.navigationTitle("Credit Page")
					) {
						HStack {
							Text("Credit Page")
								.padding()
							Spacer()
						}
					}
				} // List
			
			.navigationTitle("Azit Entry QR Code")
		} // NavigationView
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
