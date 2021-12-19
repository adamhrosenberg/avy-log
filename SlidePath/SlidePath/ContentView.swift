//
//  ContentView.swift
//  SlidePath
//
//  Created by Adam Rosenberg on 12/19/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    @State var shouldFullScreen = false
    let tabBarImageNames = ["house", "map", "plus.app.fill", "list.dash", "person"]
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack {
                Spacer()
                    .fullScreenCover(isPresented: $shouldFullScreen, content: {
                        Button(action: {shouldFullScreen.toggle()}, label: {
                            Text("main")
                            
                        })
                    })
                switch selectedIndex {
                    case 0:
                        NavigationView {
                            ScrollView {
                                Text("TEXT")
                            }
                            .navigationTitle("List of entries")
                        }
                    case 1:
                        NavigationView {
                            Text("TODO: Visal Map View")
                        }
                    case 3:
                        NavigationView {
                            Text("Your Entries")
                        }
                    default:
                        NavigationView {
                            Text("Your profile")
                        }
                    }
            }
                    
            Divider()
                .padding(.bottom, 8)
            
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        
                        if (num == 2) {
                            shouldFullScreen.toggle()
                            return
                        }
                        
                        
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == 2 {
                            // + Tab
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 44, weight: .bold))
                                .foregroundColor(.pink)
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black) :
                                                        .init(white: 0.8))
                        }
                        Spacer()
                    })
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13 Pro Max")
        }
    }
}
//TabView {
//    Text("first")
//        .tabItem {
//            Image(systemName: "person")
//            Text("First")
//        }
//    Text("Second")
//        .tabItem {
//            Image(systemName: "gear")
//            Text("First")
//        }
//}
