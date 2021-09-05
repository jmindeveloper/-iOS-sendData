//
//  ViewController.swift
//  Closure
//
//  Created by J_Min on 2021/09/05.
//

import UIKit

class ViewController: UIViewController {
    
    var dataArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }

    @IBAction func addBtn(_ sender: Any) {
        guard let addVC = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController else { return }
        
        addVC.sendDataClosure = { data in
            self.dataArray.append(data)
            self.tableView.reloadData()
        }
        
        self.present(addVC, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? cell else { return UITableViewCell() }
        cell.label.text = dataArray[indexPath.row]
        return cell
    }
}

class cell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
}
