/*
 *	MoviesViewModel.swift
 *	Cinephile
 *
 *	Created by Muhammad Fahied on 5/4/19.
 *	Copyright 2019 Spider. All rights reserved.
 */

import UIKit
import XCoordinator
import RxSwift
import RxCocoa


struct SearchResultViewModel {

    private let router: AnyRouter<SearchResultRoute>
    var movies = BehaviorRelay<[MovieViewModal]>(value: [])
    
    // MARK: - Init
    init(router: AnyRouter<SearchResultRoute>) {
        self.router = router
        fetchNextPage()
    }
    
    func showDetails(movie: Movie) {
        router.trigger(.movieDetail(movie))
    }
    
    func fetchNextPage()  {
        let moviesArray = Movie.load(from: jsonstring).map{ movie in
            return MovieViewModal(movie: movie)
        }
        movies.accept(movies.value + moviesArray)
    }
}


fileprivate let jsonstring = """
[{
"vote_count": 3710,
"id": 268,
"video": false,
"vote_average": 7.1,
"title": "Batman",
"popularity": 15.474,
"poster_path": "/kBf3g9crrADGMc2AMAMlLBgSm2h.jpg",
"original_language": "en",
"original_title": "Batman",
"genre_ids": [14, 28],
"backdrop_path": "/2blmxp2pr4BhwQr74AdCfwgfMOb.jpg",
"adult": false,
"overview": "The Dark Knight of Gotham City begins his war on crime with his first major enemy being the clownishly homicidal Joker, who has seized control of Gotham's underworld.",
"release_date": "1989-06-23"
}, {
"vote_count": 355,
"id": 2661,
"video": false,
"vote_average": 6.2,
"title": "Batman",
"popularity": 7.887,
"poster_path": "/udDVJXtAFsQ8DimrXkVFqy4DGEQ.jpg",
"original_language": "en",
"original_title": "Batman",
"genre_ids": [10751, 12, 35, 878, 80],
"backdrop_path": "/5gcdof2PKH1emllBdN1VXU706IP.jpg",
"adult": false,
"overview": "The Dynamic Duo faces four super-villains who plan to hold the world for ransom with the help of a secret invention that instantly dehydrates people.",
"release_date": "1966-07-30"
}, {
"vote_count": 11928,
"id": 272,
"video": false,
"vote_average": 7.6,
"title": "Batman Begins",
"popularity": 28.535,
"poster_path": "/dr6x4GyyegBWtinPBzipY02J2lV.jpg",
"original_language": "en",
"original_title": "Batman Begins",
"genre_ids": [28, 80, 18],
"backdrop_path": "/9myrRcegWGGp24mpVfkD4zhUfhi.jpg",
"adult": false,
"overview": "Driven by tragedy, billionaire Bruce Wayne dedicates his life to uncovering and defeating the corruption that plagues his home, Gotham City.  Unable to work within the system, he instead creates a new identity, a symbol of fear for the criminal underworld - The Batman.",
"release_date": "2005-06-10"
}, {
"vote_count": 3110,
"id": 364,
"video": false,
"vote_average": 6.8,
"title": "Batman Returns",
"popularity": 17.251,
"poster_path": "/jX5THE1yW3zTdeD9dupcIyQvKiG.jpg",
"original_language": "en",
"original_title": "Batman Returns",
"genre_ids": [28, 14],
"backdrop_path": "/wNIE5dpkiHU2csDRptMutFjAGiV.jpg",
"adult": false,
"overview": "Having defeated the Joker, Batman now faces the Penguin - a warped and deformed individual who is intent on being accepted into Gotham society. Crooked businessman Max Schreck is coerced into helping him become Mayor of Gotham and they both attempt to expose Batman in a different light. Selina Kyle, Max's secretary, is thrown from the top of a building and is transformed into Catwoman - a mysterious figure who has the same personality disorder as Batman. Batman must attempt to clear his name, all the time deciding just what must be done with the Catwoman.",
"release_date": "1992-06-19"
}, {
"vote_count": 2598,
"id": 415,
"video": false,
"vote_average": 4.2,
"title": "Batman & Robin",
"popularity": 14.075,
"poster_path": "/79AYCcxw3kSKbhGpx1LiqaCAbwo.jpg",
"original_language": "en",
"original_title": "Batman & Robin",
"genre_ids": [878, 28, 14, 35],
"backdrop_path": "/39jbxGwfR4wHBV7apo3JiNdHDHq.jpg",
"adult": false,
"overview": "Along with crime-fighting partner Robin and new recruit Batgirl, Batman battles the dual threat of frosty genius Mr. Freeze and homicidal horticulturalist Poison Ivy. Freeze plans to put Gotham City on ice, while Ivy tries to drive a wedge between the dynamic duo.",
"release_date": "1997-06-20"
}, {
"vote_count": 2690,
"id": 414,
"video": false,
"vote_average": 5.3,
"title": "Batman Forever",
"popularity": 13.462,
"poster_path": "/eTMrHEhlFPHNxpqGwpGGTdAa0xV.jpg",
"original_language": "en",
"original_title": "Batman Forever",
"genre_ids": [28, 80, 14],
"backdrop_path": "/rI67zGyNZKa7ef8iiZN1lSJT7mp.jpg",
"adult": false,
"overview": "The Dark Knight of Gotham City confronts a dastardly duo: Two-Face and the Riddler. Formerly District Attorney Harvey Dent, Two-Face believes Batman caused the courtroom accident which left him disfigured on one side. And Edward Nygma, computer-genius and former employee of millionaire Bruce Wayne, is out to get the philanthropist; as The Riddler. Former circus acrobat Dick Grayson, his family killed by Two-Face, becomes Wayne's ward and Batman's new partner Robin.",
"release_date": "1995-06-16"
}, {
"vote_count": 857,
"id": 382322,
"video": false,
"vote_average": 6.3,
"title": "Batman: The Killing Joke",
"popularity": 28.737,
"poster_path": "/zm0ODjtfJfJW0W269LqsQl5OhJ8.jpg",
"original_language": "en",
"original_title": "Batman: The Killing Joke",
"genre_ids": [28, 16, 80, 18],
"backdrop_path": "/iYrE2zV1DfZ3l7Lh4frHzNwFncq.jpg",
"adult": false,
"overview": "As Batman hunts for the escaped Joker, the Clown Prince of Crime attacks the Gordon family to prove a diabolical point mirroring his own fall into madness.",
"release_date": "2016-07-21"
}, {
"vote_count": 267,
"id": 13851,
"video": false,
"vote_average": 6.7,
"title": "Batman: Gotham Knight",
"popularity": 25.819,
"poster_path": "/eIAhXROHG8t3QQ7qU0HfZgL5XFf.jpg",
"original_language": "en",
"original_title": "Batman: Gotham Knight",
"genre_ids": [16, 28, 12],
"backdrop_path": "/cAW1NAahXhBUFJZgicBIGPs2OkZ.jpg",
"adult": false,
"overview": "Explore Bruce Wayne's transition from his beginning as a tormented vigilantee to The Dark Knight of a crumbling metropolis with six distinct chapters but intended to be viewed as a whole.",
"release_date": "2008-07-03"
}, {
"vote_count": 14,
"id": 125249,
"video": false,
"vote_average": 6.5,
"title": "Batman",
"popularity": 2.464,
"poster_path": "/hyrAiphvDoBRJ6BPy4lLFVwZfQu.jpg",
"original_language": "en",
"original_title": "Batman",
"genre_ids": [28, 12, 80, 878, 53, 10752],
"backdrop_path": "/xEG5iP1qZCiDt4BefSpLy1d54zE.jpg",
"adult": false,
"overview": "Japanese master spy Daka operates a covert espionage-sabotage organization located in Gotham City's now-deserted Little Tokyo, which turns American scientists into pliable zombies.",
"release_date": "1943-07-16"
}]
"""
