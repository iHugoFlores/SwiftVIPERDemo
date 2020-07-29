//
//  NoticeViewController.swift
//  VIPERDemo
//
//  Created by Hugo Flores Perez on 7/29/20.
//  Copyright © 2020 Hugo Flores Perez. All rights reserved.
//

import UIKit

class NoticeViewController: UIViewController {
    
    var presenter: ViewToPresenterProtocol?
    
    var noticeArrayList: Array<NoticeModel> = Array()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notice Module"
        print("Should Show progress indicator")
        presenter?.startFetchingNotice()
        
        setUpTableLayout()
    }
    
    func setUpTableLayout() {
        tableView.register(UINib(nibName: "NoticeCell", bundle: nil), forCellReuseIdentifier: "NoticeCell")
        //tableView.register(NoticeCell.self, forCellReuseIdentifier: "NoticeCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension NoticeViewController: PresenterToViewProtocol {
    func showNotice(noticeArray: Array<NoticeModel>) {
        noticeArrayList = noticeArray
        tableView.reloadData()
        print("Should hide progress indicator")
    }
    
    func showError() {
        print("Should hide progress indicator")
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension NoticeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        noticeArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell", for: indexPath) as! NoticeCell
        cell.titleLabel.text = noticeArrayList[indexPath.row].title
        cell.briefingLabel.text = noticeArrayList[indexPath.row].brief
        cell.fileSourceLabel.text = noticeArrayList[indexPath.row].filesource
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showMovieController(navigationController: navigationController!)
    }
}
