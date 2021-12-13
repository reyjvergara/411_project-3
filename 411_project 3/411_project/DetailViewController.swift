//
//  DetailViewController.swift
//  411_project
//
//  Created by Christian Teodoro on 12/12/21.
//  Rey Vergara
//

import UIKit

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
    var detailIndex = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = "Detailed View: \(name)"
        print("detail array copy has \(detailArray_copy)")
        detailArray_detailView = detailArray_copy
        //addDetails.text = writeDetails
        //textView.text = writeView
        //detailArray_detailView
        //addDetails.delegate = 
        
        /*
        if(detailArray_detailView.isEmpty){
            detailArray_detailView.append("")
        }else{
            textView.text = "Description: \(detailArray_detailView[detailIndex])"
        }*/
        
        
        //if(mainVC.detailArray.isEmpty){
        //    print("ARRAY IS EMPTY")
        //}
        //detailIndex = mainVC.tempIndex
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("I'm leaving DetailVC")
        delegate?.updateArray(detailArray_shared: detailArray_detailView)
        //view
        //self.performSegue(withIdentifier: "goBack", sender: self)
        
    }
    @IBAction func enter(_ sender: Any) {
        print("Before enter is done \(detailArray_detailView)")
        //detailArray_detailView.append(addDetails.text!)
        if(detailArray_detailView.isEmpty){
            detailArray_detailView.append(addDetails.text!)
            detailArray_detailView[detailIndex] = addDetails.text!
        } else{
            detailArray_detailView[detailIndex] = addDetails.text!
        }
        print("After enter is done \(detailArray_detailView)")
        //detailArray_detailView[detailIndex] = addDetails.text!
        /*let mainVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as! ViewController*/
        //detailArray_detailView[detailIndex] = mainVC.detailArray[detailIndex]
        //mainVC.detailArray = detailArray_detailView
        //print(mainVC.detailArray)
        //if let delegate = delegate{
          //  delegate.passDetailArray()->detailArray_detailView
        //}
        
        textView.text = "Description: \(addDetails.text!)"
        
    }
    

}



extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

