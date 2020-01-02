//
//  ViewController.swift
//  0102friendsQuestions
//
//  Created by 蔡家雯 on 2020/1/2.
//  Copyright © 2020 lesley tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Qnas[]的量
    var index = 0
    //分數
    var score = 0
    //答案
    var rightAnswer = ""
    
    //題目內容存放
    var questionsInformation = [Qnas(question: "六人行中的咖啡店叫什麼名字？", option: ["Central Perk", "New York Park","Central Park","South park"], answer: "Central Perk"),
        Qnas(question: "六人在咖啡店中固定座沙發是什麼顏色？", option: ["紫色", "橘色","藍色","黃色"], answer: "橘色"),
        Qnas(question: "此劇主題曲名稱是？", option: ["I ll Be There for You", "I ll Be Missing You ","I ll Never Love Again","I ll show you"], answer: "I ll Be There for You"),
        Qnas(question: "劇中角色 Chandler 和 Joey 的寵物是？", option: ["狗與貓", "兔與鼠","雞與鴨","烏龜與蜥蜴"], answer: "雞與鴨"),
        Qnas(question: "劇中角色 Ross Geller 離了幾次婚？", option: ["1 次", "2 次","3 次","4 次"], answer: "3 次"),
        Qnas(question: "以下明星誰沒有客串過六人行？", option: ["布萊德彼特", "布魯斯威利","蓋瑞歐德曼","湯姆克魯斯"], answer: "湯姆克魯斯"),
        Qnas(question: "劇中角色 Phoebe 擅長的樂器是?", option: ["鋼琴", "小提琴","吉他","打鼓"], answer: "吉他"),
        Qnas(question: "劇中角色 Joey 的職業是?", option: ["醫生", "廚師","演員","服飾店員"], answer: "演員"),
        Qnas(question: "劇中角色 Rachel 初登場的打扮是？", option: ["空姐制服", "婚紗","西裝","吉祥物裝扮"], answer: "婚紗"),
        Qnas(question: "六人行從何時撥出到結束？", option: ["1994-2004", "1996-2006","1998-2008","2000 -2010"], answer: "1994-2004")]
    
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet var optionBtn: [UIButton]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //一開始題目與分數的label顯示
        scoreLabel.text = String("分數: \(score)分")
        questionNumberLabel.text = String("第 \(index)題")
        //題目每次隨機
        questionsInformation.shuffle()
        playGame()
    }
    
    //問題Label、答案label、選項的顯示動作設定
    func playGame(){
        //讓問題label text出上面array中的問題內容文字
        questionTextLabel.text = questionsInformation[index].question
        //將array中的答案內容文字放入 rightanswer 中
        rightAnswer = questionsInformation[index].answer
        //按鈕button選項隨機
        questionsInformation[index].option.shuffle()
        // 將index中的選項內容設定給button（設定 button 的文字 .setTitle)
        for i in 0...3{
            optionBtn[i].setTitle(questionsInformation[index].option[i], for: UIControl.State.normal)
        }
        
    }

    @IBAction func optionPressBtn(_ sender: UIButton) {
        index = index + 1
        //if 按鈕上的文字等於正確答案
        if sender.currentTitle == rightAnswer{
            score = score + 10
            scoreLabel.text = String("分數: \(score)分")
        }
        if index == 10{
            //生出一個alert
            let alertController = UIAlertController(
                title: "遊戲結束",
                message: "獲得: \(score)分",
                preferredStyle: .alert)
                //參數 preferredStyle 傳入 .alert 將顯示中間彈出視窗
                //利用 UIAlertAction 生成視窗上顯示的按鈕
            let okButton = UIAlertAction(
                title: "確定",
                style: .default
            )
                
            //利用 addAction 加入按鈕。若呼叫多次 addAction，即可加入多個按鈕。
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)
        }else{
            questionNumberLabel.text = "第" + String(index + 1) + "題"
            playGame()
        }
        
    }
    @IBAction func restartPressBtn(_ sender: UIButton) {
        index = 0
        score = 0
        questionNumberLabel.text = String("第 \(index)題")
        scoreLabel.text = String("分數: \(score)分")
        questionsInformation.shuffle()
        playGame()
    }
    

    
}

