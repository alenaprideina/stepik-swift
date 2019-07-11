//
//  NoteExtension.swift
//  
//
//  Created by Alena Prideina on 27/06/2019.
//

import UIKit

extension UIColor {
    func toDictionary() -> [String: CGFloat] {
        var colorRedComponent: CGFloat = 0
        var colorGreenComponent: CGFloat = 0
        var colorBlueComponent: CGFloat = 0
        var colorAlphaChannel: CGFloat = 0
        
        self.getRed(&colorRedComponent, green: &colorGreenComponent, blue: &colorBlueComponent, alpha: &colorAlphaChannel)
        
        return ["red": colorRedComponent, "green": colorGreenComponent, "blue": colorBlueComponent, "alpha": colorAlphaChannel]
    }
}

extension Note {
    static func parse(json: [String: Any]) -> Note? {
        guard
            let title = json["title"] as? String,
            let content = json["content"] as? String,
            let uid = json["uid"] as? String
            else {
                return nil
        }
        
        var severity = Severity.normal
        if let severityValue = json["severity"] as? Int {
            guard let _severity = Severity(rawValue: severityValue) else {
                return nil
            }
            
            severity = _severity
        }
        
        var color = UIColor.white
        
        if let colorDictionary = json["color"] as? [String: CGFloat] {
            
            guard let red = colorDictionary["red"],
                let green = colorDictionary["green"],
                let blue = colorDictionary["blue"],
                let alpha = colorDictionary["alpha"]
                else {
                    return nil
            }
            
            color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        }
        
        var destructionDate: Date? = nil
        if let timestamp = json["selfDestructDate"] as? Double {
            destructionDate = Date(timeIntervalSince1970: timestamp)
        }
        
        return Note(
            uid: uid,
            title: title,
            content: content,
            color: color,
            severity: severity,
            destructionDate: destructionDate)
    }
    
    var json: [String: Any] {
        var dict = [String: Any]()
        
        dict["uid"] = self.uid
        dict["title"] = self.title
        dict["content"] = self.content
        
        if let date = self.destructionDate {
            dict["date"] = date.timeIntervalSince1970
        }
        
        if self.color != .white {
            dict["color"] = self.color.toDictionary()
        }
        
        if self.severity != .normal {
            dict["severity"] = self.severity.rawValue
        }
        
        return dict
    }
    
}
