//
//  ViewController.swift
//  AvitoTest
//
//  Created by Andrey on 25.08.2021.
//

import UIKit

class MainViewController: UIViewController, MainViewPresenterInput {
    // MARK: - Private Properties
    private lazy var responseTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Refresh Controll
    private lazy var refreshControll: UIRefreshControl = {
       let refreshControll = UIRefreshControl()
        refreshControll.addTarget(self, action: #selector(refreshResponseTableView(sender:)), for: .valueChanged)
        return refreshControll
    }()
    
    var presenter: MainViewPresenterOutput!
    
    // MARK: - Setup Response Table View
    private func setupResponseTableView() {
        responseTableView.dataSource = self
        responseTableView.delegate = self
        responseTableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        
        responseTableView.refreshControl = refreshControll
    }

    // MARK: - Response Table View Constraints
    private func setupResponseTableViewConstraints() {
        view.addSubview(responseTableView)
        responseTableView.constraint(leading: view.leadingAnchor)
        responseTableView.constraint(trailing: view.trailingAnchor)
        responseTableView.constraint(top: view.topAnchor)
        responseTableView.constraint(bottom: view.bottomAnchor)
    }
    
    // MARK: - Update Cells
    private func updateCell(for indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath)
                as? MainTableViewCell else { return UITableViewCell() }
        
        guard let employee = presenter.getEmployee(for: indexPath.row) else { return UITableViewCell() }
        
        cell.setDataInCell(data: employee)
        cell.setIndex(index: indexPath.row)
        cell.setMainViewController(controller: self)
        
        return cell
    }
    
    // MARK: - Refresh Response Table View
    @objc private func refreshResponseTableView(sender: UIRefreshControl) {
        presenter.fetchData()
        sender.endRefreshing()
    }
    
    // MARK: - Update Table View
    private func updateTableView() {
        responseTableView.reloadData()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        setupResponseTableView()
        setupResponseTableViewConstraints()
    }
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.fetchData()
        setupUI()
    }

    // MARK: - Show Response Data
    func showResponseData() {
        updateTableView()
    }
    
    // MARK: - Show Alert
    func showAlert(error: Error) {
        self.showAlerts(error: error)
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.MainCellSize.cellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getEmployeesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return updateCell(for: indexPath, tableView: tableView)
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate { }

// MARK: - MainTableViewCellDelegate
extension MainViewController: MainTableViewCellDelegate {
    
    func getSkillsData(index: Int) -> [String] {
        presenter.getResponseData().company.employees[index].skills
    }
}
