//
//  ViewController.swift
//  411_project
//
//  Created by Christian Teodoro on 12/9/21.
//  and Rey Vergara

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DVControllerProtocol {
    
    // Updates the array to match the one passed by the DetailViewController
    func updateArray(detailArray_shared: [String]) {
        print(detailArray_shared)
        detailArray = detailArray_shared
    }
    

    @IBOutlet var AddText: UITextField!
    @IBOutlet var tblView: UITableView!
    var stringArray = [String]()
    @IBOutlet var detailArray = [String]()
    @IBOutlet var titleLabel: UILabel!
    var tempIndex:Int = 0
    
    // to have the tableView set up
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return stringArray.count}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let txt = stringArray[indexPath.row]
        cell.textLabel?.text = txt
        return cell
    }
    
    
    // When the add text is done, so that the table can get appended with this new cell
    @IBAction func addAction(_ sender: UIButton) {
        if (sender.titleLabel?.text == "ADD") {
            sender.setTitle("DONE", for: .normal)
            AddText.isUserInteractionEnabled = true
        } else {
            sender.setTitle("ADD", for: .normal)
            AddText.isUserInteractionEnabled = false
            if let c = AddText.text {
                stringArray.append(c)
                // detailArray gets an empty value to not be out of bounds
                detailArray.append("")
            }
            AddText.text = ""
            tblView.reloadData()
        }
    }
    
    
    //run when tableview tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tap to navigate to detailed view
        tempIndex = indexPath.row // assigns temporaryIndex to the tapped table
        print("You tapped cell number \(indexPath.row).") // debugging purposes
        // print("detail array looks like this: \(detailArray)") -- debugging purposes
        // Now does a segue to the DetailViewController
        self.performSegue(withIdentifier: "goToDetail", sender: self)
        //detailArray[indexPath.row] = vc?.name ?? "Something" // Code that I just like, but useless in this current implementation
    }
    
    
    //row deletion
    func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stringArray.remove(at: indexPath.row)
            // detailArray gets a removed element too
            detailArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    // viewDidAppear is only here to check data integrity 
    /*
    override func viewDidAppear(_ animated: Bool) {
        print("We are back at viewcontroller")
        print("detail array looks like this: \(detailArray)")
        
    }*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print("View did load for ViewController")
        //print(detailArray)
        //print("What happens next...?")
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


