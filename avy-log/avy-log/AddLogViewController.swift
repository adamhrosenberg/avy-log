//
//  AddLogViewController.swift
//  avy-log
//
//  Created by Adam Rosenberg on 12/14/21.
//

import UIKit

class AddLogViewController: UIViewController {


    var log: Log?
    var update = false
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        if (update == false) {
            self.deleteButton.isEnabled = false
            self.deleteButton.title = ""
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if (update == true) {
            titleTextField.text = log!.title
            bodyTextView.text = log!.log
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func saveClick(_ sender: Any) {
        if (update == true) {
            APIFunctions.functions.updateLog(date: "foo", title: titleTextField.text!, log: bodyTextView.text, id: log!._id)
        } else {
            APIFunctions.functions.addLog(date: "foo", title: titleTextField.text!, log: bodyTextView.text)
        }

        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func deleteClick(_ sender: Any) {
        APIFunctions.functions.deleteLog(id: log!._id)
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
