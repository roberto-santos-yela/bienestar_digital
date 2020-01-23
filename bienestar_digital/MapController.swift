import MapKit
import CoreLocation
import UIKit
import Alamofire

let location_manager = CLLocationManager()

class MapController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map_view: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location_manager.requestAlwaysAuthorization()
        location_manager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            
            location_manager.delegate = self
            location_manager.requestWhenInUseAuthorization()
            location_manager.desiredAccuracy = kCLLocationAccuracyBest
            location_manager.distanceFilter = kCLDistanceFilterNone
            location_manager.startUpdatingLocation()
            
        }

        map_view.showsUserLocation = true
        map_view.showsCompass = true
        map_view.showsScale = true
        
        let localization = CLLocationCoordinate2DMake(40.416775, -3.703790)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: localization, span:
            span)
        map_view.setRegion(region, animated: true)
       
        //EJEMPLOS
        let facebook_localization = CLLocationCoordinate2DMake(40.437545, -3.692569)
        
        //EJEMPLOS
        let instagram_localization = CLLocationCoordinate2DMake(40.437514, -3.71542)
        
        //EJEMPLO DE ANOTACIÓN
        let map_anotation = MKPointAnnotation()
        map_anotation.coordinate = facebook_localization
        map_anotation.title = "Facebook"
        map_anotation.subtitle = "Último lugar de uso"
        map_view.addAnnotation(map_anotation)
        
        //EJEMPLO DE ANOTACIÓN
        let map_anotation_1 = MKPointAnnotation()
        map_anotation_1.coordinate = instagram_localization
        map_anotation_1.title = "Instagram"
        map_anotation_1.subtitle = "Último lugar de uso"
        map_view.addAnnotation(map_anotation_1)

    }

}


