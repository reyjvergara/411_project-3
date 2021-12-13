//
//  DetailViewController.swift
//  411_project
//
//  Created by Christian Teodoro on 12/12/21.
//

import UIKit

protocol DetailViewControllerDelegate : NSObjectProtocol {
    func doSomethingWith(data: [String])
}

class DetailViewController: UIViewController{
    

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var addDetails: UITextField!
    @IBOutlet weak var textView: UITextView!
    weak var delegate : DetailViewControllerDelegate?
    var detailArray_detailView = [String]()
    var name = ""
    var writeDetails = UITextField()
    var writeView = UITextView()
    var detailIndex = 0
    //var defaults = NSUserDefaults.standardUserDefaults()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = "Detailed View: \(name)"
        //addDetails.text = writeDetails
        //textView.text = writeView
        
        addDetails.delegate = self
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

    @IBAction func enter(_ sender: Any) {
        //detailArray_detailView.append(addDetails.text!)
        if(detailArray_detailView.isEmpty){
            detailArray_detailView.append(addDetails.text!)
        } else{
            detailArray_detailView[detailIndex] = addDetails.text!
        }
        print(detailArray_detailView)
        detailArray_detailView[detailIndex] = addDetails.text!
        let mainVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //detailArray_detailView[detailIndex] = mainVC.detailArray[detailIndex]
        mainVC.detailArray = detailArray_detailView
        print(mainVC.detailArray)
        if  let delegate = delegate{
            delegate.doSomethingWith(data: detailArray_detailView)
        }
        textView.text = "Description: \(addDetails.text!)"
        
    }

}



extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

