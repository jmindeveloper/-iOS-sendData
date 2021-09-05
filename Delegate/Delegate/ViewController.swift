//
//  ViewController.swift
//  Delegate
//
//  Created by J_Min on 2021/09/05.
//

import UIKit

class ViewController: UIViewController, sendDataDelegate {
    
    var dataArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
    
    func sendData(data: String) {
        dataArray.append(data)
        tableView.reloadData()
    }

    @IBAction func addBtn(_ sender: Any) {
        guard let addVC = self.storyboard?.instantiateViewController(withIdentifier: "addVC") as? AddViewController else { return }
        addVC.sendDataDelegate = self
        self.present(addVC, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Cell else { return UITableViewCell() }
        cell.label.text = dataArray[indexPath.row]
        return cell
    }
}

class Cell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
}
