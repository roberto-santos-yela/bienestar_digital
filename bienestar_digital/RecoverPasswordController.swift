import UIKit
import Alamofire

class RecoverPasswordController: UIViewController {
    
    @IBOutlet weak var text_field_email: UITextField!
    @IBOutlet weak var text_field_confirm_email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        text_field_email.text = "roberto_santos_apps1ma1819@cev.com"
        text_field_confirm_email.text = "roberto_santos_apps1ma1819@cev.com"
    
    }
    
    @IBAction func recover_password_button(_ sender: Any) {
    
        recover_user_password(email: text_field_email.text!, confirm_email: text_field_confirm_email.text!)
        
    }
    
    func recover_user_password(email: String, confirm_email: String){
        
        let url = URL(string: local_host + "/api/recover_user_password")!
        
        let json = ["email": email , "confirm_email": confirm_email]
        
        Alamofire.request(url, method: .post, parameters: json, encoding: JSONEncoding.default).responseJSON {
            
            response in
            
            switch(response.response?.statusCode){
                
            case 200:
                
               print("OK")
               self.performSegue(withIdentifier: "recover_to_login", sender: nil)

            case 401:
                
                if let json = response.result.value as? [String: Any] {
                    
                    let error_message = json["message"] as! String
                    
                    print(error_message)
                    
                }
                
            default:
                
                print("DEFAULT")
                
            }
        }
    }
}
