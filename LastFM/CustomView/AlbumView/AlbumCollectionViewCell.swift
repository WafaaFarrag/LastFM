//
//  AlbumCollectionViewCell.swift
//  LastFM
//
//  Created by wafaa farrag on 03/03/2022.
//

import UIKit
import Kingfisher

class AlbumCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    
    func  setup(album: Album) {
        albumName.text = album.name
        if let url = URL(string: album.image[2].text) {
            imageView.kf.setImage(with: url)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
