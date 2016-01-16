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
  
  @IBAction func Agree(sender: UIButton) {
    agree++
    print("\(agree) agree")
    if agree + disagree >= 6 {
      print("Vote Over，\(agree)agrees,\(disagree)disagrees")
    }
  }

  @IBAction func Disagree(sender: UIButton) {
    disagree++
    print("\(disagree) disagree")
    if agree + disagree >= 6 {
      print("Vote Over，\(agree)agrees,\(disagree)disagrees")
    }

  }

}
