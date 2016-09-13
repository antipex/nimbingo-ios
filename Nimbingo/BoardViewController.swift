//
//  BoardViewController.swift
//  Nimbingo
//
//  Created by Kyle Rohr on 30/08/2016.
//  Copyright © 2016 Kyle Rohr. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {

    @IBOutlet var boardView: BoardView!

    override func viewDidLoad() {
        super.viewDidLoad()

        var rows: [Array<BoardViewCell>] = []

        for rowNum in 0..<5 {
            var row = [BoardViewCell]()

            for colNum in 0..<5 {
                let cell = BoardViewCell()
                cell.title = "Bobby G"

                row.append(cell)
            }

            rows.append(row)
        }

        boardView.rows = rows
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

