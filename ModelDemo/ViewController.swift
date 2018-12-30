

import UIKit
import Alamofire
import SVProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    var users:[User] = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users"
        listTableView.tableFooterView = UIView()
        loadData()
    }
    
    func loadData(){
        SVProgressHUD.show()
        WebServices.sharedInstance.loadData { (error, response) in
            SVProgressHUD.dismiss()
            if let error = error{
                print(error)
            }else if let usersArray = response{
               self.users = usersArray
                self.listTableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        let singleUser = self.users[indexPath.row]
        cell.configureCell(user: singleUser)
        return cell
    }
}


extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}













