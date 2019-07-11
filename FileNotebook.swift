//
//  FileNotebook.swift
//  
//
//  Created by Alena Prideina on 30/06/2019.
//
import UIKit

class FileNotebook {
    
    private(set) var noteCollection: [String: Note] = [String: Note]()
    
    public func add(_ note: Note) {
        if noteCollection[note.uid] == nil {
            noteCollection[note.uid] = note
        }
    }
    
    public func remove(with uid: String) {
        noteCollection[uid] = nil
    }
    
    private func getJSONObject () -> [[String: Any]] {
        var jsonArray = [[String: Any]] ()
        
        for note in self.noteCollection {
            jsonArray.append (note.value.json)
        }
        
        return jsonArray
    }
    
    public func saveToFile() {
        let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        if path == nil { return }
        
        let dirurl = path!.appendingPathComponent("FileNotebook")
        
        var isDir: ObjCBool = false
        if !FileManager.default.fileExists(atPath: dirurl.absoluteString, isDirectory: &isDir), !isDir.boolValue {
            do {
                try FileManager.default.createDirectory(at: dirurl, withIntermediateDirectories: true, attributes: nil)
                let t = FileManager.default.fileExists(atPath: dirurl.absoluteString)
                print("file = \(t) ")
            }
            catch { }
        }
        
        let filename = dirurl.appendingPathComponent ("MyNotebook.sav")
        do {
            let data = try JSONSerialization.data(withJSONObject: getJSONObject (), options: [])
            try data.write(to: filename)
        }
        catch { }
    }
    
    public func loadFromFile() {
        let path = FileManager.default.urls (for: .cachesDirectory, in: .userDomainMask).first
        if path == nil { return }
        let dirurl = path!.appendingPathComponent ("MyNotebooks")
        var isDir: ObjCBool = false
        if !FileManager.default.fileExists (atPath: dirurl.absoluteString, isDirectory: &isDir), !isDir.boolValue
        {
            print ("This directory doesn't exist")
            return
        }
        // TODO Реализовать загрузку из файла
    }
}
