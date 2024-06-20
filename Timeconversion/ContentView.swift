//
//  ContentView.swift
//  Timeconversion
//
//  Created by Aaron Thompson on 20/06/2024.
//

import SwiftUI

struct ContentView: View {

    @State private var days = 0
    @State private var hours = 0
    @State private var minutes = 0
    
    var inSeconds: Int {
        
        let daystoSeconds = days * 24 * 60 * 60
        let hoursToSeconds = hours * 60 * 60
        let minutesToSeconds = minutes * 60
        
        return minutesToSeconds + hoursToSeconds + daystoSeconds
    }
    
    func clearTime(){
        days = 0
        hours = 0
        minutes = 0
    }
    
    var body: some View {
        
        NavigationStack {
            Form{
                Section{
                    
                    Picker("No. of days", selection: $days){
                        ForEach(0...365, id: \.self){
                            Text("\($0)")
                        }
                    }
                    
                    Picker("No. of hours", selection: $hours){
                        ForEach(0...24, id: \.self){
                            Text("\($0)")
                        }
                    }
                    
                    Picker("No. of minutes", selection: $minutes){
                        ForEach(0...60, id: \.self){
                            Text("\($0)")
                        }
                    }
                    
                }
                
                Section( header: Text("Converted to seconds") ){
                    Text("\(inSeconds) seconds")
                }
                
                
            }.navigationTitle("Time Convertor").toolbar{
                Button("Clear"){
                    clearTime()
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
