//
//  ArtistsViewController.swift
//  LastFM
//
//  Created by wafaa farrag on 03/03/2022.
//

import UIKit
import Moya

class ArtistsViewController: BaseStatefulViewController<ArtistsViewModel> {
    
    @IBOutlet weak var artistsTableView: UITableView!
    
    override func viewDidLoad() {
        let provider = MoyaProvider<ArtistsAlbumsAPI>()
        viewModel = ArtistsViewModel(api: provider)
        super.viewDidLoad()
        setupView()
        setupBinding()
        viewModel.getArtists(artistName: "jackson")
        
    }
    
    private func setupView() {
        artistsTableView.register(UINib(nibName: "ArtistTableViewCell", bundle: nil), forCellReuseIdentifier: "ArtistTableViewCell")
    
    }
    
    private func setupBinding() {
        
        viewModel.artists.bind(to: artistsTableView.rx.items(cellIdentifier: "ArtistTableViewCell", cellType: ArtistTableViewCell.self)){ index, model, cell in
            
            cell.setup(artist: model)
        }.disposed(by: disposeBag)
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AlbumsViewController") as! AlbumsViewController
        artistsTableView.rx.modelSelected(ArtistClass.self).subscribe(onNext: { artist in
            let provider = MoyaProvider<ArtistsAlbumsAPI>()
            vc.viewModel = AlbumsViewModel(api: provider, artist: artist)
            self.navigationController?.pushViewController( vc, animated: true)
        }).disposed(by: disposeBag)
    }
    
}
