//
//  StarwarsFilmCell.swift
//  BaseProject
//
//  Created by dongseok lee on 15/06/2019.
//  Copyright © 2019 Good Effect. All rights reserved.
//

import UIKit
 
final class StarwarsFilmCell: UITableViewCell {
    func configure(film: Starwars.Film.ViewModel?) {
        textLabel?.text = film?.title
    }
}
