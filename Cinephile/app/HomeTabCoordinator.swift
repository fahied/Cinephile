//
//  HomeTabCoordinator.swift
//  Cinephile
//
//  Created by Muhammad Fahied on 5/4/19.
//  Copyright © 2019 Spider. All rights reserved.
//

import XCoordinator

enum HomeRoute: Route {
    case movies
    case favorites
}

class HomeTabCoordinator: TabBarCoordinator<HomeRoute> {
    
    // MARK: - Stored properties
    
    private let SearchResultRouter: AnyRouter<SearchResultRoute>
    private let favoritesRouter: AnyRouter<FavoritesRoute>
    
    // MARK: - Init
    
    convenience init() {
        let searchResultCoordinator = SearchResultCoordinator()
        searchResultCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let favoritesCoordinator = FavoritesCoordinator()
        favoritesCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        self.init(SearchResultRouter: searchResultCoordinator.anyRouter,
                  favoritesRouter: favoritesCoordinator.anyRouter)
    }
    
    init(SearchResultRouter: AnyRouter<SearchResultRoute>,
         favoritesRouter: AnyRouter<FavoritesRoute>) {
        self.SearchResultRouter = SearchResultRouter
        self.favoritesRouter = favoritesRouter
        
        super.init(tabs: [SearchResultRouter, favoritesRouter], select: SearchResultRouter)
    }
    
    // MARK: - Overrides
    
    override func prepareTransition(for route: HomeRoute) -> TabBarTransition {
        switch route {
        case .movies:
            return .select(SearchResultRouter)
        case .favorites:
            return .select(favoritesRouter)
        }
    }
}

