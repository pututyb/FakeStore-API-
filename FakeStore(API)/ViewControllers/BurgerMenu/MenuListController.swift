//
//  MenuListController.swift
//  FakeStore(API)
//
//  Created by Putut Yusri Bahtiar on 29/07/23.
//

import UIKit

class MenuListController: UITableViewController {
    var items = ["Dark Mode", "Account Information", "Password", "Order", "My Cards", "Wishlist", "Settings", "Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.lblButton.text = items[indexPath.row]
        cell.cellImageView.image = UIImage(named: "bag")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.row]
        
        // Check if the selected item is "Password"
        if selectedItem == "Password" {
            // Show the ForgotPasswordViewController modally
            let forgotPasswordVC = ForgotPasswordViewController()
            let navController = UINavigationController(rootViewController: forgotPasswordVC)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
        }
    }
}
