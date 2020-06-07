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
        static let padding: CGFloat = 8.0
        static let timeCreatedMask = "%d hours ago"
    }
    
    // MARK: - Public properties -
    var isSeen: Bool = false {
        didSet {
            _seenIndicatorView.isHidden = isSeen
        }
    }
    
    var urlImagePost: String = "" {
        didSet {
            // TODO: Use URLSession for getting image from network
        }
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
        label.textColor = .white
        
        return label
    }()
    
    private let _creationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: _Constans.standarLabelSize)
        label.textAlignment = .right
        label.textColor = .white
        
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
        label.font = UIFont.systemFont(ofSize: _Constans.standarLabelSize)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "2"
        label.textColor = .white
        
        return label
    }()
    
    //    private let chevronImageView: UIImageView!
    
    private let _dismissPostButton: UIButton = {
        let crossButton = UIButton(type: .custom)
        // TODO: Improve size image
        crossButton.setImage(UIImage(named: "cross"), for: .normal)
        crossButton.imageView?.contentMode = .scaleAspectFit        
        crossButton.setTitle("Dismiss Post", for: .normal)
        crossButton.contentHorizontalAlignment = .left;
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        crossButton.heightAnchor.constraint(equalToConstant: _Constans.dismissImageSize).isActive = true
        
        return crossButton
    }()
    
    private let _numberOfCommentsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: _Constans.standarLabelSize)
        label.textAlignment = .left
        label.text = "3"
        label.textColor = .redOrange
        
        return label
    }()
    
    override func prepareForReuse() {
        // TODO: Check the best strategi for reusing cell
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        _SetupCellStyle()
        
        addSubview(_seenIndicatorView)
        addSubview(_userNameLabel)
        addSubview(_creationLabel)
        
        addSubview(_postImageView)
        addSubview(_postTitleLabel)
        
        addSubview(_dismissPostButton)
        addSubview(_numberOfCommentsLabel)
        
        let headerStackView = UIStackView(arrangedSubviews: [_seenIndicatorView, _userNameLabel, _creationLabel])
        headerStackView.distribution = .fill
        headerStackView.axis = .horizontal
        headerStackView.spacing = 16
        addSubview(headerStackView)
        
        let bodyStackView = UIStackView(arrangedSubviews: [_postImageView, _postTitleLabel])
        bodyStackView.distribution = .fill
        bodyStackView.axis = .horizontal
        bodyStackView.spacing = 16
        addSubview(bodyStackView)
        
        let footerStackView = UIStackView(arrangedSubviews: [_dismissPostButton, UIView(), _numberOfCommentsLabel])
        footerStackView.distribution = .fill
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
            containerSackView.topAnchor.constraint(equalTo: topAnchor, constant: _Constans.padding),
            containerSackView.leftAnchor.constraint(equalTo: leftAnchor, constant: _Constans.padding),
            containerSackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -_Constans.padding),
            containerSackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -_Constans.padding)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupDataSource(post: RedditPost) {
        isSeen = post.clicked
        _userNameLabel.text = post.author
        _postTitleLabel.text = post.title
        let postDate = Date(timeIntervalSince1970: post.created)
        _creationLabel.text = String(format: _Constans.timeCreatedMask, Date().getIntervalBetween(postDate, in: .hours))
        urlImagePost = post.thumbnail
    }
        
    private func _SetupCellStyle() {
        backgroundColor = .darkGray
    }
}
