//
//  ViewController.swift
//  PracticeTests
//
//  Created by Roger Prats Llivina on 22/09/2020.
//  Copyright © 2020 roger. All rights reserved.
//

import UIKit

protocol HomeViewProtocol: class {
    func updateTitle(_ title: String)
    func showError(_ error: Error)
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
      super.init(coder: aDecoder)
      setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchHomeTitle()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let service = HomeService()
        let presenter = HomePresenter()
        presenter.service = service
        presenter.view = self
        self.presenter = presenter
    }
}

extension HomeViewController: HomeViewProtocol {
    func updateTitle(_ title: String) {
        self.title = title
    }
    
    func showError(_ error: Error) {
        print(error.localizedDescription)
    }
}

