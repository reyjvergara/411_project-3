//
//  ViewController.swift
//  411_project
//
//  Created by Christian Teodoro on 12/9/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var titleLabel: UILabel!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        
        self.navigationController?.pushViewController(vc!, animated: true)
        print("You tapped cell number \(indexPath.row).")
        
    }
    //row deletion
    func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            stringArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    
    //@IBAction func delAction(_ sender: UIButton) {
        //tblView.isEditing = true
        
   // }
    @IBOutlet var AddText: UITextField!
    @IBOutlet var tblView: UITableView!
    var stringArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AddText.isUserInteractionEnabled = false
        tblView.dataSource = self
        tblView.delegate = self
        titleLabel.text = "To-Do List"
        
    }



}


