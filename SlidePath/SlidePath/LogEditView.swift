//
//  LogEditView.swift
//  SlidePath
//
//  Created by Adam Rosenberg on 12/19/21.
//

import SwiftUI

class FormViewModel: ObservableObject {
   
}

struct LogEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var goToIndex: Int;
    @Binding var logs: [Log];
    var log: Log
    var updating: Bool
    
    @State var logTitle = ""
    @State var logBody = ""
    @State var logDate = ""
//    @StateObject var viewModel = FormViewModel()
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
                print(logDate)
                updating ?
                print("updating")
//                Api().addLog(date: logDate, title: logTitle, log: logBody)
                :
                Api().addLog(date: logDate, title: logTitle, log: logBody)
                goToIndex = updating ? 3 : 0
                if(!updating) {
                    Api().getLogs { logs in
                        self.logs = logs
                        print(self.logs)
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            }, label: {
                Text(updating ? "Update" : "Add")
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            )
                .padding()
        }
    }
}

struct LogEditView_Previews: PreviewProvider {
    static var previews: some View {
        LogEditView(goToIndex: .constant(0), logs: .constant([Log(title: "title", date: "date", _id: "123", log: "test log body")]), log: Log(title: "title", date: "date", _id: "123", log: "test log body"), updating: true)
    }
}
