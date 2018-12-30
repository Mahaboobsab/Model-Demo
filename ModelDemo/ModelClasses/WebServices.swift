

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}

import UIKit
import Alamofire


class WebServices: NSObject {
    
    static var sharedInstance = WebServices()
    
    private override init() {
        
    }
    
     func loadData(onFinished: @escaping ( _ error:String?,  _ user: [User]?) -> ())  {
        
        var users = [User]()
        var user = User()
        Alamofire.request("https://jsonplaceholder.typicode.com/posts", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
             if response.result.isSuccess{
                if let result = response.result.value {
                    let JSON = result as! NSArray
                    for i in JSON{
                        user = User()
                        if let obj = i as? NSDictionary{
                            if let body = obj["body"] as? String{
                                user.desc = body
                            }
                            if let userId =  obj["userId"] as? Int{
                                user.userID = userId
                            }
                            if let title = obj["title"] as? String{
                                user.title = title
                            }
                            let uniquColor:UIColor = .random
                            user.image = uniquColor
                        }
                        users.append(user)
                    }
                    onFinished(nil, users)
                }
             }else{
                onFinished("Something went wrong", nil)
            }
        }
    }
}
