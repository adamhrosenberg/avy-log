//
//  LogDetailView.swift
//  SlidePath
//
//  Created by Adam Rosenberg on 12/19/21.
//

import SwiftUI

struct LogDetailView: View {
    var log: Log
    
    var body: some View {
        VStack(spacing: 20){
            
            Image("pit-h")
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .cornerRadius(12)
            
            Text(log.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing: 40) {
                Label("1000", systemImage: "eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(log.date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
                        
            Text(log.log)
                .font(.body)
                .padding()
        }
    }
}

struct LogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LogDetailView(log: Log(title: "title", date: "date", _id: "123", log: "test log body"))
    }
}
