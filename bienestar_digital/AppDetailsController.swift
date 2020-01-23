import UIKit
import Alamofire

class AppDetailsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var label_app_name: UILabel!    
    @IBOutlet weak var label_total_usage_time: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        label_app_name.text = app_name
        total_time_petition(app_id: app_id)
        
    }

    var array_prueba = ["pepino", "pepina", "pupuno"]
    var array_prueba_fecha = ["000", "000", "0000"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array_prueba.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppDailyUsageCell", for: indexPath) as! AppDailyUsageViewCell
        
        cell.usage_day.text = array_prueba[indexPath.row]
        //cell.usage_day_time.text = array_prueba_fecha[indexPath.row]
        
        return cell
    }
    
    func total_time_petition(app_id: Int){
        
        let app_id_string: String = String(app_id)
        let url = URL(string: local_host + "/api/get_time_diff/" + app_id_string)!
        
        print(url)
        
        let user_token: String = UserDefaults.standard.value(forKey: "token") as! String
        let headers = ["Authorization" : user_token]
        
        print(user_token)
        
        Alamofire.request(url, headers: headers).responseJSON {
            
            response in
            
            print(response)
            
            switch(response.response?.statusCode){
                
            case 200:
                
                if let json = response.result.value as? [String: Any] {
                    
                    print(json)
                    self.label_total_usage_time.text = json["total_usage_time"] as? String
                    
                }
                
            default:
                
                print("DEFAULT")
                
            }
        }
    }
}
