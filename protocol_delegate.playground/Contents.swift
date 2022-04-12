import UIKit

//delegate nesneler arası veri transferi yapılmasını sağlar, iletişim kurulmasını sağlar

protocol DoctorDelegate{
    func tamirciCagir(ill : String)
}

class Patient {
    var delegate : DoctorDelegate?
}

class Doctor : DoctorDelegate{
    func tamirciCagir(ill: String) {
        print("\(ill)  named ill solved with doctor")
    }
}

var m1 : Patient = Patient()
var t1 : Doctor = Doctor()

m1.delegate = t1
m1.delegate?.tamirciCagir(ill: "broken arm")

// example2
protocol VeriGöndermeDelegate{
    func veriGonder(veri : String)
}
class VC1 {
    var delegate : VeriGöndermeDelegate?
}
class VC2 : VeriGöndermeDelegate {
    func veriGonder(veri: String) {
        print("Ben vc2 nin bana gelen veri : \(veri)")
    }
}

var vc1  : VC1 = VC1()
var vc2 : VC2 = VC2()

vc1.delegate = vc2
vc1.delegate?.veriGonder(veri: "Butona tıklandı ve veri geldi")



class VC3 : VeriGöndermeDelegate {
    func veriGonder(veri: String) {
        print("Ben vc3 , gelen verinin harflerini büyütürüm: \(veri.uppercased())")
    }
}

var  vc3 : VC3 = VC3()
vc1.delegate = vc3  // vc1 ile vc2 anlasması iptal oldu ve vc1-vc3 anlaşması yapıldı.artık yayınları vc3 dinleyecek
vc1.delegate?.veriGonder(veri: "Kullanıcı adı : Beyza")

