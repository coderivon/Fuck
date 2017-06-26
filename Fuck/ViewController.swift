//
//  ViewController.swift
//  Fuck
//
//  Created by Ivon-Mac on 2017/6/22.
//  Copyright © 2017年 Ivon-Mac. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    var Player = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    var crossArray = [5]
    var noughtArray = [4]
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBAction func button1action(_ sender: Any) {
        (sender as AnyObject).setImage(UIImage(named: "Cross.png"),for:UIControlState())
    }
    // Button类型为AnyObject时可用sender.setImage(UIImage(named: "Cross.png"),for:UIControlState())来设置显示图片,类型为Any时可用(sender as AnyObject).setImage(UIImage(named: "Cross.png"),for:UIControlState()),类型为UIbutton时该命令无效
    @IBAction func button2(_ sender: Any) {
        //(sender as AnyObject).setImage(UIImage(named: "Nought.png"),for:UIControlState())
        (sender as AnyObject).setImage(UIImage(named:"Nought.png"), for:UIControlState())
    }
    
        
    
    @IBAction func action(_ sender: AnyObject)
    {
        
        
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = Player
            
            if (Player == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                Player = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                Player = 1
            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    label.text = "CROSS HAS WON!"
                }
                else
                {
                    label.text = "NOUGHT HAS WON!"
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
            }
        }
        
        //检测是否平局
        
        if gameIsActive == true
        {
            gameIsActive = false
        
            for i in gameState
            {
                if i == 0
                {
                    gameIsActive = true
                    break
                }
            }
            
            if gameIsActive == false
            {
                
                label.text = "IT WAS A DRAW"
                label.isHidden = false
                playAgainButton.isHidden = false
            }
        

        }
    }
    
    
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: AnyObject)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        Player = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

