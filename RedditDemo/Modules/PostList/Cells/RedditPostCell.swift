//
//  RedditPostCell.swift
//  RedditDemo
//
//  Created by Santiago Apaza on 6/7/20.
//  Copyright © 2020 Ayllu. All rights reserved.
//

import UIKit

class RedditPostCell: UITableViewCell {
    private enum _Constans {
        static let standarLabelSize: CGFloat = 16.0
        static let seenIndicatorColor: UIColor = .blue
        static let seenIndicatorSize: CGFloat = 16.0
        static let imagePostSize: CGFloat = 60.0
        static let dismissImageSize: CGFloat = 24.0
    }
    
    // MARK: - Private properties -
    
    private let _seenIndicatorView: UIView = {
        let indicator = UIView()
        indicator.backgroundColor = _Constans.seenIndicatorColor
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            indicator.heightAnchor.constraint(equalToConstant: _Constans.seenIndicatorSize),
            indicator.widthAnchor.constraint(equalToConstant: _Constans.seenIndicatorSize)
        ])
        
        indicator.layer.borderWidth = 0
        indicator.layer.masksToBounds = false
        indicator.layer.cornerRadius = _Constans.seenIndicatorSize / 2.0
        indicator.clipsToBounds = true

        return indicator
    }()
    
    private let _userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: _Constans.standarLabelSize)
        label.textAlignment = .left
        label.text = "1"
        label.textColor = .black
        
        return label
    }()
    
    private let _creationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: _Constans.standarLabelSize)
        label.textAlignment = .left
        label.text = "18 hours ago"
        label.textColor = .black
        
        return label
    }()

    private let _postImageView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "reddit"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imgView.heightAnchor.constraint(equalToConstant: _Constans.imagePostSize),
            imgView.widthAnchor.constraint(equalToConstant: _Constans.imagePostSize)
        ])
        
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        
        
        return imgView
    }()
    
    private let _postTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: _Constans.standarLabelSize)
        label.textAlignment = .left
        label.text = "2"
        label.textColor = .black
        
        return label
    }()
    
    //    private let chevronImageView: UIImageView!
    
    private let _dismissPostButton: UIButton = {
        let crossButton = UIButton(type: .custom)
        // TODO: Improve size image
        crossButton.setImage(UIImage(named: "cross"), for: .normal)
        crossButton.imageView?.contentMode = .scaleAspectFit        
        crossButton.setTitle("Dismiss Post", for: .normal)
        crossButton.setTitleColor(.black, for: .normal)
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        crossButton.heightAnchor.constraint(equalToConstant: _Constans.dismissImageSize).isActive = true
        
        return crossButton
    }()
    
    private let _numberOfCommentsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: _Constans.standarLabelSize)
        label.textAlignment = .left
        label.text = "3"
        label.textColor = .orange
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(_seenIndicatorView)
        addSubview(_userNameLabel)
        addSubview(_creationLabel)
        
        addSubview(_postImageView)
        addSubview(_postTitleLabel)
        
        addSubview(_dismissPostButton)
        addSubview(_numberOfCommentsLabel)
        
        let headerStackView = UIStackView(arrangedSubviews: [_seenIndicatorView, _userNameLabel, _creationLabel])
        headerStackView.distribution = .equalSpacing
        headerStackView.axis = .horizontal
        headerStackView.spacing = 16
        addSubview(headerStackView)
        
        let bodyStackView = UIStackView(arrangedSubviews: [_postImageView, _postTitleLabel])
        bodyStackView.distribution = .equalSpacing
        bodyStackView.axis = .horizontal
        bodyStackView.spacing = 16
        addSubview(bodyStackView)
        
        let footerStackView = UIStackView(arrangedSubviews: [_dismissPostButton, _numberOfCommentsLabel])
        footerStackView.distribution = .equalSpacing
        footerStackView.axis = .horizontal
        footerStackView.spacing = 16
        addSubview(footerStackView)
        
        let containerSackView = UIStackView(arrangedSubviews: [headerStackView, bodyStackView, footerStackView])
        containerSackView.distribution = .equalSpacing
        containerSackView.axis = .vertical
        containerSackView.spacing = 16
        addSubview(containerSackView)
        
        containerSackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerSackView.topAnchor.constraint(equalTo: topAnchor),
            containerSackView.leftAnchor.constraint(equalTo: leftAnchor),
            containerSackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerSackView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    public func setupDataSource(post: RedditPost) {
        // TODO: Set Reddit data post inside cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
