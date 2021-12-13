//
//  ViewController.swift
//  411_project
//
//  Created by Christian Teodoro on 12/9/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DVControllerProtocol {
    func updateArray(detailArray_shared: [String]) {
        print(detailArray_shared)
        detailArray = detailArray_shared
    }
    

    
    @IBOutlet var detailArray = [String]()
    @IBOutlet var titleLabel: UILabel!
    
    var tempIndex:Int = 0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*print("This is run in tableView \(detailArray)")
        print(stringArray.count)*/
        return stringArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let txt = stringArray[indexPath.row]
        cell.textLabel?.text = txt
        return cell
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        if (sender.titleLabel?.text == "ADD") {
            sender.setTitle("DONE", for: .normal)
            AddText.isUserInteractionEnabled = true
        } else {
            sender.setTitle("ADD", for: .normal)
            AddText.isUserInteractionEnabled = false
            if let c = AddText.text {
                stringArray.append(c)
                
            }
            AddText.text = ""
            tblView.reloadData()
            
        }
    }
    
    
    //run when tableview tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tap to navigate to detailed view
        tempIndex = indexPath.row
        //detailArray = vc!.detailArray_detailView
        //print(tempIndex)
        print("You tapped cell number \(indexPath.row).")
        detailArray.append("One more element")
        print("detail array looks like this: \(detailArray)")
        self.performSegue(withIdentifier: "goToDetail", sender: self)
        //detailArray[indexPath.row] = vc?.name ?? "Something"
        //print (detailArray)
    }
    //row deletion
    func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stringArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    @IBOutlet var AddText: UITextField!
    @IBOutlet var tblView: UITableView!
    var stringArray = [String]()
    
    
    override func viewDidAppear(_ animated: Bool) {
        print("We are back at viewcontroller")
        print("detail array looks like this: \(detailArray)")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let DetailVC = DetailViewController()
        //if(DetailVC.detailArray_detailView.isEmpty){
        //detailArray = DetailVC.detailArray_detailView
        print("View did load for ViewController")
        print(detailArray)
        print("What happens next...?")
            //detailArray = DetailVC.detailArray_detailView
        //detailArray.append("This is detail that appears in ViewController.swift")
        AddText.isUserInteractionEnabled = false
        tblView.dataSource = self
        tblView.delegate = self
        titleLabel.text = "To-Do List"
    }
    

    // Rey Vergara
    // Segue from ViewController to DetailViewController
    // This will copy the array of detailArray
    // to the array detailArray_detailView of the DetailViewController
    // Segue will get called when the cell is tapped
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let dVController = segue.destination as! DetailViewController
            //dVController.loadViewIfNeeded()
            dVController.detailArray_copy = detailArray
            dVController.detailIndex = tempIndex
            dVController.delegate = self
        }
    }

}


