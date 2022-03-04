//
//  AlbumsViewController.swift
//  LastFM
//
//  Created by wafaa farrag on 03/03/2022.
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay
import Moya

class AlbumsViewController: BaseStatefulViewController<AlbumsViewModel> {
    
    @IBOutlet weak var albumsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBinding()
        viewModel.getAlbums()
    }
    
    private func setupView() {
        albumsCollectionView.register(UINib(nibName: "AlbumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AlbumCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        let size = (albumsCollectionView.frame.size.width) / CGFloat(4)
        flowLayout.itemSize = CGSize(width: size, height: size)
        albumsCollectionView.setCollectionViewLayout(flowLayout, animated: true)

    }
    
    private func setupBinding() {
        
        viewModel.albums.bind(to: albumsCollectionView.rx.items(cellIdentifier: "AlbumCollectionViewCell", cellType: AlbumCollectionViewCell.self)) { index, model, cell in
            cell.setup(album: model)
        }.disposed(by: disposeBag)
         
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AlbumDetailsViewController") as! AlbumDetailsViewController
        albumsCollectionView.rx.modelSelected(Album.self).subscribe(onNext: { album in
            let provider = MoyaProvider<ArtistsAlbumsAPI>()
            vc.viewModel = AlbumDetailsViewModel(api: provider)
            vc.viewModel.album.accept(album)
            self.navigationController?.pushViewController( vc, animated: true)
        }).disposed(by: disposeBag)
    }

}
