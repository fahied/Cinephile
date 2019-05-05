//
//  FavoritesCooridinator.swift
//  Cinephile
//
//  Created by Muhammad Fahied on 5/4/19.
//  Copyright © 2019 Spider. All rights reserved.
//

import XCoordinator

enum FavoritesRoute: Route {
    case favorites
    case movieDetail(Movie)
}

class FavoritesCoordinator: NavigationCoordinator<FavoritesRoute> {
    
    // MARK: - Init
    
    init() {
        super.init(initialRoute: .favorites)
    }
    
    // MARK: - Overrides
    
    override func prepareTransition(for route: FavoritesRoute) -> NavigationTransition {
        switch route {
        case .favorites:
            let viewController = FavoritesViewController.instantiateFromNib()
            return .push(viewController)
        case .movieDetail(let movie):
            let viewController = DetailViewController.instantiateFromNib()
            return .push(viewController)
        }
    }
}

