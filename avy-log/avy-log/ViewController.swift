//
//  ViewController.swift
//  avy-log
//
//  Created by Adam Rosenberg on 12/14/21.
//

import UIKit

protocol DataDelegate {
    func updateArray(newArray: String)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var logs = [Log]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddLogViewController
        
        if (segue.identifier == "updateLogSegue") {
            vc.log = logs[logsListTableView.indexPathForSelectedRow!.row]
            vc.update = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath);
        cell.textLabel?.text = logs[indexPath.row].title;
        return cell;
    }
    

    @IBOutlet weak var logsListTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        APIFunctions.functions.fetchLogs()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        APIFunctions.functions.fetchLogs()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIFunctions.functions.delegate = self;
        APIFunctions.functions.fetchLogs()
        logsListTableView.delegate = self;
        logsListTableView.dataSource = self;
    }


}

extension ViewController: DataDelegate {
    func updateArray(newArray: String) {
        do {
            logs = try JSONDecoder().decode([Log].self, from: newArray.data(using: .utf8)!)
            print("logs", logs)
        } catch {
            print("failed to decode")
        }
        self.logsListTableView.reloadData()
    }
}
