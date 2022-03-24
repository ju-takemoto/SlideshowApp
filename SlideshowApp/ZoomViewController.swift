//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by ktec on 2022/03/25.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var zoomImage: UIImageView!
    var selectedImg: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zoomImage.image = selectedImg

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
