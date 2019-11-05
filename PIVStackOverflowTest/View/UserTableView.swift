//
//  UserTableView.swift
//  PIVStackOverflowTest
//
//  Created by Suhaib Mahmood on 11/5/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
class UserTableView: UITableView{
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            indicator.style = .large
        } else {
            // Fallback on earlier versions
            indicator.style = .whiteLarge
        }
        indicator.color = .gray
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()

    let emptyTableLabel: UILabel = {
        let l = UILabel()
        l.sizeToFit()
        l.numberOfLines = 0
        l.isHidden = true
        l.textAlignment = .center
        l.text = "There's no data to display right now, check back later!"
        return l
    }()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubviews(){
        backgroundColor = .white
        addSubview(emptyTableLabel)
        addSubview(activityIndicator)
        
        activityIndicator.anchorCenterSuperview()
        emptyTableLabel.anchorCenterSuperview()
        emptyTableLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
}


