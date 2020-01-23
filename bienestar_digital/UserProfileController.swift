import UIKit
import Alamofire

class UserProfileController: UIViewController {
    
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var label_email: UILabel!
    @IBOutlet weak var label_password: UILabel!
    
    override func viewDidLoad() {
                
        super.viewDidLoad()
                
        let url = URL(string: "http://localhost:8888/bienestar-digital-api-classroom/public/index.php/api/get_user_data")!
        
        let user_token: String = UserDefaults.standard.value(forKey: "token") as! String
        
        let headers = ["Authorization" : user_token]
        
        print(headers)
        
        Alamofire.request(url, headers: headers).responseJSON {
            
            response in
            
            if let json = response.result.value as? [String: Any] {
                
                print(json)                
                
                self.label_name.text = json["name"]! as? String
                self.label_email.text = json["password"]! as? String
                self.label_password.text = json["email"]! as? String
                
                
            }
        }
    
    }
    
    
    
    
    
    
    
    
    
}
