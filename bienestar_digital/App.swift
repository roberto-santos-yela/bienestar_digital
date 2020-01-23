import Foundation

class App{
    
    var id: Int
    var logo: String
    var name: String
    
    init(json: [String: Any]) {
        
        id = json["id"] as? Int ?? 0
        logo = json["logo"] as? String ?? ""
        name = json["name"] as? String ?? ""
        
    }
    
}



