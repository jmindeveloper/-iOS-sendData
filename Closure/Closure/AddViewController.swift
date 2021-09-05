//
//  AddViewController.swift
//  Closure
//
//  Created by J_Min on 2021/09/05.
//

import UIKit

class AddViewController: UIViewController {
    
    var sendDataClosure: ((String) -> Void)?
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        if let sendDataClosure = sendDataClosure {
            sendDataClosure(textField.text ?? "")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
