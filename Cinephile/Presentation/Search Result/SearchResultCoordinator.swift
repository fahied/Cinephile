//
//  NewsCoordinator.swift
//  Cinephile
//
//  Created by Muhammad Fahied on 5/4/19.
//  Copyright © 2019 Spider. All rights reserved.
//

import XCoordinator

enum SearchResultRoute: Route {
    case movies
    case movieDetail(UInt)
}

class SearchResultCoordinator: NavigationCoordinator<SearchResultRoute> {
    
    // MARK: - Init
    init() {
        super.init(initialRoute: .movies)
    }
    
    // MARK: - Overrides
    override func prepareTransition(for route: SearchResultRoute) -> NavigationTransition {
        switch route {
        case .movies:
            var viewController = SearchResultViewController.instantiateFromNib()
            viewController.title = "Search Movies"
            let viewModel = SearchResultViewModel(router: anyRouter)
            viewController.bind(to: viewModel)
            return .push(viewController)
        case .movieDetail(let id):
            let viewController = DetailViewController.instantiateFromNib()
            return .push(viewController)
        }
    }
}

