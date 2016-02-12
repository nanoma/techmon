//
//  BattleViewController.swift
//  techmon
//
//  Created by 花田奈々 on 2016/02/12.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit
import AVFoundation

class BattleViewController: UIViewController, AVAudioPlayerDelegate {
    
    var stamina: Float = 0
    var staminaTimer: NSTimer!
    var util: TechDraUtility!
    var player: Player!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var staminaBar: UIProgressView!
    @IBOutlet var levelLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //プログラムの初期設定
        player = Player()
        
        staminaBar.transform = CGAffineTransformMakeScale(1.0, 4.0)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var level: Int = userDefaults.integerForKey("level")
        
        nameLabel.text = player.name
        levelLabel.text = String(format: "Lv. %d", level + 1)
        stamina = 100
        
        util = TechDraUtility()
        cureStamina()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        util.playBGM("lobby")
    }
    
    override func viewWillDisappear(animated: Bool) {
        util.stopBGM()
    }
    
    //MARK : Cure　スタミナの回復
    func cureStamina(){
        staminaTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateStaminaValue",
        userInfo:  nil, repeats: true)
        staminaTimer.fire()
    }
    
    func updateDtaminaValue(){
        if stamina <= 100{
            stamina = stamina + 1
            staminaBar.progress = stamina / 100
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
