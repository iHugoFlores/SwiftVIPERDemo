//
//  NoticeRouter.swift
//  VIPERDemo
//
//  Created by Hugo Flores Perez on 7/29/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

class NoticeRouter: PresenterToRouterProtocol {
    static func createModule() -> NoticeViewController {
        let view = NoticeViewController()
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = NoticePresenter()
        let interactor: PresenterToInteractorProtocol = NoticeInteractor()
        let router:PresenterToRouterProtocol = NoticeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
    
    func pushToMovieScreen(navigationConroller: UINavigationController) {
        print("Push to movie screen")
    }
}
