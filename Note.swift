//
//  Note.swift
//  Приложение Заметки Notes. По заданиям от преподавателей
//
//  Created by Alena Prideina on 21/06/2019.
//

import UIKit

enum Severity : Int {
    case trivial = 0
    case normal = 1
    case important = 2
}

struct Note {
    let uid: String
    let title: String
    let content: String
    
    let color: UIColor
    let severity: Severity
    let destructionDate: Date?
    
    init(uid: String = UUID().uuidString, title: String, content: String, color: UIColor = UIColor.white, severity: Severity, destructionDate: Date?) {
        self.uid = uid
        self.title = title
        self.content = content
        self.color = color
        self.severity = severity
        self.destructionDate = destructionDate
    }
}

var note1 = Note(title: "First", content: "Hello, world!", severity: Severity.normal, destructionDate: nil)

