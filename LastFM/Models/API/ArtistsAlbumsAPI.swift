//
//  ArtistsAlbumsAPI.swift
//  LastFM
//
//  Created by wafaa farrag on 03/03/2022.
//

import Moya

//"?method=artist.search&artist=cher&api_key=YOUR_API_KEY&format=json"
//?method=artist.gettopalbums&artist=cher&api_key=YOUR_API_KEY&format=json
//method=album.getinfo&api_key=YOUR_API_KEY&artist=Cher&album=Believe&format=json
enum ArtistsAlbumsAPI {
    case artistsSearch(String)
    case getTopAlbumsFor(artist:String)
    case getAlbumDetails(artist: String,albumName: String)
}

extension ArtistsAlbumsAPI: TargetType {
    var baseURL: URL {
            return URL(string: base_URL)!
    }
    
    var path: String {
        switch self {
        case .artistsSearch,.getTopAlbumsFor,.getAlbumDetails:
        return ""
       
        }
       
    }
    
    var method: Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .artistsSearch(let artist):
        return .requestParameters(parameters: ["method": "artist.search", "artist": "\(artist)","api_key": "\(API_Key)","format": "json"], encoding: URLEncoding.default)
        case .getTopAlbumsFor(artist: let artist ):
        return .requestParameters(parameters: ["method": "artist.gettopalbums", "artist": "\(artist)","api_key": "\(API_Key)","format": "json"], encoding: URLEncoding.default)
        case .getAlbumDetails(artist: let artist, albumName: let name):
            return .requestParameters(parameters: ["method": "album.getinfo", "artist": "\(artist)", "album":"\(name)", "api_key":"\(API_Key)", "format": "json"], encoding: URLEncoding.default)

        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var sampleData: Data {
        return """
            
            """.data(using: .utf8)!
    }
    
    var validate: Bool { // Treat non 2XX response codes as error (onError)
        return true
    }
}
