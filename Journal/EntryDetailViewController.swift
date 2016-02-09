//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Kaytee on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: - Properties

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let entry = entry {
            updateWithEntry(entry)
        }
    }
    
    func updateWithEntry(entry: Entry) {
        self.titleTextField.text = entry.title
        self.bodyTextView.text = entry.bodyText
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        
        if let entryTitle = titleTextField.text, entryBodyText = bodyTextView.text {
            
            EntryController.sharedInstance.addEntry(Entry(title: entryTitle, bodyText: entryBodyText))
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

   
    @IBAction func clearButtonTapped(sender: AnyObject) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
}