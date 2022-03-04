//
//  AlbumDetailsViewModel.swift
//  LastFM
//
//  Created by wafaa farrag on 03/03/2022.
//

import Foundation
import RxCocoa
import Moya

class AlbumDetailsViewModel: BaseViewModel {
    
    var album = BehaviorRelay<Album>(value: Album(name: "", playcount: 0, mbid: nil, url: "", artist: ArtistClass.init(name: "", mbid: "", url: ""), image: [Image(text: "", size: Size.medium)]) )
    
    var api: MoyaProvider<ArtistsAlbumsAPI>
    
    init(api: MoyaProvider<ArtistsAlbumsAPI>) {
        self.api = api
    }
}
