//
//  CatagoryModel.swift
//  Assignment
//
//  Created by Suryakant Sharma on 31/08/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation


class Category : Codable{
    let brand: String
    let collection: String?
    let suplierName: String?
    let targetArea: String?
    let sizeGroupCode: String?
    let currency: String?
    var articles: [Article]?
    
    init(itemList:[String]) {
        self.brand = itemList[PriceCatColumn.brand.rawValue]
        self.collection = itemList[PriceCatColumn.collection.rawValue]
        self.suplierName = itemList[PriceCatColumn.supplier.rawValue]
        self.targetArea = itemList[PriceCatColumn.target_area.rawValue]
        self.sizeGroupCode = itemList[PriceCatColumn.size_group_code.rawValue]
        self.currency = itemList[PriceCatColumn.currency.rawValue]
        self.articles = nil;
    }
    
    func json()-> String?{
        let jsonEncoder = JSONEncoder()
        do {
        let jsonData = try jsonEncoder.encode(self)
        let json = String(bytes: jsonData, encoding: .utf8)
            return json
        }
        catch {
            // some error
            return nil
        }
    }
}

class Article : Codable {
    let number : String?
    let structureCode: Int?
    var variation: [Variation]?
    init(list : [String]) {
        self.number = list[PriceCatColumn.article_number.rawValue]
        self.structureCode = Int(list[PriceCatColumn.article_structure_code.rawValue]) ?? 0
    }
}

class Variation : Codable {
    let color : String?
    let size: String?
    let ean : String?
    let price : String?
    init(itemList : [String]) {
        self.color = itemList[PriceCatColumn.color_code.rawValue]
        self.size = itemList[PriceCatColumn.size_code.rawValue]
        self.ean = itemList[PriceCatColumn.ean.rawValue]
        self.price = itemList[PriceCatColumn.price_sell.rawValue]
    }
}
