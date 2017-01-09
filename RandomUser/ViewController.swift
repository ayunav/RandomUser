//
//  ViewController.swift
//  RandomUser
//
//  Created by Ayuna NYC on 1/8/17.
//  Copyright © 2017 Ayuna NYC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let CellIdentifier = "UserTableViewCellIdentifier"
    
    var tableView = UITableView()
    let itemsToLoad: [String] = ["One", "Two", "Three"]
    
    
    var users = [User]()
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
 
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    
    // MARK: - UITableView 
    
    func setupTableView() {
        
//        let screenSize = UIScreen.main.bounds
//        tableView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        
        tableView.frame = view.frame

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToLoad.count
        //        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! UserTableViewCell

        cell.nameLabel.text = self.itemsToLoad[indexPath.row]
        
//        let user = users[indexPath.row]
//        
//        cell.avatarView.image = user.avatar
//        cell.nameLabel.text = user.name
        
        return cell
    }
}

