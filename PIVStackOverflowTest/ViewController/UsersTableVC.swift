//
//  ViewController.swift
//  PIVStackOverflowTest
//
//  Created by Suhaib Mahmood on 11/4/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class UsersTableVC: UITableViewController {
    
    var users: [User]? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                if self?.users == nil {
//                    self?.emptyTableLabel.isHidden = false
                } else {
//                    self?.emptyTableLabel.isHidden = true
                }
//                self?.activityIndicator.stopAnimating()
                self?.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setUpViews()
        performNetworkCall()
        // Do any additional setup after loading the view.
    }

    //MARK: View setup functions
    private func setUpViews() {
        tableView.register(UserTableViewCell.self)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
    }
    
    
    //MARK: Networking call
    func performNetworkCall(networkManager: NetworkManagerProtocol = NetworkManager()) {
//        self.activityIndicator.startAnimating()
        networkManager.getStackOverflowUsers { [weak self] (result) in
            switch result{
            case .success(let users):
                self?.users = users
            case .failure(let error):
                self?.users = nil
                print(error.reason)
            }
        }
    }

}

//datasource
extension UsersTableVC{
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as UserTableViewCell
        guard let safeUsers = users else{return cell}
        let user = safeUsers[indexPath.row]
        let viewModel = UsersViewModel(user: user)
        cell.setUpWith(viewModel)
        if let imageUrl = user.profileImageUrl{
            let downloader = ImageDownloader()
            downloader.downloadImageCacheAndAssignToImageView(imageUrl: imageUrl, imageView: cell.profileImageView)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
}
