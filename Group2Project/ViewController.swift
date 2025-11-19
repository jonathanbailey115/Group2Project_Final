//
//  ViewController.swift
//  Group2Project
//
//  Created by Bailey, Jonathan D. on 11/18/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //outlets for the table and "no notes" label
    @IBOutlet var table: UITableView!
    @IBOutlet var lable: UILabel!
    
    //array holding the notes
    var models: [(title: String, note: String)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        title = "Notes"
    }
    
    //takes user to new note page
    @IBAction func didTapNewNote() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "new") as? EntryViewController else {
            return
        }
        vc.title = "New Note"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Various Table Settings
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    //Show note Controller
    guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else {
            return
    }
    vc.title = "Note"
    navigationController?.pushViewController(vc,animated: true)
    }
}
    
