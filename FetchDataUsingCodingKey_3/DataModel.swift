//
//  DataModel.swift
//  FetchDataUsingCodingKey_3
//
//  Created by Admin on 28/02/23.
//

import Foundation

struct DataModel:Decodable{
    let id:Int
    let date:String
    let products:[Product]
    let v:Int
    
    enum RootKeys:String,CodingKey{
        case id
        case date
        case products
        case v = "__v"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        products = try container.decode([Product].self, forKey: .products)
        date = try container.decode(String.self, forKey: .date)
        v = try container.decode(Int.self, forKey: .v)
    }
}


struct Product:Decodable{
    let productId:Int
    let quantity:Int
    
    enum CodingKeys: CodingKey {
        case productId
        case quantity
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productId = try container.decode(Int.self, forKey: .productId)
        self.quantity = try container.decode(Int.self, forKey: .quantity)
    }
}
