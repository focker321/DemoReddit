//
//  PostListPresenter.swift
//  RedditDemo
//
//  Created by Santiago Apaza on 6/7/20.
//  Copyright (c) 2020 Ayllu. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class PostListPresenter {

    // MARK: - Private properties -

    private unowned let view: PostListViewInterface
    private let interactor: PostListInteractorInterface
    private let wireframe: PostListWireframeInterface
    
    private var _posts: [RedditPost] = []
    private let _pageNumber: Int = 0
    
    // MARK: - Lifecycle -

    init(view: PostListViewInterface, interactor: PostListInteractorInterface, wireframe: PostListWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension PostListPresenter: PostListPresenterInterface {
    var numberOfPosts: Int { _posts.count }
    
    func getPosts() {
        let customResolver: (([RedditPost]) -> Void) = { [weak self] posts in
            self?._posts = posts
            self?.view.refreshPostList()
        }
        let customRejector: ((String) -> Void) = { _ in }
        
        interactor.fetchPosts(page: _pageNumber, resolver: customResolver, rejector: customRejector)
    }
    
    func postByIndex(_ index: IndexPath) -> RedditPost? {
        guard index.row < numberOfPosts else {
            return nil
        }
        
        return _posts[index.row]
    }
    
    func navigateToDetail(_ index: IndexPath) {
        guard let postSelected = postByIndex(index) else {
            // TODO: Use one custom view for showing a message to user, that for any reason is not possible to see post's detail
            return
        }
        // TODO: Change tiel by id
        wireframe.navigate(to: .detail(byId: postSelected.title))
    }
}
