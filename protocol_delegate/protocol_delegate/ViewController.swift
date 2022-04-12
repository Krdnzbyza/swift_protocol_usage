
import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    
    
    @IBOutlet weak var txtKullanıcıadi: UITextField!
    
    
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtKullanıcıadi.delegate = self // textfield ile label arasındaki haberleşmeyi sağlar

    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        lblResult.text = "Kullanıcı adınız : \(textField.text!)"
     //   lblResult.text = string
        
        if textField.tag == 1 {
            //kullanıcı adı
            lblResult.text = "Kullanıcı Adınız: \(textField.text!)"
        }
        else if textField.tag == 2 {
            //parola
            lblResult.text = "Parolanız : \(textField.text!)"
        }
        return true
    }

}

