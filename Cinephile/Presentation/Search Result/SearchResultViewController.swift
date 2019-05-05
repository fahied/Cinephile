//
//  FirstViewController.swift
//  Cinephile
//
//  Created by Muhammad Fahied on 5/4/19.
//  Copyright © 2019 Spider. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchResultViewController: UIViewController, BindableType {
    var viewModel: SearchResultViewModel!
    private let disposeBag = DisposeBag()
    private var runOnce = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.registerCell(type: MovieCollectionViewCell.self)
        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
        if runOnce { return }
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = true
        navigationItem.searchController = searchController
        
        searchController.searchBar.rx.value
            .skip(1)
            .throttle(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] text in
                guard let strongSelf = self else {
                    return
                }
                
                if text?.count == 0 {
//                    strongSelf.viewModel.reset()
                } else {
//                    strongSelf.viewModel.search(forMovies: text!)
                }
            } )
            .disposed(by: disposeBag)
        
        searchController.searchBar.rx.textDidEndEditing.subscribe(onNext: { [weak self] in
            guard let `self` = self else { return }
            
//            strongSelf.viewModel.reset()
        })
            .disposed(by: disposeBag)
        runOnce = true
    }
    
    func bindViewModel() {
        let nibId = MovieCollectionViewCell.nibIdentifier
        let cellType = MovieCollectionViewCell.self
        viewModel.movies
            .bind(to: collectionView.rx.items(cellIdentifier: nibId, cellType: cellType)) { (_, movie, cell) in
//                cell.poster.kf.setImage(with: movie.posterUrl)
                cell.poster.load(url: movie.posterUrl!)
                cell.title.text = movie.title
                cell.score.text = "Popularity score: " + movie.popularity
                cell.year.text = "Year: " + movie.releaseYear
            }
            .disposed(by: disposeBag)
        
        collectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                guard let strongSelf = self else {
                    return
                }
                
//                strongSelf.viewModel.showDetails(for: indexPath.item)
            } )
            .disposed(by: disposeBag)
    }
    
}

// MARK: - Collection View Delegate Flow Layout

extension SearchResultViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize()
    }
    
    private func itemSize() -> CGSize {
        let numberOfColumns = CGFloat(2)
        let minimumInteritemSpacing = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout)
            .minimumInteritemSpacing
        let itemSize = floor((UIScreen.main.bounds.width - ((numberOfColumns - 1) *  minimumInteritemSpacing)) /
            numberOfColumns)
        return CGSize(width: itemSize, height: itemSize * 1.5)
    }
}

// MARK: - Collection View Delegate

extension SearchResultViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
//        if indexPath.item  == viewModel.movies.value.count  - 1 {
////            viewModel.fetchNextPage()
//        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
