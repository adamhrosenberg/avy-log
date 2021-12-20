//
//  ContentView.swift
//  SlidePath
//
//  Created by Adam Rosenberg on 12/19/21.
//

import SwiftUI

protocol DataDelegate {
    func updateArray(newArray: String)
}
struct ContentView: View {
    @State var selectedIndex = 0
    @State var shouldFullScreen = false
    
    let tabBarImageNames = ["house", "map", "plus.app.fill", "list.dash", "person"]
    
    @State var logs: [Log] = []
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            ZStack {
                Spacer()
                    .fullScreenCover(isPresented: $shouldFullScreen, content: {
                        HStack {
                            Text("Enter Log Info")
                            Spacer()
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.black)
                                .onTapGesture(perform: {
                                    withAnimation {
                                        self.shouldFullScreen.toggle()
                                    }
                                })
                            
                        }
                        LogEditView(goToIndex: $selectedIndex,
                                    log: Log(title: "", date: "", _id: "", log: ""), updating: false)
                        
                    })
                
                switch selectedIndex {
                case 0:
                    // Home page
                    NavigationView {
                        List(logs, id: \._id) { log in
                            NavigationLink(destination: LogDetailView(log: log), label: {
                                LogCell(log: log)
                            }
                            )
                        }
                        .navigationTitle("Slidepath Feed")
                        .onAppear(perform: {
                            Api().getLogs { logs in
                                self.logs = logs
                                print(self.logs)
                            }
                        })
                        
                    }
                    
                case 1:
                    // Map
                    NavigationView {
                        Text("TODO: Visal Map View")
                    }
                case 2:
                    NavigationView {
                        LogEditView(goToIndex: $selectedIndex, log: Log(title: "", date: "", _id: "", log: ""), updating: false)
                        
                    }
                case 3:
                    // Your Entries
                    NavigationView {
                        List(logs, id: \._id) { log in
                            NavigationLink(destination: LogEditView(
                                goToIndex: $selectedIndex,
                                log: log, updating: true), label: {
                                LogCell(log: log)
                            }
                            )
                        }
                        .navigationTitle("Your entries")
                        .onAppear(perform: {
                            Api().getLogs { logs in
                                self.logs = logs
                                print(self.logs)
                            }
                        })
                    }
                default:
                    // Profile
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


struct LogCell: View {
    var log: Log
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5) {
                Text(log.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(log.date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
