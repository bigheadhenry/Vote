//
//  VoteViewController.swift
//  Vote
//
//  Created by 孙竞 on 16/1/11.
//  Copyright © 2016年 Sun Jing. All rights reserved.
//

import UIKit

class VoteViewController: UIViewController {
  
  //提示框显示结果
  func alertView(success: Bool) -> () {
    
    //判断并显示投票是否通过
    var votemessage: String {
        if success {
          return "\(Data.agree)票赞成，\(Data.disagree)票反对，通过！"
        } else {
          Data.ifmission = true
          return "\(Data.agree)票赞成，\(Data.disagree)票反对，未通过！"
      }
    }
    
    //判断是投票还是做任务
    var titlemessage: String {
      if Data.ifmission == false {
        return "第\(Data.whichround)轮投票结果"
      } else {
        return "第\(Data.whichround - 1)轮做任务结果"
      }
    }
    //投票显示框
     let votepass = UIAlertController(title: titlemessage, message: votemessage, preferredStyle: UIAlertControllerStyle.Alert)
    votepass.addAction(UIAlertAction(
      title: "重新投票",
      style: .Cancel)
      { (action: UIAlertAction) -> Void in
        Data.agree = 0
        Data.disagree = 0
        self.VoteMessageLabel.text = "已经有\(Data.agree + Data.disagree)人投过票"
      }
    )
    presentViewController(votepass, animated: true, completion: nil)
    
    //改变投票人数，进入做任务阶段
    if Data.ifmission == false {
      Data.voter = Data.round[Data.whichround - 1]
      Data.whichround++
      Data.ifmission = !Data.ifmission
      print("\(Data.ifmission)")
    } else if Data.ifmission == true {
      Data.voter = Data.v
      Data.ifmission = !Data.ifmission
      print("\(Data.ifmission)")
    }
  }
  
  //判断投票结果并传递显示结果的方法
  func voteresult() {
    VoteMessageLabel.text = "已经有\(Data.agree + Data.disagree)人投过票"
    if Data.agree + Data.disagree >= Data.voter {
      print("Vote Over，\(Data.agree)agrees,\(Data.disagree)disagrees")
      if Data.agree > Data.disagree {
        alertView(true)
        VoteHistory.text?.appendContentsOf("第\(Data.whichround - 1)轮投票,\(Data.agree)票赞成,\(Data.disagree)票反对\n")
      } else {
        alertView(false)
      }
    }
  }
  
  func doingjob() {
    VoteMessageLabel.text = "已经有\(Data.agree + Data.disagree)人投过票"
    if Data.agree + Data.disagree >= Data.voter {
      if Data.disagree > 0 {
        alertView(false)
      } else {
        alertView(true)
      }
      VoteHistory.text?.appendContentsOf("第\(Data.whichround - 1)轮做任务,\(Data.agree)票赞成,\(Data.disagree)票反对\n")
    }
  }
  
  //赞成按钮
  @IBAction func Agree(sender: UIButton) {
    Data.agree++
    print("\(Data.agree + Data.disagree) vote,\(Data.agree) agree,\(Data.disagree) disagree")
    if Data.ifmission == false {
      voteresult()
    } else if Data.ifmission == true {
      doingjob()
    }
  }

  //反对按钮
  @IBAction func Disagree(sender: UIButton) {
    Data.disagree++
    print("\(Data.agree + Data.disagree) vote,\(Data.agree) agree,\(Data.disagree) disagree")
    if Data.ifmission == false {
      voteresult()
    } else if Data.ifmission == true {
      doingjob()
    }
  }
  
  //重新开始此轮投票按钮
  @IBAction func ResetVote(sender: UIButton) {
    Data.agree = 0
    Data.disagree = 0
    VoteMessageLabel.text = "已经有\(Data.agree + Data.disagree)人投过票"
  }
  
  
  //已经有多少人投票的label显示
  @IBOutlet weak var VoteMessageLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    VoteMessageLabel.text = "已经有\(Data.agree + Data.disagree)人投过票"
  }
  
  
  @IBOutlet weak var VoteHistory: UILabel!
  
}


