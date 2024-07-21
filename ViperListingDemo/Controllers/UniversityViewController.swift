//
//  View.swift
//  ViperListingDemo
//
//  Created by Ashish's Macbook on 20/07/2024.
//

import Foundation
import UIKit

class UniversityViewController: UIViewController, UniversityViewProtocol {
    var presenter: UniversityPresenterProtocol?
    
    private let tableView = UITableView()
    private var universities: [University] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "University List"
        setupTableView()
//        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        self.tableView.register(UINib(nibName: "UniversityListCell", bundle: nil), forCellReuseIdentifier: "UniversityListCell")
        view.addSubview(tableView)
    }
    
    func displayUniversities(universities: [University]) {
        self.universities = universities
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func displayError(error: Error) {
        // Handle the error (e.g., show an alert)
    }
}

extension UniversityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UniversityListCell", for: indexPath) as! UniversityListCell
        cell.lblName?.text = universities[indexPath.row].name
        cell.lblState.text = universities[indexPath.row].stateProvince
       
        cell.lblName.lineBreakMode = .byWordWrapping
        cell.lblState.lineBreakMode = .byWordWrapping
        cell.selectionStyle = .none
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondViewController = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
            secondViewController.universities = universities[indexPath.row]
            navigationController?.pushViewController(secondViewController, animated: true)
        }
        
    }
}
