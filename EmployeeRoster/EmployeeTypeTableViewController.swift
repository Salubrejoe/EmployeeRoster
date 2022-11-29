//
//  EmployeeTypeTableViewController.swift
//  EmployeeRoster
//
//  Created by Lore P on 14/10/2022.
//

import UIKit

protocol EmployeeTypeTableViewControllerDelegate {
    func employeeTypeTableViewController (_ tableView: EmployeeTypeTableViewController, didselect employeeType: EmployeeType)
    
}

class EmployeeTypeTableViewController: UITableViewController {
    
    var employee: Employee?
    var employeeType: EmployeeType?
    var delegate: EmployeeTypeTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBSegueAction func showEmployeeTypes(_ coder: NSCoder) -> EmployeeTypeTableViewController? {
        let typeController = EmployeeTypeTableViewController(coder: coder)
        typeController?.delegate = self
        return typeController
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmployeeType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTypeCell", for: indexPath)
        let type = EmployeeType.allCases[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = type.description
        cell.contentConfiguration = content
        
        if employeeType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        employeeType = EmployeeType.allCases[indexPath.row]
//        tableView.beginUpdates()
//        tableView.endUpdates()
        let type = EmployeeType.allCases[indexPath.row]
        employeeType = type
        delegate?.employeeTypeTableViewController(self, didselect: type)
        tableView.reloadData()
    }
    
    

}
