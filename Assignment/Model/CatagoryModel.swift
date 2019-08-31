//
//  CatagoryModel.swift
//  Assignment
//
//  Created by Suryakant Sharma on 31/08/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation


class Category {
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
}

class Article {
    let number : String?
    let structureCode: Int?
    var variation: [Variation]?
    init(list : [String]) {
        self.number = list[PriceCatColumn.article_number.rawValue]
        self.structureCode = Int(list[PriceCatColumn.article_structure_code.rawValue]) ?? 0
    }
}

class Variation {
    let color : String?
    let size: String?
    let ean : String?
    init(itemList : [String]) {
        self.color = itemList[PriceCatColumn.color_code.rawValue]
        self.size = itemList[PriceCatColumn.size_code.rawValue]
        self.ean = itemList[PriceCatColumn.ean.rawValue]
    }
}
