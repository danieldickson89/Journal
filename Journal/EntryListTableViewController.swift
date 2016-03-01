//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Kaytee on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        //view.backgroundColor = .myGreenColor()
        tableView.reloadData()
    }
    
    // MARK: - Search Controller
    
    func setUpSearchController() {
        let resultsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("resultsVC")
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = true
        
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text ?? ""
        let lowercaseSearchTerm = searchTerm.lowercaseString
        
        if let resultsController = searchController.searchResultsController as? EntryResultsTableViewController {
            resultsController.filteredEntries =
                EntryController.sharedInstance.entriesArray.filter({ $0.title.lowercaseString.containsString(lowercaseSearchTerm) })
            resultsController.tableView.reloadData()
        }
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedInstance.entriesArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        let entry = EntryController.sharedInstance.entriesArray[indexPath.row]
        
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = "\(NSDate())"
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let entry = EntryController.sharedInstance.entriesArray[indexPath.row]
            // Delete the row from the data source
            EntryController.sharedInstance.removeEntry(entry)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailView" {
            
            var selectedEntry: Entry
            
            let cell = sender as! UITableViewCell
            if let indexPath = (searchController.searchResultsController as! EntryResultsTableViewController).tableView.indexPathForCell(cell) {
                let filteredEntries = (searchController.searchResultsController as! EntryResultsTableViewController).filteredEntries
                selectedEntry = filteredEntries[indexPath.row]
                
            } else {
                let allEntries = EntryController.sharedInstance.entriesArray
                let allEntriesIndexPath = tableView.indexPathForCell(cell)
                selectedEntry = allEntries[allEntriesIndexPath!.row]
            }
            
            
            
            if let entryDetailViewController = segue.destinationViewController as? EntryDetailViewController {
                _ = entryDetailViewController.view
                entryDetailViewController.updateWithEntry(selectedEntry)
            }
        }
    }
}
