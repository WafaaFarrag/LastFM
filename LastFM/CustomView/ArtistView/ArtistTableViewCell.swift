//
//  ArtistTableViewCell.swift
//  LastFM
//
//  Created by wafaa farrag on 03/03/2022.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var artistName: UILabel!
    
    func  setup(artist: ArtistClass) {
        artistName.text = artist.name
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
