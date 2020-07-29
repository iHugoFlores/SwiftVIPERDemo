//
//  NoticeInteractor.swift
//  VIPERDemo
//
//  Created by Hugo Flores Perez on 7/29/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import Foundation
import Alamofire
import OHHTTPStubs
import OHHTTPStubsSwift

class NoticeInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    
    func fetchNotice() {
        print("Downloading data")
        stub(condition: isHost("api.myjson.com")) { _ in
            let stubPath = OHPathForFile("Notices.json", type(of: self))
            let stub = fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
            stub.responseTime(1)
            return stub
        }
        AF.request(API_NOTICE_LIST).responseJSON { [weak self] response in
            switch response.result {
            case .success:
                do {
                    let noticeResponse = try JSONDecoder().decode(NoticeResponse.self, from: response.data!)
                    print("Setting data")
                    self?.presenter?.noticeFetchedSuccess(noticeModelArray: noticeResponse.noticeList)
                } catch {
                    self?.presenter?.noticeFetchFailed()
                }
            case .failure:
                self?.presenter?.noticeFetchFailed()
            }
        }
    }
}
