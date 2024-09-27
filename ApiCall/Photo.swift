//
//  Photo.swift
//  ApiCall
//
//  Created by Debanhi Medina on 27/09/24.
//

import Foundation

struct Photo : Identifiable, Codable, Hashable {
    var id = UUID()
    var title : String
    var explanation : String
    var url : String?
    
    enum CodingKeys : String, CodingKey {
        case title
        case explanation
        case url
    }
}
