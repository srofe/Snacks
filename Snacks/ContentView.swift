//
//  ContentView.swift
//  Snacks
//
//  Created by Simon Rofe on 19/10/2022.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var imageSourceType: UIImagePickerController.SourceType = .photoLibrary

    var body: some View {
        ZStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("(Results go here)")
                    .padding(10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(8)
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        imageSourceType = .photoLibrary
                        showSheet = true
                    }) {
                        Image("picture")
                    }
                    Spacer()
                    Button(action: {
                        imageSourceType = .camera
                        showSheet = true
                    }) {
                        Image("camera")
                    }
                    Spacer()
                }
                .padding(.bottom, 20)
            }
            .sheet(isPresented: $showSheet) {
                ImagePicker(sourceType: imageSourceType, selectedImage: self.$image)
            }
        }
        .background(Color.black.opacity(0.3))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
