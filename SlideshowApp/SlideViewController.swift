//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Kusanagi Shuichi on 2022/02/18.
//

import UIKit

class SlideViewController: UIViewController {
    
    //イメージビュー
    @IBOutlet weak var imageView: UIImageView!
        
    //ボタン
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    
    //タイマー
    var timer: Timer!
    
    //画像を格納する配列
    let imageArray = [
        UIImage(named: "0"),
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3")
    ]
    
    //配列に指定するindex番号
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    

    //進むボタン
    @IBAction func start(_ sender: Any) {
        
        //画像を手動で進める
        if imageIndex == 0 {
            
            imageIndex = 1
            
        } else if imageIndex == 1 {
            
            imageIndex = 2
            
        } else if imageIndex == 2 {
            
            imageIndex = 3
            
        } else if imageIndex == 3 {
            
            imageIndex = 0
            
        }
        
        imageView.image = imageArray[imageIndex]
        
        
        
    }
    
    //戻るボタン
    @IBAction func reset(_ sender: Any) {
        
        //画像を手動で戻る
        if imageIndex == 0 {
            
            imageIndex = 3
            
        } else if imageIndex == 1 {
            
            imageIndex = 0
            
        } else if imageIndex == 2 {
            
            imageIndex = 1
            
        } else if imageIndex == 3 {
            
            imageIndex = 2
            
        }
        
        imageView.image = imageArray[imageIndex]
        
    }
    
    
    //タイマー
    @objc func updateTimer(_ timer: Timer) {
        
        imageIndex += 1
        
        if (imageIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            imageIndex = 0
        }
        
        imageView.image = imageArray[imageIndex]
        
    }
    
    
    //再生/停止ボタン
    @IBAction func pouse(_ sender: Any) {
        
        //名前：再生ボタン
        yellowButton.setTitle("再生", for: .normal)
        
        //再生されたら、ピンク色にする
        yellowButton.tintColor = .systemPink
        
        //再生されたら、その他のボタンを押せなくする
        blueButton.isEnabled = false
        redButton.isEnabled = false
        
        if (timer == nil) {
            
            // 再生時の処理を実装
            // タイマーをセット
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)


        } else {
            
            //名前：停止ボタン
            yellowButton.setTitle("停止", for: .normal)
            
            //停止されたら、白に戻す
            yellowButton.tintColor = .white
            
            //停止されたら、その他のボタンを押せるようにする
            blueButton.isEnabled = true
            redButton.isEnabled = true
            
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            //タイマーを削除しておく
            timer = nil

        }
        

    }
    
    
    //画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        //segueのIDを確認して特定のsegueのときのみ動作させる
        if segue.identifier == "zoom" {

            //遷移先のViewControllerを取得
            let next = segue.destination as? ScreenUpViewController
            //用意した遷移先の変数に値を渡す
            next?.selectedImg = self.imageView.image
            
        }
        
    }
    
    
    //画像をタップ
    @IBAction func tap(_ sender: Any) {
        
        performSegue(withIdentifier: "zoom", sender: nil)
    

    }
    
    
    
    //画像をタップすると画面を遷移させ、拡大画像と戻るボタンを表示させてください
    //戻るボタンがタップされると、スライドショー画面に戻り、同じ画像を表示してください
    //Auto Layoutを使用して、iPhone 8, iPhone 8 Plus, iPhone 13 mini, iPhone 13 Pro Maxの各画面サイズでレイアウトが崩れないようにしてください
}
