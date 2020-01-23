import UIKit
import Alamofire

class AppRestrictionController: UIViewController {
    
    ///TEXT LABELS///
    @IBOutlet weak var text_field_maximum_time: UITextField!
    @IBOutlet weak var text_field_from: UITextField!
    @IBOutlet weak var text_field_to: UITextField!
    
    ///DATE PICKERS///
    let date_picker_maximum_time = UIDatePicker()
    let date_picker_from = UIDatePicker()
    let date_picker_to = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///MAXIMUM TIME - DATE PICKER///
        date_picker_maximum_time.datePickerMode = .time
        date_picker_maximum_time.locale = NSLocale.init(localeIdentifier: "es_ES") as Locale
        text_field_maximum_time.inputView = date_picker_maximum_time
        date_picker_maximum_time.addTarget(self, action: #selector(AppRestrictionController.maximum_time_date_changed(datePicker:)), for: .valueChanged)
        
        ///FROM TIME - DATE PICKER///
        date_picker_from.datePickerMode = .time
        date_picker_from.locale = NSLocale.init(localeIdentifier: "es_ES") as Locale
        text_field_from.inputView = date_picker_from
        date_picker_from.addTarget(self, action: #selector(AppRestrictionController.from_time_date_changed(datePicker:)), for: .valueChanged)
        
        ///TO TIME - DATE PICKER///
        date_picker_to.datePickerMode = .time
        date_picker_to.locale = NSLocale.init(localeIdentifier: "es_ES") as Locale
        text_field_to.inputView = date_picker_to
        date_picker_to.addTarget(self, action: #selector(AppRestrictionController.to_time_date_changed(datePicker:)), for: .valueChanged)
        
        ///TAP GESTURE///
        let tap_gesture = UITapGestureRecognizer(target: self, action: #selector(AppRestrictionController.view_tapped(gestureRecognizer:)))
        view.addGestureRecognizer(tap_gesture)

    }

    ///TAP GESTURE - FUNCTION///
    @objc func view_tapped(gestureRecognizer: UITapGestureRecognizer){
        
        view.endEditing(true)
        
    }
    
    ///MAXIMUM TIME - DATE PICKER FUNCTION///
    @objc func maximum_time_date_changed(datePicker: UIDatePicker){
        
        let date_formater = DateFormatter()
        date_formater.dateFormat = "HH:mm"
        text_field_maximum_time.text = date_formater.string(from: date_picker_maximum_time.date)
        //view.endEditing(true)
        
    }
    
    ///FROM TIME - DATE PICKER FUNCTION///
    @objc func from_time_date_changed(datePicker: UIDatePicker){
        
        let date_formater = DateFormatter()
        date_formater.dateFormat = "HH:mm"
        text_field_from.text = date_formater.string(from: date_picker_from.date)
        //view.endEditing(true)
        
    }
    
    ///TO TIME - DATE PICKER FUNCTION///
    @objc func to_time_date_changed(datePicker: UIDatePicker){
        
        let date_formater = DateFormatter()
        date_formater.dateFormat = "HH:mm"
        text_field_to.text = date_formater.string(from: date_picker_to.date)
        //view.endEditing(true)
        
    }
  
    //BUTTON - SAVE CHANGES//
    @IBAction func save_changes(_ sender: Any) {
        
        let maximum_time = text_field_maximum_time.text
        let from_time = text_field_from.text
        let to_time = text_field_to.text
        
        print(maximum_time!)
        print(from_time!)
        print(to_time!)
        
    }
    
}

