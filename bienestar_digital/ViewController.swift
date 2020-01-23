import UIKit
import Alamofire

///PUBLIC VARIABLES///
var local_host = "http://localhost:8888/bienestar-digital-api-classroom/public/index.php"

class ViewController: UIViewController {

    @IBOutlet weak var field_text_email: UITextField!
    @IBOutlet weak var field_text_password: UITextField!
    
    ///PRUEBA FICHEROS///
    var path: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///PRUEBAS FICHEROS///
        //let file = "fichero2.txt"
        let apps_list_csv_file = "apps_list.csv"
        let folder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        path = folder.first?.appendingPathComponent(apps_list_csv_file)
        print(path!)
        ///PRUEBAS FICHEROS///
                
        ///PRUEBAS DE LOGIN
        field_text_email.text = "roberto@cev.com"
        field_text_password.text = "1234"
        ///PRUEBAS DE LOGIN
    }
    
    @IBAction func login_button(_ sender: Any) {
        
        user_login(email: field_text_email.text!, password: field_text_password.text!)
        
    }
    
    func user_login(email: String, password: String){
        
        let url = URL(string: local_host + "/api/user_login")!
        
        let json = ["email": email , "password": password]
        
        Alamofire.request(url, method: .post, parameters: json, encoding: JSONEncoding.default, headers: nil).responseJSON {
            
            response in
            
            switch(response.response?.statusCode){
                
            case 200:
                
                if let json = response.result.value as? [String: Any] {
                    
                    let token = json["token"] as! String
                    
                    UserDefaults.standard.set(token, forKey: "token")
                    
                    self.get_apps_data()
                    
                }
                
            case 401:
                
                if let json = response.result.value as? [String: Any] {
                    
                    self.field_text_email.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
                    self.field_text_email.text = "Incorrect email or password"
                    
                    self.field_text_password.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
                    self.field_text_password.text = "Incorrect email or password"
                    
                    let error_message = json["message"] as! String
                    
                    print(error_message)
                    
                }
                
            default:
                
                print("DEFAULT")
                
            }
            
        }
 
    }
    
    func get_apps_data(){
        
        let url = URL(string: local_host + "/api/app")!
        
        let user_token: String = UserDefaults.standard.value(forKey: "token") as! String
        
        let headers = ["Authorization" : user_token]
        
        Alamofire.request(url, encoding: JSONEncoding.default, headers: headers).responseJSON {
            
            response in
            
            if let json = response.result.value as? [[String: Any]] {
                
                for app in json {
                    
                    apps.append(App(json: app))
                    
                }
                
                self.performSegue(withIdentifier: "login_to_menu", sender: nil)
                
            }
          
        }
  
    }

}



