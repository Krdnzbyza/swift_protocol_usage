import UIKit

class Kisi : Equatable {
    
    static func == (leftKisi : Kisi, rightKisi : Kisi) -> Bool {
        if leftKisi.name == rightKisi.name && leftKisi.year == rightKisi.year && leftKisi.tcNo == rightKisi.tcNo{
             return true
        }
        return false
    }
    
    var name : String
    var year : Int
    var tcNo : String
    
    init (name : String, year : Int , tcNo : String ){
        self.year = year
        self.tcNo = tcNo
        self.name = name
    }
}

var k1: Kisi = Kisi(name: "Beyza", year: 23, tcNo: "12345643233")
var k2: Kisi = Kisi(name: "Ömer Berke", year: 16, tcNo: "23456787644")

if k1 == k2 {
    print("items equat")
}
else{
    print("items different ")
}


class Rectangle  : Comparable{
    static func < (d1: Rectangle, d2: Rectangle) -> Bool {
        return ( d1.width * d1.height ) < (d2.width * d2.height)
    }
    
    static func == (d1: Rectangle, d2: Rectangle) -> Bool {
        return (d1.width * d1.height) == (d2.height * d2.width)
    }
    
    
    var width : Int
    var height : Int
    init( width : Int , height : Int){
        self.height = height
        self.width = width
    }
}
var d1 : Rectangle  = Rectangle(width: 45, height: 50)
var d2 : Rectangle = Rectangle(width: 6, height: 2)

if d1 > d2 {
    print("d1 bigger than d2")
}
else if d1 < d2 {
    print("d2 bigger than d1")
}
else if d1 == d2 {
    print("d1 equateble d2")
}
