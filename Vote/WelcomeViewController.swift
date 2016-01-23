//
//  WelcomeViewController.swift
//  Vote
//
//  Created by 孙竞 on 16/1/17.
//  Copyright © 2016年 Sun Jing. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
  
  var VoterNumber = 0
  
  @IBAction func fivevotergame(sender: UIButton) {
    Data.voter = 5 //修改为参加者5人
    Data.round = [2,3,2,3,3] //修改为5人时每轮做任务人数
    Data.v = Data.voter //过渡数与参加者相同
  }
  
  @IBAction func sixvotergame(sender: UIButton) {
    Data.voter = 6 //修改为参加者6人
    Data.round = [2,3,4,3,4] //修改为6人时每轮做任务人数
    Data.v = Data.voter //过渡数与参加者相同

  }

}
