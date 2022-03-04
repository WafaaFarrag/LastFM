//
//  AlbumsViewModel.swift
//  LastFM
//
//  Created by wafaa farrag on 03/03/2022.
//

import Foundation
import RxCocoa
import Moya
import RxSwift
import RxCocoa
import Moya_ModelMapper

class AlbumsViewModel: BaseStatefulViewModel {
    
    var api: MoyaProvider<ArtistsAlbumsAPI>
    var albums = BehaviorRelay<[Album]>(value: [])
    var artist: ArtistClass
    
    init(api: MoyaProvider<ArtistsAlbumsAPI>, artist: ArtistClass) {
        self.api = api
        self.artist = artist
    }
    
    func  getAlbums()  {
        self.sendStatefulViewControllerEvent(hasContent: false, state: (true, nil ))
        api.rx.request(.getTopAlbumsFor(artist: artist.name)).map([Album].self, atKeyPath: "topalbums.album").subscribeWithDefaultErrorHandling(onSuccess: { [weak self] albums in
                    self?.sendStatefulViewControllerEvent(hasContent: true, state: (false, nil))
                    self?.albums.accept(albums)
            }, onError: { [weak self] error in
                self?.sendStatefulViewControllerEvent(hasContent: false, state: (false, error ))
            }, viewModel: self, errorMessageSize: .large).disposed(by: disposeBag)
    }
}
