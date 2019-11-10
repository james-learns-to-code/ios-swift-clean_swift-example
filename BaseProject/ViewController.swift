//
//  ViewController.swift
//  BaseProject
//
//  Created by leedongseok on 12/06/2019.
//  Copyright © 2019 Good Effect. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBAction private func didTapButton(_ sender: Any) {
        let coord = StarwarsCoordinator()
        coord.start(from: self, animated: true)
    }
}
