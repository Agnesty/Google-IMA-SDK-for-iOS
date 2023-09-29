//
//  Video.swift
//  Google IMA SDK for iOS
//
//  Created by Agnes Triselia Yudia on 29/09/23.
//

import Foundation
import UIKit

class Video: NSObject {

  // The title of the video.
  var title: String

  // The thumbnail for the video list.
  var thumbnail: UIImage

  // The URL for the video media file.
  var video: String

  //The URL for the VAST response.
  var tag: String

  // Returns an initialized video.
  init(title: String, thumbnail: UIImage!, video: String, tag: String) {
    self.title = title
    self.thumbnail = thumbnail
    self.video = video
    self.tag = tag
  }

}
