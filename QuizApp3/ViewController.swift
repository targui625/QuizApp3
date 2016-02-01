//
//  ViewController.swift
//  QuizApp3
//
//  Created by Norimichi Takagi on 2016/01/29.
//  Copyright © 2016年 NorimichiTakagi. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var num = 1
    var qNum = 10
    var gradingArray = [0,10,20,30,40,50]
    var score = 0
    var sumNum = 0
    var player:AVAudioPlayer!
    
    @IBOutlet weak var qNumLabel:UILabel!
    @IBOutlet weak var questionText:UITextView!
    @IBOutlet weak var answerLabel:UILabel!
    @IBOutlet weak var startReset:UIButton!
    @IBOutlet weak var maruBt:UIButton!
    @IBOutlet weak var batuBt:UIButton!
    @IBOutlet weak var bgImage:UIImageView!
    

    @IBAction func startAction(){
        // スコアや問題の初期化
        num = 0
        qNum = 10
        score = 0
        
        // スタートボタンをリセットボタンに
        startReset.setTitle("RESET",forState:UIControlState.Normal)
        startReset.backgroundColor = UIColor .blueColor()
        startReset.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        questionView()
    }
    
    //問題文の入れ替え
        func questionView(){
            appearBt()
            if(qNum < 20){
                qNumLabel.text = "問１"
                questionText.text = "我が社の代表は”世一英仁”である"
            }
            else if(qNum < 30){
                qNumLabel.text = "問２"
                questionText.text = "マネージャーは全部で”４人”いる" }
            else if(qNum < 40){
                qNumLabel.text = "問３"
                 questionText.text = "ディビジョンは全部で”５つ”ある"}
            else if(qNum < 50){
                qNumLabel.text = "問４"
                 questionText.text = "2015年の社員旅行は”11月の沖縄”だった"}
            else if(qNum < 60){
                qNumLabel.text = "問５"
                 questionText.text =  "”マーケティングディビジョン”が存在していた時期がある"}
                // 解答終了後
            else{
                qNumLabel.text = "結果発表"
                 questionText.text = "あなたの正解率は\(CLong(score))％です!"
                hideBt()
        }
            questionText.font = UIFont.systemFontOfSize(CGFloat(30))
            questionText .textAlignment = NSTextAlignment.Center
    }
 override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //問題の判定 1ならマル、２ならバツが正解
        gradingArray[1] += 1
        gradingArray[2] += 2
        gradingArray[3] += 2
        gradingArray[4] += 1
        gradingArray[5] += 1
    
    maruBt.hidden = true
    batuBt.hidden = true
    }
    
    
    //解答情報を変数に代入
    @IBAction func maruAction()
    {
        num = 1;
        answer()
    }
    @IBAction func batuAction()
    {
        num = 2;
        answer()
    }
    
            
    func answer()
    {
        hideBt()
        
        sumNum = qNum + num
        
        if (sumNum == gradingArray[1] || sumNum == gradingArray[2] || sumNum == gradingArray[3] || sumNum == gradingArray[4] || sumNum == gradingArray[5] )
            {
                answerLabel.text = "正解"
                answerLabel.backgroundColor = UIColor.orangeColor()
                score += 20;
                playSoundRight()
            }
            
        else
        {
            answerLabel.text = "不正解"
            answerLabel.backgroundColor = UIColor.blueColor()
            playSoundWrong()
        }
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("nextQ:"), userInfo: nil, repeats: false)
    }

    func nextQ(timer: NSTimer)
    {
        qNum += 10
        questionView()
        // 正解表示リセット
        answerLabel.text = ""
        answerLabel.backgroundColor = UIColor.clearColor()
    }
    
    func playSoundRight()
    {
       let soundPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("right", ofType: "mp3")!)
       player = try! AVAudioPlayer(contentsOfURL:soundPath)
        player.play()
    }
    
    func playSoundWrong()
    {
        let soundPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("wrong", ofType: "mp3")!)
        player = try! AVAudioPlayer(contentsOfURL:soundPath)
        player.play()
    }
    
    func hideBt()
    {
        maruBt.hidden = true
        batuBt.hidden = true
    }
    func appearBt()
    {
        maruBt.hidden = false
        batuBt.hidden = false
    }
    
   
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

