//
//  ContentView.swift
//  Snacks
//
//  Created by Simon Rofe on 19/10/2022.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

    var body: some View {
        ZStack {
            if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .background(Color.black.opacity(0.3))
            } else {
                Image("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .background(Color.black.opacity(0.3))
            }
            VStack {
                Text("(Results go here)")
                    .padding(10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(8)
                Spacer()
                HStack {
                    Spacer()
                    PhotosPicker(
                        selection: $selectedItem,
                        matching: .images,
                        photoLibrary: .shared()
                    ) {
                        Image("picture")
                    }
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
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
