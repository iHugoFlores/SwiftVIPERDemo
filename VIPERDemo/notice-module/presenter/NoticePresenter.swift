//
//  NoticePresenter.swift
//  VIPERDemo
//
//  Created by Hugo Flores Perez on 7/28/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

class NoticePresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?

    func startFetchingNotice() {
        interactor?.fetchNotice()
    }
    
    func showMovieController(navigationController: UINavigationController) {
        router?.pushToMovieScreen(navigationConroller: navigationController)
    }
}

extension NoticePresenter: InteractorToPresenterProtocol {
    func noticeFetchedSuccess(noticeModelArray: Array<NoticeModel>) {
        view?.showNotice(noticeArray: noticeModelArray)
    }
    
    func noticeFetchFailed() {
        view?.showError()
    }
}
