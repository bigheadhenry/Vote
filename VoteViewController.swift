//
//  VoteViewController.swift
//  Vote
//
//  Created by 孙竞 on 16/1/11.
//  Copyright © 2016年 Sun Jing. All rights reserved.
//

import UIKit

class VoteViewController: UIViewController {

  var agree = 0
  var disagree = 0
  
  func alertView(success: Bool) -> () {
    let votepass = UIAlertController(title: "投票结果", message: "\(agree)票赞成，\(disagree)票反对，投票通过！", preferredStyle: UIAlertControllerStyle.Alert)
    votepass.addAction(UIAlertAction(
      title: "重新投票",
      style: .Cancel)
      { (action: UIAlertAction) -> Void in
        self.agree = 0
        self.disagree = 0
      }
    )
    
    let votedispass = UIAlertController(title: "投票结果", message: "\(agree)票赞成，\(disagree)票反对，投票未通过！", preferredStyle: UIAlertControllerStyle.Alert)
      votedispass.addAction(UIAlertAction(
      title: "重新投票",
      style: .Cancel)
      { (action: UIAlertAction) -> Void in
        self.agree = 0
        self.disagree = 0
      }
    )
        
    if success == true {
      presentViewController(votepass, animated: true, completion: nil)
    } else {
      presentViewController(votedispass, animated: true, completion: nil)
    }
  }
  
  @IBAction func Agree(sender: UIButton) {
    agree++
    print("\(agree + disagree) vote,\(agree) agree,\(disagree) disagree")
    if agree + disagree >= 6 {
      print("Vote Over，\(agree)agrees,\(disagree)disagrees")
    alertView(true)
    }
  }

  @IBAction func Disagree(sender: UIButton) {
    disagree++
    print("\(agree + disagree) vote,\(agree) agree,\(disagree) disagree")
    if agree + disagree >= 6 {
      print("Vote Over，\(agree)agrees,\(disagree)disagrees")
      alertView(false)

    }

  }
}
