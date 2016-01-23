//
//  File.swift
//  Vote
//
//  Created by 孙竞 on 16/1/23.
//  Copyright © 2016年 Sun Jing. All rights reserved.
//

import UIKit

struct Data {
  
  static var voter = 5 //参加者
  static var v = voter //参加者过渡
  static var agree = 0 //赞成票数
  static var disagree = 0 //反对票数
  static var ifmission = false //是否做任务阶段
  static var round = [2,3,2,3,3] //每轮做任务的人数
  static var whichround: Int = 1 //正在投票的轮数
  
}
