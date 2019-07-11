//
//  ArrayShuffle
//  
//
//  Created by Alena Prideina on 24/06/2019.
//

import UIKit

extension Array{
    func myShuffled() -> Array{
        var newArray = Array<Element>()
        var newIndex = [Int]()
        
        for i in 0..<self.count { newIndex.append(i) }
        newIndex.shuffle()
        
        for (index, _) in self.enumerated() {
            newArray.insert(self[newIndex[index]], at: index)
        }
        
        return newArray
    }
}

let arFruit = ["apple", "banana", "melon", "lemon", "watermelon", "tangerine", "cucumber", "garlic", "tomato"]

print(arFruit)
print(arFruit.myShuffled())

func calcLetters(str: String) -> [Character: Int] {
    var dictLetters = Dictionary<Character, Int>()
    
    for char in str {
        let ch: Character = Character(String(char).lowercased())
        let optValue = dictLetters[ch]
        
        if let optValue = optValue {
            dictLetters[ch]! += 1
        } else {
            dictLetters[ch] = 1
        }
    }
    
    return dictLetters
}

print(calcLetters(str: "Alenaa Igorevna P!"))

/*
ЗАДАНИЕ
 
 1. Реализуйте расширение для массива Array: функцию shuffle для массива. Функция перемешивает элементы массива в случайном порядке. Изменять ли текущий массив или возвращать новый — на ваше усмотрение:
 
 2. Реализуйте на словаре подсчет букв в слове:
 
 */
