//
//  ContentView.swift
//  Diabetes
//
//  Created by Lambert Lani on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showWelcomeScreen = true

    var body: some View {
        TabView(selection: $selectedTab) {
            MainController()
                .tag(0)
                .tabItem {
                    Image(systemName: "house")
                }
            DiaryController()
                .tag(1)
                .tabItem {
                    Image(systemName: "star.fill")
                }
            AddNewSugarController()
                .tag(2)
                .tabItem {
                    Image(systemName: "plus")
                        .imageScale(.large)
                }
            AnalyticsController()
                .tag(3)
                .tabItem {
                    Image(systemName: "checklist")
                }
            SettingsController()
                .tag(4)
                .tabItem {
                    Image(systemName: "gear")
                }
        }
        .sheet(isPresented: $showWelcomeScreen) {
                   WelcomeScreen()
               }
               .onAppear {
                   // Показываем модальный экран только при первом запуске
                   if UserDefaults.standard.bool(forKey: "hasLaunchedBefore") == false {
                       showWelcomeScreen = true
                       UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
                   }
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
