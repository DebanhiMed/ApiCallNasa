//
//  ContentView.swift
//  ApiCall
//
//  Created by Debanhi Medina on 27/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var fotoVM = PhotoViewModel()
    
    var body: some View {
        VStack {
            //asyncimage cagra las imagenes desde una url
            List(fotoVM.arrPhotos){
                item in Text(item.title)
                AsyncImage(url: URL(string: item.url!))
                    .scaledToFit()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
            
            .task {
                
                do {
                    try await fotoVM.getPhotosNasa()
                } catch{
                        print("error al llamar a las fotos")
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
