//
//  ViewController.swift
//  Assignment
//
//  Created by Suryakant Sharma on 31/08/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var catagories = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let priceCatList = loadFile()
        var articles = [Article]()
        var variations = [Variation]()
        var currentArticle : Article?
        if priceCatList.count > 0{
            for i in 1..<priceCatList.count {
                let priceList = priceCatList[i]
                let variation = Variation(itemList: priceList)
                variations.append(variation)

                if 0 == articles.count || Int(priceList[PriceCatColumn.article_structure_code.rawValue]) != currentArticle?.structureCode{
                    currentArticle = Article(list: priceList)
                    if let article = articles.last {
                        article.variation = variations
                        variations = [Variation]()
                    }
                    if let article = currentArticle {
                        articles.append(article);
                    }
                }
            }
            if let article = currentArticle {
                article.variation = variations
            }

           let catagory = Category(itemList: priceCatList[1])
           catagory.articles = articles
           print(catagory.json())
            
        }
        else {
            //no data available or
            // some error occured during parsing the csv file.
        }
        
    }
    
    func loadFile() -> [[String]]{
        let fileParser = CSVFileParser()
        if let priCatStr = fileParser.readData(fileName: FileNameConstant.priceCategory, fileType: FileNameConstant.extention) {
            return fileParser.process(str: priCatStr);
        }
        return [];
    }

}

