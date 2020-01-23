import UIKit
import Alamofire

var app_name: String = ""
var app_id: Int = 0

class AppListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for app in apps {
            
            print(app.id)
            print(app.name)
            print(app.logo)
            
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return array_apps.count
        
        return apps.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppCell", for: indexPath) as! AppTableViewCell
        
        //cell.text_name_test.text = array_apps[indexPath.row]
        cell.app_name.text = apps[indexPath.row].name
        cell.app_logo.text = apps[indexPath.row].logo
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        app_id = apps[indexPath.row].id
        app_name = apps[indexPath.row].name

    }
    
}
