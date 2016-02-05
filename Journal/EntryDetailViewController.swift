//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Kaytee on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWithEntry(entry: Entry) {
        self.titleTextField.text = entry.title
        self.bodyTextView.text = entry.bodyText
    }
    
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
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
