//
//  HomeView.swift
//  WakeUpAlarm
//
//  Created by Gustavo Torres on 5/5/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Wake-up Alarm")
                .font(.system(size: 48).bold())
                .padding(.bottom)
            Text("Tomorrow I will")
                .font(.system(size: 32))
            HStack {
                Text("wake up at")
                    .font(.system(size: 32))
                Button(action: {}) {
                    Text("8:00am")
                        .foregroundColor(.black)
                        .font(.system(size: 32).bold())
                        .underline()
                }
            }
            Text("Alarms will ring every 5 min starting at 7:30am")
            Button(action: {}) {
                Text("Switch off today's alarms")
                    .foregroundColor(.white)
                    .font(.system(size: 28))
                    .font(.headline)
                    .padding(20)
            }
            .clipShape(Capsule())
            .background(.green)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
