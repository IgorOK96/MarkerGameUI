//
//  ContentView.swift
//  MarkerGameUI
//
//  Created by user246073 on 10/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TestGame()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Рисование")
                }
            HelperView()
                .tabItem {
                    Image(systemName: "lightbulb")
                    Text("Помощь")
                }
        }
    }
}

#Preview {
    ContentView()
}
