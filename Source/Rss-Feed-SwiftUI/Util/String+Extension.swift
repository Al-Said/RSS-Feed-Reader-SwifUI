//
//  String+Extension.swift
//  Rss-Feed-SwiftUI
//
//  Created by Said on 20.08.2022.
//

import Foundation

extension String {
    
    func getImageUrlStr() -> String {
        let regex: NSRegularExpression = try! NSRegularExpression(pattern: "<img.*?src=\"([^\"]*)\"", options: .caseInsensitive)
        let range = NSMakeRange(0, self.count)
        if let textCheck = regex.firstMatch(in: self, options: .withoutAnchoringBounds, range: range) {
            return (self as NSString).substring(with: textCheck.range(at: 1))
        } else {
            return ""
        }
    }
    
    func removeHTMLTag() -> String {
        return self.replacingOccurrences(of: "<[^>]*>", with: "", options: .regularExpression, range: self.range(of: self))
    }
    
    func trimingLeadingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        guard let index = firstIndex(where: { !CharacterSet(charactersIn: String($0)).isSubset(of: characterSet) }) else {
            return self
        }
        
        return String(self[index...])
    }
    
}
