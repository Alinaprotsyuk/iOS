//
//  SpendingViewController.swift
//  mySpending
//
//  Created by ITA student on 9/13/17.
//  Copyright © 2017 Alina Protsyuk. All rights reserved.
//

import UIKit

class SpendingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var mySpending: UITextField!
    
    @IBOutlet weak var myDescription: UITextField!
    
    @IBOutlet weak var myCategory: UITextField!
    
    @IBOutlet weak var myDropDownList: UIPickerView!
    
    var category = ["Food", "Clothes", "Other"]
    
    var store = DataStore.sharedInstnce
    
    @IBAction func addCategories(_ sender: Any) {
        let alertController = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {
            alert -> Void in
            let textField = alertController.textFields![0] as UITextField
            if let item = textField.text {
                self.category.append(item.localizedCapitalized)
                self.myDropDownList.reloadAllComponents()
            }
            // do something with textField
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "New category"
        })
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        self.view.endEditing(true)
        return category[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.myCategory.text = self.category[row]
        self.myDropDownList.isHidden = true
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.myCategory {
            self.myDropDownList.isHidden = false
        }
    }
    
    var filePath: String {
        //1 - manager lets you examine contents of a files and folders in your app; creates a directory to where we are saving it
        let manager = FileManager.default
        //2 - this returns an array of urls from our documentDirectory and we take the first path
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        print("this is the url path in the documentDirectory \(url)")
        //3 - creates a new path component and creates a new file called "Data" which is where we will store our Data array.
        return (url!.appendingPathComponent("Data").path)
    }
    
    private func saveData(item: CategoryItem) {
        self.store.categoryItems.append(item)
        
        //4 - nskeyedarchiver is going to look in every shopping list class and look for encode function and is going to encode our data and save it to our file path.  This does everything for encoding and decoding.
        //5 - archive root object saves our array of shopping items (our data) to our filepath url
        NSKeyedArchiver.archiveRootObject(self.store.categoryItems, toFile: filePath)
    }
    
    private func loadData() {
        //6 - if we can get back our data from our archives (load our data), get our data along our file path and cast it as an array of ShoppingItems
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [CategoryItem] {
            self.store.categoryItems = ourData
        }
    }
}


