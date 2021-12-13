//
//  ViewController.swift
//  411_project
//
//  Created by Christian Teodoro on 12/9/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetailViewControllerDelegate {
    func doSomethingWith(data: [String]) {
        detailArray = data
    }
    
    
    @IBOutlet var titleLabel: UILabel!
    var detailArray = [String]()
    var tempIndex:Int = 0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let txt = stringArray[indexPath.row]
        cell.textLabel?.text = txt
        return cell
    }
    //let detailVC = UIStoryboard(name: "", bundle: <#T##Bundle?#>)
    
    @IBAction func addAction(_ sender: UIButton) {
        if (sender.titleLabel?.text == "ADD") {
            sender.setTitle("DONE", for: .normal)
            AddText.isUserInteractionEnabled = true
        } else {
            sender.setTitle("ADD", for: .normal)
            AddText.isUserInteractionEnabled = false
            if let c = AddText.text {
                stringArray.append(c)
                detailArray.append("")
            }
            AddText.text = ""
            tblView.reloadData()
            
        }
    }
    //let masterVC = self.splitViewController?.viewControllers.description
    //run when tableview tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tap to navigate to detailed view
        tempIndex = indexPath.row
        //detailArray = vc!.detailArray_detailView
        print(tempIndex)
        self.performSegue(withIdentifier: "MainVCToDetailVC", sender: self)
        
        
        print("You tapped cell number \(indexPath.row).")
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
        
        AddText.isUserInteractionEnabled = false
        tblView.dataSource = self
        tblView.delegate = self
        titleLabel.text = "To-Do List"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "MainVCToDetailVC"){
            let detailVC = segue.destination as! DetailViewController
            detailVC.delegate = self
        }
    }

}


