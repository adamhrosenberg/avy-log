//
//  LogEditView.swift
//  SlidePath
//
//  Created by Adam Rosenberg on 12/19/21.
//

import SwiftUI

struct LogEditView: View {

    var log: Log
    var updating: Bool
    @State var logTitle = ""
    @State var logBody = ""
    @State var logDate = ""

    var body: some View {
        VStack(spacing: 20){
            
            
            Form {
                Section(header: Text("Log Information")) {
                    TextField("Log Title", text: $logTitle)
                    TextField("Log Body", text: $logBody)
                    TextField("Log Date", text: $logDate)
                }
                    
            }
            Button(action: {
                
            }, label: {
                Text(updating ? "Update" : "Add")
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            })
                .padding()
        }
    }
}

struct LogEditView_Previews: PreviewProvider {
    static var previews: some View {
        LogEditView(log: Log(title: "title", date: "date", _id: "123", log: "test log body"), updating: true)
    }
}
