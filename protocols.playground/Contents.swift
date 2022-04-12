import UIKit

protocol Photo{
    
    var fileName : String{get set}
    var fileSize : Double { get set}
    var photoType : String { get set}
    var width : Double { get set}
    var height : Double {get set}
    
    func save()
    func newSize( newWidth : Double , newHeight : Double)
}

class Jpeg : Photo{
    var fileName: String
    
    var fileSize: Double
    
    var photoType: String
    
    var width: Double
    
    var height: Double
    
    func save() {
        print("\(fileName) jpeg file saved")
    }
    func newSize(newWidth: Double, newHeight: Double) {
        self.width = newWidth
        self.height = newHeight
        print("\(fileName) File resized")
    }
    init(fileName : String , fileSize : Double , photoType :String , width : Double , height : Double ){
        self.fileName = fileName
        self.fileSize = fileSize
        self.photoType = photoType
        self.width = width
        self.height = height
    }
}


var j1 : Jpeg = Jpeg(fileName: "flower", fileSize: 2.4, photoType: "image", width: 500, height: 350)
j1.save()
j1.newSize(newWidth: 400, newHeight: 300)

protocol Video{
    var frameRate : Int {get}
    var resolution : Double { get}
}

class Media : Photo, Video {
    var fileName: String
    
    var fileSize: Double
    
    var photoType: String
    
    var width: Double
    
    var height: Double
    
    func save() {
        print("\(fileName) media jpeg file saved")
    }
    
    func newSize(newWidth: Double, newHeight: Double) {
        print("\(fileName) media file saved succes")
        width = newWidth
        height = newHeight
    }
    
    var frameRate: Int
    
    var resolution: Double
    
    init(fileName : String , fileSize : Double , photoType :String , width : Double , height : Double , frameRate : Int , resolution : Double)
    {
        self.fileName = fileName
        self.fileSize = fileSize
        self.photoType = photoType
        self.width = width
        self.height = height
        self.frameRate = frameRate
        self.resolution = resolution

    }
}

@objc protocol Time {  // use unrequirement value with objc
    var day : Int {get set}
    var month : Int {get set}
    var year : Int {get set }
    
    @objc optional var hours : Int {get}
    @objc optional var minute : Int {get}
    @objc optional var second : Int {get}
    func toString()-> String
}

class ShortTime : Time {
    var day: Int
    var month: Int
    var year: Int
        func toString() -> String {
        return "\(day)/\(month)/\(year)"
    }
 init( day : Int , month : Int , year : Int){
        self.month = month
        self.year = year
        self.day = day
    }
}
class LongTime : ShortTime {

    
    var hours : Int = 0
    var minute : Int = 0
    var second : Int = 0
    
    convenience init ( hours : Int , minute : Int , second : Int,  day : Int , month : Int , year : Int){
        self.init( day: day, month: month, year: year)
        self.hours = hours
        self.minute = minute
        self.second = second
    }
    
    override func toString() -> String {
        return super.toString() + "   \(hours):\(minute):\(second)"
    }
    
}

var time1 : ShortTime = ShortTime(day: 18, month: 08, year: 1999)
var time2 : LongTime = LongTime(hours: 2, minute: 45, second: 12, day: 21, month: 12, year: 1995)

//tarihler içerisinde tarih1 ve tarih 2 eklenecek
//object bir class türemis deger

var times : [AnyObject] = [time1,time2]
for t1 in times {
    let time = t1 as! Time
    print(time.toString())
    
    if let hours = time.hours{
        print("Hour\(hours) Hours\(time.hours!)")
        print("Time is long time")
    }
}


