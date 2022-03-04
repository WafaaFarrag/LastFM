//
//  AlbumDetailsViewController.swift
//  LastFM
//
//  Created by wafaa farrag on 03/03/2022.
//

import UIKit
import Moya

class AlbumDetailsViewController: BaseViewController<AlbumDetailsViewModel> {
    @IBOutlet weak var albumName: UILabel!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        setupView()
        setupBinding()
    }
    
    func  setupView()  {
        
    }
    
    func setupBinding() {
        albumName.text = viewModel.album.value.name
        
    }
}
