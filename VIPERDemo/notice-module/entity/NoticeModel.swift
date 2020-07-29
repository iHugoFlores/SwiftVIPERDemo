//
//  NoticeModel.swift
//  VIPERDemo
//
//  Created by Hugo Flores Perez on 7/28/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import Foundation

struct NoticeModel: Decodable {
    let id: String
    let title: String
    let brief: String
    let filesource: String
}

struct NoticeResponse: Decodable {
    let noticeList: [NoticeModel]
    
    private enum CodingKeys: String, CodingKey {
        case noticeList = "notice_list"
    }
}
