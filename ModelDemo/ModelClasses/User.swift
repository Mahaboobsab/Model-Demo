

import UIKit

class User: NSObject {
    
    var userID:Int?
    var title:String?
    var desc:String?
    var image:UIColor?
    
    override init() {
        super.init()
        self.userID = Int()
        self.title = String()
        self.desc = String()
        self.image = UIColor()
    }
}
