//
//  UsersViewController.swift
//  RandomUser
//
//  Created by Ayuna NYC on 1/8/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    
    private let CellIdentifier = "UserTableViewCellIdentifier"
    
    var tableView = UITableView()

    var users = [User]()
    
    let dataManager = DataManager()
    
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        dataManager.getUsers() { (usersResult) in
            OperationQueue.main.addOperation {
                // add loading indicator
                switch usersResult {
                case let .success(_users):
                    self.users = _users
                    self.tableView.reloadData()
                case .failure():
                    print("\n \n \n Error fetching users \n \n \n")
                }
            }
        }
    }

    
    // MARK: - UITableView
    
    func setupTableView() {
        
        let screenSize = UIScreen.main.bounds
        tableView.frame = CGRect(x: 0, y: 20, width: screenSize.width, height: screenSize.height)
                
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80
        
        view.addSubview(tableView)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let user = users[indexPath.row]
        
        dataManager.getImageForUser(user: user, completion: { (imageResult) -> Void in
        
            OperationQueue.main.addOperation
            {
                switch imageResult
                {
                case let .success(_image):
                    if let userCell = cell as? UserTableViewCell
                    {
                        userCell.updateWithImage(image: _image)
                    }
                case .failure():
                    print("\n \n \n ERROR FETCHING PHOTO FOR USER \n \n \n")
                }
            }
        })
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! UserTableViewCell
        
        let user = users[indexPath.row]

        cell.avatarView.image = user.avatar
        cell.nameLabel.text = user.name
        
        return cell
    }

}
