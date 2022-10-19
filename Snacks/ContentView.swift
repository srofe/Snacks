//
//  ContentView.swift
//  Snacks
//
//  Created by Simon Rofe on 19/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("castle")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color.green)
            VStack {
                Text("(Results go here)")
                    .padding(10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(8)
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image("picture")
                    }
                    Spacer()
                    Button(action: {}) {
                        Image("camera")
                    }
                    Spacer()
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
