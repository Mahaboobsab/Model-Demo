

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.cornerRadius = userImage.layer.frame.height / 2
    }
    
    func configureCell(user:User?){
        if let yourUser = user{
            if let color = yourUser.image{
               userImage.backgroundColor = color
            }
            if let id = yourUser.userID{
               userId.text = "User ID is \(id)"
            }
            if let yourTitle = yourUser.title{
                title.text = "Title: = \(yourTitle)"
            }
            if let yourDesc = yourUser.desc {
                desc.text = "Desc: = \(yourDesc)"
            }
        }
    }
}
