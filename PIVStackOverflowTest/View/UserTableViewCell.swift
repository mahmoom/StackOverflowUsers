//
//  UsersTableViewCell.swift
//  PIVStackOverflowTest
//
//  Created by Suhaib Mahmood on 11/5/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    
    let userNameLabel: UILabel = {
        let l = UILabel()
        l.sizeToFit()
        l.numberOfLines = 0
        return l
    }()
    
    let bronzeBadgeLabel: UILabel = {
        let l = UILabel()
        l.sizeToFit()
        l.textAlignment = .right
        l.font = UIFont.systemFont(ofSize: UIFont.systemFontSize * 0.85)
        return l
    }()
    
    let silverBadgeLabel: UILabel = {
        let l = UILabel()
        l.sizeToFit()
        l.textAlignment = .right
        l.font = UIFont.systemFont(ofSize: UIFont.systemFontSize * 0.85)
        return l
    }()
    let goldBadgeLabel: UILabel = {
            let l = UILabel()
            l.sizeToFit()
            l.textAlignment = .right
        l.font = UIFont.systemFont(ofSize: UIFont.systemFontSize * 0.85)
            return l
        }()
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    func setUpViews() {
        
        addSubview(profileImageView)
        addSubview(userNameLabel)
        addSubview(bronzeBadgeLabel)
        addSubview(silverBadgeLabel)
        addSubview(goldBadgeLabel)
        
        let sidePadding = CGFloat(15)
        
        profileImageView.anchorCenterYToSuperview()
        profileImageView.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: safeAreaLayoutGuide.leftAnchor, paddingLeft: 8, right: nil, paddingRight: 0, width: 48, height: 48)
        userNameLabel.anchorCenterYToSuperview()
        userNameLabel.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: profileImageView.rightAnchor, paddingLeft: sidePadding, right: nil, paddingRight: 0, width: frame.width * 1/2, height: 0)
        bronzeBadgeLabel.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: frame.height/4, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: safeAreaLayoutGuide.rightAnchor, paddingRight: sidePadding, width: frame.width/4, height: 0)
        silverBadgeLabel.anchor(top: bronzeBadgeLabel.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: safeAreaLayoutGuide.rightAnchor, paddingRight: sidePadding, width: frame.width/4, height: 0)
        goldBadgeLabel.anchor(top: silverBadgeLabel.bottomAnchor, paddingTop: 0, bottom: safeAreaLayoutGuide.bottomAnchor, paddingBottom: 15, left: nil, paddingLeft: 0, right: safeAreaLayoutGuide.rightAnchor, paddingRight: sidePadding, width: frame.width/4, height: 0)
    }
    
    //MARK: - Cell customization
    func setUpWith(_ viewModel: UsersViewModel) {
        
        userNameLabel.text = viewModel.userName
        bronzeBadgeLabel.text = viewModel.bronzeBadgeCount
        silverBadgeLabel.text = viewModel.silverBadgeCount
        goldBadgeLabel.text = viewModel.goldBadgeCount
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


