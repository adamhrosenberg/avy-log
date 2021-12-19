//
//  ContentView.swift
//  SlidePath
//
//  Created by Adam Rosenberg on 12/19/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    let tabBarImageNames = ["person", "gear", "plus.app.fill", "pencil", "lasso"]
    var body: some View {
        VStack {
            
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        Text("first")
                            .navigationTitle("First tab")
                    }
                case 1:
                    ScrollView {
                        Text("TEXT")
                    }
                default:
                    Text("remaining tabs")
                }
            }
            
            Spacer()
            
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
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
