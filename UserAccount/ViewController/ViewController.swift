//
//  ViewController.swift
//  UserAccount
//
//  Created by Hamed Amiry on 26.08.2021.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?

    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var login: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElement()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        setupvideo()
    }
    
    
    func  setUpElement() {
        
        Utilities.styleFilledButton(signUp)
        Utilities.styleFilledButton(login)
        
    }
    
    func setupvideo() {
        
        // get the paath to the resource it the bundle
       let bundlePath =  Bundle.main.path(forResource: "video3", ofType: "mp4")
        guard bundlePath != nil else {return}

        
        // create a url from it
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        // create the viedo palayer item
        
        let item =  AVPlayerItem(url: url)
        
        // create the player
        
        videoPlayer  = AVPlayer(playerItem: item)
       

        
        // create the layer
        
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        
        // adjust the size and frame
    
        
       // videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
   

      

        videoPlayerLayer?.frame = self.view.bounds
        videoPlayerLayer?.videoGravity = .resizeAspectFill
      
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // add it to the view and play it
        videoPlayer?.play()
        
      //  videoPlayer?.playImmediately(atRate: 1)
        
    }
        



}

