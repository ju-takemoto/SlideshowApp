//
//  ViewController.swift
//  SlideshowApp
//
//  Created by ktec on 2022/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var nowIndex:Int = 0
    
    var timer: Timer!
    
    var imageArray:[UIImage] = [
            UIImage(named: "IMG_01")!,
            UIImage(named: "IMG_02")!,
            UIImage(named: "IMG_03")!
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func slideShowButton(_ sender: Any) {
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:#selector(changeImage), userInfo: nil, repeats: true)
            playButton.setTitle("停止", for: .normal)

            // 次へボタンを押せないようにする
            goButton.isEnabled = false
            backButton.isEnabled = false
        } else {
            timer.invalidate()
            timer = nil
            playButton.setTitle("再生", for: .normal)

            // 次へボタンを押せるようにする
            goButton.isEnabled = true
            backButton.isEnabled = true
        }
    }

    @objc func changeImage() {
        showNextImage()
    }
    
    @IBAction func goShowButton(_ sender: Any) {
        showNextImage()
    }
    
    func showNextImage() {
        nowIndex += 1
        if (nowIndex == imageArray.count) {
          nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func backShowButton(_ sender: Any) {
        showBackImage()
    }
    
    func showBackImage() {
        nowIndex -= 1
        if (0 > nowIndex) {
          nowIndex = 2
        }
        imageView.image = imageArray[nowIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let zoomViewController: ZoomViewController
             = segue.destination as! ZoomViewController

        zoomViewController.selectedImg = imageArray[nowIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }
        
}
