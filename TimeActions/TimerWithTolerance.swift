//
//  TimerWithTolerance.swift
//  TimeActions
//
//  Created by Shah Md Imran Hossain on 5/11/23.
//

import SwiftUI

struct TimerWithTolerance: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onReceive(timer) { newTime in
            if counter == 5 {
                timer.upstream.connect().cancel()
            } else {
                print("The time is now \(newTime)")
            }
            
            counter += 1
        }
    }
}

#Preview {
    TimerWithTolerance()
}
