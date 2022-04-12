import UIKit

protocol SendMessageDataSource{
    func takeOrder(order : String) -> Bool
}
class Client {
    var dataSource : SendMessageDataSource?
}

let c1 : Client = Client()
c1.dataSource?.takeOrder(order: "My first order")

class DataSource :  SendMessageDataSource {
    func takeOrder(order: String) -> Bool {
        print("Take Order: \(order)")
        print("Okay, let me send")
        return true
    }
}

let c2: Client = Client()
let d1 : DataSource = DataSource()

c2.dataSource = d1

let result = c2.dataSource?.takeOrder(order: "Send a pizza ")
print(result!)

class CustomViewController : UIViewController , UITableViewDataSource , UITableViewDelegate{
    /// UITableViewDelegate viewcontrollerın tableview ile haberleşmesini sağlayacaktır
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //tableView nesnesinde kaç tane veri-satır görüntüleyeceksin
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //0,1,2,3. satırlarda ne göstereleceğini gösterir
        /// satır sayısı kaçsa bu method o kadar çalışacaktır
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Sipariş - \(indexPath.row)")
        return cell
    }
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

