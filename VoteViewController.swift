//
//  VoteViewController.swift
//  Vote
//
//  Created by 孙竞 on 16/1/11.
//  Copyright © 2016年 Sun Jing. All rights reserved.
//

import UIKit

class VoteViewController: UIViewController {

  var agree = 0 //赞成票数
  var disagree = 0 //反对票数
  var voter = 6 //投票人
  
  //提示框显示结果
  func alertView(success: Bool) -> () {
    
    //判断并显示投票是否通过
    var votemessage: String {
        if success {
          return "\(agree)票赞成，\(disagree)票反对，投票通过！"
        } else {
          return "\(agree)票赞成，\(disagree)票反对，投票未通过！"
      }
    }
    //投票显示框
     let votepass = UIAlertController(title: "投票结果", message: votemessage, preferredStyle: UIAlertControllerStyle.Alert)
    votepass.addAction(UIAlertAction(
      title: "重新投票",
      style: .Cancel)
      { (action: UIAlertAction) -> Void in
        //票数归零
        self.agree = 0
        self.disagree = 0
      }
    )
    presentViewController(votepass, animated: true, completion: nil)
    
     /*let votedispass = UIAlertController(title: "投票结果", message: "\(agree)票赞成，\(disagree)票反对，投票未通过！", preferredStyle: UIAlertControllerStyle.Alert)
      votedispass.addAction(UIAlertAction(
      title: "重新投票",
      style: .Cancel)
      { (action: UIAlertAction) -> Void in
        //票数归零
        self.agree = 0
        self.disagree = 0
      }
    )
        
    if success == true {
      presentViewController(votepass, animated: true, completion: nil)
    } else {
      presentViewController(votedispass, animated: true, completion: nil)
    }*/
    
  }
  
  //判断投票结果并传递显示结果的方法
  func voteresult() {
    if agree + disagree >= voter{
      print("Vote Over，\(agree)agrees,\(disagree)disagrees")
      if agree > disagree {
        alertView(true)
      } else {
        alertView(false)
      }
    }
  }
  
  //赞成按钮
  @IBAction func Agree(sender: UIButton) {
    agree++
    print("\(agree + disagree) vote,\(agree) agree,\(disagree) disagree")
    //voteresult()
    if agree + disagree >= voter{
      print("Vote Over，\(agree)agrees,\(disagree)disagrees")
      alertView(agree > disagree)
    }

  }

  //反对按钮
  @IBAction func Disagree(sender: UIButton) {
    disagree++
    print("\(agree + disagree) vote,\(agree) agree,\(disagree) disagree")
    if agree + disagree >= voter{
      print("Vote Over，\(agree)agrees,\(disagree)disagrees")
      alertView(agree > disagree)
    }
  }
}

