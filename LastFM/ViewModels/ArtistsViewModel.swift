//
//  ArtistsViewModel.swift
//  LastFM
//
//  Created by wafaa farrag on 03/03/2022.
//

import Foundation
import Moya
import RxCocoa

class ArtistsViewModel: BaseStatefulViewModel {
    
    
    var api: MoyaProvider<ArtistsAlbumsAPI>
    var artists = BehaviorRelay<[ArtistClass]>(value: [])
    
    init(api: MoyaProvider<ArtistsAlbumsAPI>) {
        self.api = api
    }
    
    func  getArtists(artistName: String)  {
        self.sendStatefulViewControllerEvent(hasContent: false, state: (true, nil ))
        api.rx.request(.artistsSearch(artistName)).map([ArtistClass].self, atKeyPath: "results.artistmatches.artist").subscribeWithDefaultErrorHandling(onSuccess: { [weak self] artists in
                    self?.sendStatefulViewControllerEvent(hasContent: true, state: (false, nil))
                    self?.artists.accept(artists)
            }, onError: { [weak self] error in
                self?.sendStatefulViewControllerEvent(hasContent: false, state: (false, error ))
            }, viewModel: self, errorMessageSize: .large).disposed(by: disposeBag)
    }
}
