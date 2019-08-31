//
//  CSVFileParser.swift
//  Assignment
//
//  Created by Suryakant Sharma on 31/08/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation

class CSVFileParser {
    
    func readData(fileName:String, fileType: String)-> String? {
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType) else { return nil }
        do {
            var contents = try String(contentsOfFile: filepath, encoding: .utf8)
            contents = cleanRows(file: contents)
            return contents
        } catch {
            print("File Read Error for file \(filepath)")
            return nil
        }
    }
    
    
    func cleanRows(file:String)->String{
        var cleanFile = file
        cleanFile = cleanFile.replacingOccurrences(of: DelimiterConstant.terminator, with: DelimiterConstant.newLine)
        cleanFile = cleanFile.replacingOccurrences(of: DelimiterConstant.newLine + DelimiterConstant.newLine, with: DelimiterConstant.newLine)
        return cleanFile
    }
    
    func process(str: String, using rowDelimeter: String = DelimiterConstant.newLine,and stringDelimeter: String = DelimiterConstant.semicolon) -> [[String]] {
        var result: [[String]] = []
        let rows = str.components(separatedBy: rowDelimeter)
        for row in rows {
            let columns = row.components(separatedBy: stringDelimeter)
            result.append(columns)
        }
        return result
    }
}
