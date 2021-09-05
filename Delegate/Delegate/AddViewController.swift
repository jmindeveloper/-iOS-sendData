//
//  AddViewController.swift
//  Delegate
//
//  Created by J_Min on 2021/09/05.
//

import UIKit

protocol sendDataDelegate{
    func sendData(data: String) -> Void
}

class AddViewController: UIViewController {
    
    var sendDataDelegate: sendDataDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        sendDataDelegate?.sendData(data: textField.text ?? "")
        self.dismiss(animated: true, completion: nil)

    }
}
