//
//  PostListWireframe.swift
//  RedditDemo
//
//  Created by Santiago Apaza on 6/7/20.
//  Copyright (c) 2020 Ayllu. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class PostListWireframe: BaseWireframe {

    // MARK: - Private properties -

    // MARK: - Module setup -

    init() {
        let moduleViewController = PostListViewController()
        super.init(viewController: moduleViewController)

        let interactor = PostListInteractor()
        let presenter = PostListPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }
}

// MARK: - Extensions -

extension PostListWireframe: PostListWireframeInterface {
    func navigate(to option: PostListNavigationOption) {
        navigationController?.pushWireframe(PostLDetailWireframe())
    }
}
