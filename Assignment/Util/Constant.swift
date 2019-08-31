//
//  Constant.swift
//  Assignment
//
//  Created by Suryakant Sharma on 31/08/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation

public struct FileNameConstant {
    static let priceCategory = "pricat"
    static let mappings = "mappings"
    static let extention = "csv"
}

public struct DelimiterConstant {
    static let newLine = "\n"
    static let semicolon = ";"
    static let terminator = "\r"
}

public enum PriceCatColumn : Int {
    public typealias RawValue = Int
    case ean = 0
    case supplier
    case brand
    case catalog_code
    case collection
    case season
    case article_structure_code
    case article_number
    case article_number_2
    case article_number_3
    case color_code
    case size_group_code
    case size_code
    case size_name
    case currency
    case price_buy_gross
    case price_buy_net
    case discount_rate
    case price_sell
    case material
    case target_area
}
