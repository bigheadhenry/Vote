//
//  VoteViewController.swift
//  Vote
//
//  Created by 孙竞 on 16/1/11.
//  Copyright © 2016年 Sun Jing. All rights reserved.
//

import UIKit

protocol VoterNumberDataSource: class {

  func SetVoterNumber(sender: VoteViewController) -> Int?
  
}

class VoteViewController: UIViewController {

  var voter =  5 // 投票人
  var voterdata = 5 //存储投票人信息
  var agree = 0 //赞成票数
  var disagree = 0 //反对票数
  var ifmission = false //是否做任务阶段
  var round = [2,3,2,3,3] //5个人每轮做任务的人数
  var whichround = 1 //正在投票的轮数
  
  
  weak var dataSource: VoterNumberDataSource?
  
  //提示框显示结果
  func alertView(success: Bool) -> () {
    
    //判断并显示投票是否通过
    var votemessage: String {
        if success {
          return "\(agree)票赞成，\(disagree)票反对，通过！"
        } else {
          ifmission = true
          return "\(agree)票赞成，\(disagree)票反对，未通过！"
      }
    }
    
    //判断是投票还是做任务
    var titlemessage: String {
      if ifmission == false {
        return "第\(whichround)轮投票结果"
      } else {
        return "第\(whichround - 1)轮做任务结果"
      }
    }
    //投票显示框
     let votepass = UIAlertController(title: titlemessage, message: votemessage, preferredStyle: UIAlertControllerStyle.Alert)
    votepass.addAction(UIAlertAction(
      title: "重新投票",
      style: .Cancel)
      { (action: UIAlertAction) -> Void in
        self.agree = 0
        self.disagree = 0
        self.VoteMessageLabel.text = "已经有\(self.agree + self.disagree)人投过票"
      }
    )
    presentViewController(votepass, animated: true, completion: nil)
    
    //改变投票人数，进入做任务阶段
    if ifmission == false {
      voter = round[whichround - 1]
      whichround++
      ifmission = !ifmission
      print("\(ifmission)")
    } else if ifmission == true {
      voter = voterdata
      ifmission = !ifmission
      print("\(ifmission)")
    }
    
  }
  
  //判断投票结果并传递显示结果的方法
  func voteresult() {
    VoteMessageLabel.text = "已经有\(agree + disagree)人投过票"
    if agree + disagree >= voter {
      print("Vote Over，\(agree)agrees,\(disagree)disagrees")
      if agree > disagree {
        alertView(true)
        VoteHistory.text?.appendContentsOf("第\(whichround - 1)轮投票,\(agree)票赞成,\(disagree)票反对\n")
      } else {
        alertView(false)
      }
    }
  }
  
  func doingjob() {
    VoteMessageLabel.text = "已经有\(agree + disagree)人投过票"
    if agree + disagree >= voter {
      if disagree > 0 {
        alertView(false)
      } else {
        alertView(true)
      }
      VoteHistory.text?.appendContentsOf("第\(whichround - 1)轮做任务,\(agree)票赞成,\(disagree)票反对\n")
    }
  }
  
  //赞成按钮
  @IBAction func Agree(sender: UIButton) {
    agree++
    print("\(agree + disagree) vote,\(agree) agree,\(disagree) disagree")
    if ifmission == false {
      voteresult()
    } else if ifmission == true {
      doingjob()
    }
  }

  //反对按钮
  @IBAction func Disagree(sender: UIButton) {
    disagree++
    print("\(agree + disagree) vote,\(agree) agree,\(disagree) disagree")
    if ifmission == false {
      voteresult()
    } else if ifmission == true {
      doingjob()
    }
  }
  
  //重新开始此轮投票按钮
  @IBAction func ResetVote(sender: UIButton) {
    agree = 0
    disagree = 0
    VoteMessageLabel.text = "已经有\(agree + disagree)人投过票"
  }
  
  
  //已经有多少人投票的label显示
  @IBOutlet weak var VoteMessageLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    VoteMessageLabel.text = "已经有\(agree + disagree)人投过票"
  }
  
  
  @IBOutlet weak var VoteHistory: UILabel!
  
}


