//
//  StarwarsCoordinator.swift
//  BaseProject
//
//  Created by dongseok lee on 26/09/2019.
//  Copyright © 2019 Good Effect. All rights reserved.
//

import UIKit

struct StarwarsCoordinator {
    func start(from viewController: UIViewController, animated: Bool) {
        let vc = StarwarsViewController()
        viewController.present(vc, animated: animated)
    }
}

extension StarwarsViewController {
    convenience init() {
        let presenter = StarwarsPresenter()
        let interactor = StarwarsInteractor(presenter: presenter)
        self.init(interactor: interactor)
        presenter.setViewController(self)
    }
}
