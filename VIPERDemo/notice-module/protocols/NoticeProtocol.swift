//
//  NoticeProtocol.swift
//  VIPERDemo
//
//  Created by Hugo Flores Perez on 7/28/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

protocol ViewToPresenterProtocol: class{
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingNotice()
    func showMovieController(navigationController: UINavigationController)
    
}

protocol PresenterToViewProtocol: class{
    func showNotice(noticeArray:Array<NoticeModel>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> NoticeViewController
    func pushToMovieScreen(navigationConroller: UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchNotice()
}

protocol InteractorToPresenterProtocol: class {
    func noticeFetchedSuccess(noticeModelArray:Array<NoticeModel>)
    func noticeFetchFailed()
}
