//
//  ViewController.swift
//  avy-log
//
//  Created by Adam Rosenberg on 12/14/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath);
        cell.textLabel?.text = "Log";
        return cell;
    }
    

    @IBOutlet weak var logsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logsListTableView.delegate = self;
        logsListTableView.dataSource = self;
        
        
    }


}

