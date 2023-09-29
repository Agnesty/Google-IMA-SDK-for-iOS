//
//  ViewController.swift
//  Google IMA SDK for iOS
//
//  Created by Agnes Triselia Yudia on 29/09/23.
//

import AVFoundation
import GoogleInteractiveMediaAds
import UIKit

class ViewController: UIViewController {
    
    var videos: NSArray!
    var adsLoader: IMAAdsLoader?
    var language = "en"
    
    //MARK: IBOutlet
    @IBOutlet weak var adsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVideos()
        setUpAdsLoader()
        
        // For PiP.
        do {
            try AVAudioSession.sharedInstance().setActive(true)
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback, options: [])
        } catch {
            NSLog("Error setting background playback - PiP will not work.")
        }
        
    }
    
    //MARK: IBAction
    @IBAction func adsAction(_ sender: UIButton) {
        let video = videos[0] as! Video
        guard let headedTo = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VideoViewController") as? VideoViewController else { return }
        headedTo.video = video
        headedTo.adsLoader = adsLoader
        navigationController?.pushViewController(headedTo, animated: true)
    }
    
    //MARK: Function
    // Populate the video array.
    func initVideos() {
      let bipThumbnail = UIImage(named: "bip.png")

      videos = [
        Video(
          title: "AdSense",
          thumbnail: bipThumbnail,
          video: kBipBopContentPath,
          tag: kAdSenseTag)
      ]
    }
    
    func setUpAdsLoader() {
      if adsLoader != nil {
        adsLoader = nil
      }
      let settings = IMASettings()
      settings.language = language
      settings.enableBackgroundPlayback = true
      adsLoader = IMAAdsLoader(settings: settings)
    }
}



