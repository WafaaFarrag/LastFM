//
//import Mapper
//
//// MARK: - Album
//struct Album: Mappable {
//    let name: String
//    let playcount: Int
//    let url: String
//    let artist: Artist
//    let image: [Image]
//
//    init(map: Mapper) throws {
//        try name = map.from("name")
//        try playcount = map.from("playcount")
//        try url = map.from("url")
//        try artist = map.from("artist")
//        try image = map.from("image")
//
//    }
//
//}
//
//// MARK: - Artist
//struct Artist: Mappable {
//
//    let name: String
//    let mbid: String
//    let url: String
//
//    init(map: Mapper) throws {
//        try name = map.from("name")
//        try mbid = map.from("mbid")
//        try url = map.from("url")
//
//    }
//}
//
//
//// MARK: - Image
//struct Image: Mappable {
//    let text: String
//   // let size: Size
//
//    init(map: Mapper) throws {
//        try text = map.from("text")
//       // try size = map.from("size")
//
//    }
//}
//
//enum Size: String,Mappable {
//
//    case extralarge = "extralarge"
//    case large = "large"
//    case medium = "medium"
//    case small = "small"
//
//    init(map: Mapper) throws {
//
//    }
//}


import Foundation

// MARK: - Album
struct Album: Codable {
    let name: String
    let playcount: Int
    let mbid: String?
    let url: String
    let artist: ArtistClass
    let image: [Image]
}

// MARK: - ArtistClass
struct ArtistClass: Codable {
    let name: String
    let mbid: String
    let url: String
}


// MARK: - Image
struct Image: Codable {
    let text: String
    let size: Size

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}

enum Size: String, Codable {
    case extralarge = "extralarge"
    case large = "large"
    case medium = "medium"
    case small = "small"
}
