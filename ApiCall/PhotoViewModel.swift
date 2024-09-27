//
//  PhotoViewModel.swift
//  ApiCall
//
//  Created by Debanhi Medina on 27/09/24.
//

import Foundation

@Observable
class PhotoViewModel: ObservableObject {
    var arrPhotos = [Photo]()
    
    //async thorws wtf
    func getPhotosNasa() async throws{
        
        //creamos el objeto URL
        //guard que significa
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=10") else{
            print("invalid url")
            return
        }
        
        //request a la página con la url
        let urlRequest = URLRequest(url: url)
        
        //llamada con URL sesion
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard(response as? HTTPURLResponse)?.statusCode == 200 else{
            print("error")
            return
        }
        
        //decodifica la info en formato json
        let results = try JSONDecoder().decode([Photo].self, from: data)
        
        print(results)
        
        //utilizamos el thread principal para actualizar la variable Photos
        DispatchQueue.main.async {
            self.arrPhotos = results
        }
    }
}
