//
//  DetailViewController.swift
//  411_project
//
//  Created by Christian Teodoro on 12/12/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var addDetails: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    var name = ""
    var writeDetails = UITextField()
    var writeView = UITextView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = "Detailed View: \(name)"
        //addDetails.text = writeDetails
        //textView.text = writeView
        
        addDetails.delegate = self

        // Do any additional setup after loading the view.
    }

    @IBAction func enter(_ sender: Any) {
        textView.text = "Description: \(addDetails.text!)"
    }
    
}

extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
