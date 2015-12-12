
import Foundation
import UIKit
import AVFoundation

class VideoView: UIView {
  
  var videoURL = NSURL()
  var muted = true
  
  private let tapForSoundTextNode = ASTextNode()
  
  var player: AVPlayer {
    let playerLayer = layer as! AVPlayerLayer
    if playerLayer.player == nil {
      let playerItem = AVPlayerItem(URL: videoURL)
      
      playerLayer.player = AVPlayer(playerItem: playerItem)
      playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
      
      playerLayer.player!.actionAtItemEnd = .None
      
      NSNotificationCenter.defaultCenter().addObserver(self,
        selector: "restartVideoFromBeginning:",
        name: AVPlayerItemDidPlayToEndTimeNotification,
        object: playerItem)
      playerLayer.player?.volume = 0.0
    }
    return playerLayer.player!
  }
  
  override class func layerClass() -> AnyClass {
    return AVPlayerLayer.self
  }
  
  init(videoURL: NSURL) {
    self.videoURL = videoURL
    
    self.tapForSoundTextNode.attributedString = NSAttributedString(string: "TAP VIDEO FOR SOUND", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor(), NSBackgroundColorAttributeName: UIColor.blackColor(), NSFontAttributeName: UIFont.systemFontOfSize(10, weight: UIFontWeightThin)])
    self.tapForSoundTextNode.measure(UIScreen.mainScreen().bounds.size)
    
    super.init(frame: CGRectZero)
    
    clipsToBounds = true
    
    let tap = UITapGestureRecognizer(target: self, action: "tapped")
    addGestureRecognizer(tap)
    
    addSubview(tapForSoundTextNode.view)
  }
  
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    tapForSoundTextNode.bounds.size = tapForSoundTextNode.calculatedSize
    tapForSoundTextNode.position = CGPoint(x: tapForSoundTextNode.bounds.width/2, y: bounds.height - tapForSoundTextNode.bounds.height/2)
  }
  
  func restartVideoFromBeginning(notification: NSNotification) {
    player.seekToTime(CMTime(seconds: 0, preferredTimescale: 1))
  }
  
  func tapped() {
    if muted {
      muted = false
      player.volume = 1.0
      UIView.animateWithDuration(0.15, animations: {
        self.tapForSoundTextNode.alpha = 0.0
      })
    } else {
      muted = true
      player.volume = 0.0
      UIView.animateWithDuration(0.15, animations: {
        self.tapForSoundTextNode.alpha = 1.0
      })
    }
  }
  
  func play() {
    player.play()
  }
  
  func pause() {
    player.pause()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
