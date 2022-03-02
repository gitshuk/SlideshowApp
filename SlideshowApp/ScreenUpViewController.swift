//
//  ScreenUpViewController.swift
//  SlideshowApp
//
//  Created by Kusanagi Shuichi on 2022/02/18.
//

import UIKit

class ScreenUpViewController: UIViewController {
    
    @IBOutlet weak var imageView2: UIImageView!
    
    //受け取り変数
    var selectedImg: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //遷移先から受け取った画像を表示
        imageView2.image = selectedImg
        
    }
    
    
    //画像を拡大、縮小する
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        
        imageView2.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        
    }
    

    //戻るボタン
    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

}
