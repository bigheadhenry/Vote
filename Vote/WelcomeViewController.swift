//
//  WelcomeViewController.swift
//  Vote
//
//  Created by 孙竞 on 16/1/17.
//  Copyright © 2016年 Sun Jing. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, VoterNumberDataSource {
  
  var VoterNumber = 0
  
  @IBAction func fivevotergame(sender: UIButton) {
    VoterNumber = 5
  }
  
  func SetVoterNumber(sender: VoteViewController) -> Int? {
    print("\(VoterNumber)")
    return VoterNumber
  }

}
