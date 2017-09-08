//
//  ViewController.swift
//  ToDo List simple
//
//  Created by ITA student on 9/6/17.
//  Copyright © 2017 Alina Protsyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var array = [String]()

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addBtn(_ sender: Any) {
        if textField.text != "" {
              if array.contains(textField.text!){
                    createAlert()
                } else {
                    array.append(textField.text!)
                }
        
            }
            
            array.sort()
            tableView.reloadData()
            textField.text = ""
        }
    
    func createAlert(){
        let alert = UIAlertController(title: "Warning!", message: "Duplicate item", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert,animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            array.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
    }
}



