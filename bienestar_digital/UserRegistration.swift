import UIKit
import Alamofire

///PUBLIC VARIABLES///
var apps: [App] = []

class UserRegistration: UIViewController {
    
    ///TEXT FIELDS///
    @IBOutlet weak var text_field_name: UITextField!
    @IBOutlet weak var text_field_email: UITextField!
    @IBOutlet weak var text_field_password: UITextField!
    
    ///FILE DATA PATH///
    var path: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///APPS LIST - FILE//
        let apps_list_csv_file = "apps_list.csv"
        let folder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        path = folder.first?.appendingPathComponent(apps_list_csv_file)
        print(path!)
  
    }
    
    ///USER LOGIN - BUTTON///
    @IBAction func user_login(_ sender: Any) {
        
        ///CREATE USER - POST PETITION///
        create_user(name: text_field_name.text!, email: text_field_email.text!, password: text_field_password.text!)
        
        ///STORE APPS LIST - POST PETITION///
        store_apps_list(text: load_apps_list_csv())
        
    }
    
    ///LOAD APPS LIST TEXT - FUNCTION///
    func load_apps_list_csv() -> String {
 
        do {
            
            let apps_list_csv_file = try String(contentsOf: path!, encoding: .utf8)
            
            return apps_list_csv_file
            
            
        } catch {
            
            print("Error reading the file")
            
        }
        
        return "DEFAULT"
  
    }
    
    ///CREATE USER - POST PETITION - FUNCTION///
    func create_user(name: String, email: String, password: String) {
        
        let create_user_url = URL(string: local_host + "/api/create_user")!
        
        let json = [ "name": name, "email": email, "password": password]
        
        Alamofire.request(create_user_url, method: .post, parameters: json, encoding: JSONEncoding.default, headers: nil).responseJSON {
            
            response in
            
            switch(response.response?.statusCode){
                
            case 200:
                
                if let json = response.result.value as? [String: Any] {
                    
                    let token = json["token"] as! String
                    
                    UserDefaults.standard.set(token, forKey: "token")
                    
                }
                
            case 401:
                
                self.text_field_email.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
                self.text_field_email.text = "Contraseña no disponible"
                
                if let json = response.result.value as? [String: Any] {
                    
                    let error_message = json["message"] as! String
                    
                    print(error_message)
                    
                }
                
            default:
                
                print("DEFAULT")
                
            }
            
        }
     
    }
    
    ///STORE APPS LIST - POST PETITION - FUNCTION///
    func store_apps_list(text: String){
        
        let store_apps_list_url = URL(string: local_host + "/api/store_apps_list")!
        
        let json = ["csv": text]
        
        Alamofire.request(store_apps_list_url, method: .post, parameters: json, encoding: JSONEncoding.default, headers: nil).responseJSON {
            
            response in
            
            switch(response.response?.statusCode){
                
            case 200:
                
                if let json = response.result.value as? [[String: Any]] {
                    
                    print(json)
                    
                    for app in json {
                        
                        apps.append(App(json: app))
                        
                    }
                    
                    ///for app in apps {
                        
                        //print(app.id)
                        //print(app.name)
                        //print(app.logo)
                        
                    //}
                    
                    self.performSegue(withIdentifier: "register_to_menu", sender: nil)
                    
                }
                
            default:
                
                print("DEFAULT")
                
            }
            
        }

    }

}
