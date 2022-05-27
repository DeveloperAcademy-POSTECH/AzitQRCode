//
//  Azit20220606App.swift
//  Azit20220606
//
//  Created by Choi Inho on 2022/05/26.
//

import SwiftUI

@main
struct Azit20220606App: App {
    var body: some Scene {
        WindowGroup {
			NavigationView{
				Azit20220606View()
					.navigationTitle(Text("6월 6일, 애지트 축제"))
			}
        }
    }
}
