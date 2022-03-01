//
//  ScreenUpViewController.swift
//  SlideshowApp
//
//  Created by Kusanagi Shuichi on 2022/02/18.
//

import UIKit

class ScreenUpViewController: UIViewController {
    
    @IBOutlet weak var imageView2: UIImageView!
    var selectedImg: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView2.image = selectedImg
        
    }
    
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        
        imageView2.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        
    }
    
    
    

    //戻るボタン
    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

}
