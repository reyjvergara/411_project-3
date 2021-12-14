//
//  DetailViewController.swift
//  411_project
//
//  Created by Christian Teodoro on 12/12/21.
//  Rey Vergara
//

import UIKit


// protocol implemented in order to have array be updated between the two view controllers
protocol DVControllerProtocol {
    func updateArray(detailArray_shared: [String])
}

class DetailViewController: UIViewController{
    

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var addDetails: UITextField!
    @IBOutlet weak var textView: UITextView!
    var delegate : DVControllerProtocol?
    var detailArray_copy = [String]()
    @IBOutlet var detailArray_detailView = [String]()
    var name = ""
    var writeDetails = UITextField()
    var writeView = UITextView()
    // helps know where in the row Index this detail should be
    var detailIndex = 0
    

    
    override func viewDidLoad() {
        // when view for DetailViewController loads, do this
        super.viewDidLoad()
        lbl.text = "Detailed View: \(name)"
        //print("detail array copy has \(detailArray_copy)") -- debugging statement
        
        detailArray_detailView = detailArray_copy
        // copies the shared array to the main detailArray_detailView array
        if(detailArray_detailView[detailIndex].isEmpty){
            // display nothing when detailArray_detailView is at its default
            // append state of ""
        }
        else{
            // does this if existing data exists to read
            textView.text = "Description: \(detailArray_detailView[detailIndex])"
            addDetails.text = detailArray_detailView[detailIndex]
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // do this when DetailViewCon. will disapear
        super.viewWillDisappear(animated)
        //print("I'm leaving DetailVC") -- debugging statement
        // updates the array to match changes done in the detailArray_detailView
        delegate?.updateArray(detailArray_shared: detailArray_detailView)
    }
    
    @IBAction func enter(_ sender: Any) {
        // Occurs when the enter button is entered for the DetailViewController
        // if statement checks if this array is empty to append the details to it
        // only valid for the first element
        if(detailArray_detailView.isEmpty){
            detailArray_detailView.append(addDetails.text!)
            detailArray_detailView[detailIndex] = addDetails.text!
        } else{
        // else addDetails.text will be assigned to the detailView array
            detailArray_detailView[detailIndex] = addDetails.text!
        }
        // print("After enter is done \(detailArray_detailView)") -- Debug statement
        // Adds the detail to textView
        textView.text = "Description: \(addDetails.text!)"
    }
}

extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

