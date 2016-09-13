//
//  BoardView.swift
//  Nimbingo
//
//  Created by Kyle Rohr on 31/08/2016.
//  Copyright © 2016 Kyle Rohr. All rights reserved.
//

import UIKit

class BoardView: UIView {

    var numberOfRows = 5
    var numberOfColumns = 5
    var lineWidth: CGFloat = 2.0
//    var headerHeight: CGFloat = 64.0

    var cellSize: CGSize {
        return CGSize(
            width: frame.size.width / CGFloat(numberOfColumns),
            height: frame.size.height / CGFloat(numberOfRows + 1)
        )
    }

    var playableRect: CGRect {
        return CGRect(x: 0.0, y: cellSize.height, width: frame.size.width, height: frame.size.height - cellSize.height)
    }

    var headerLabels = [UILabel]()

    var rows: [Array<BoardViewCell>] = [] {
        didSet {
            for row: [BoardViewCell] in rows {
                for cell in row {
                    addSubview(cell)
                }
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        let bingoLabelText = ["N", "I", "M", "B", "Y"]

        if headerLabels.count == 0 {
            for labelNum in 0..<numberOfColumns {
                let headerLabel = UILabel()
                headerLabel.textAlignment = .Center
                headerLabel.font = UIFont.boldSystemFontOfSize(30.0)

                if labelNum < bingoLabelText.count {
                    headerLabel.text = bingoLabelText[labelNum]
                }

                headerLabels.append(headerLabel)

                addSubview(headerLabel)
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Set up header label frames
        for column in 0..<numberOfColumns {
            let cellFrame = CGRect(
                x: CGFloat(column) * cellSize.width,
                y: 0.0,
                width: cellSize.width,
                height: cellSize.height
            )

            headerLabels[column].frame = cellFrame
        }

        // Set up cell frames
        for row in 0..<numberOfRows {
            for column in 0..<numberOfColumns {
                let cellFrame = CGRect(
                    x: CGFloat(column) * cellSize.width,
                    y: CGFloat(row) * cellSize.height + cellSize.height,
                    width: cellSize.width,
                    height: cellSize.height
                )

                print("Row: \(row), Column: \(column)")
                let cell = rows[row][column]
                cell.frame = cellFrame
            }
        }
    }

    override func drawRect(rect: CGRect) {
        UIColor.blackColor().setStroke()

        let cellSize = CGSize(
            width: rect.size.width / CGFloat(numberOfColumns),
            height: playableRect.size.height / CGFloat(numberOfRows)
        )

        // Header row

        let headerRect = CGRect(x: 0.0, y: 0.0, width: rect.size.width, height: cellSize.height)

        let headerFillPath = UIBezierPath(rect: headerRect)
        UIColor.lightGrayColor().setFill()
        headerFillPath.fill()

        let headerBorderPath = UIBezierPath()
        headerBorderPath.moveToPoint(CGPoint(x: 0.0, y: cellSize.height))
        headerBorderPath.addLineToPoint(CGPoint(x: rect.size.width, y: cellSize.height))
        headerBorderPath.lineWidth = lineWidth
        headerBorderPath.stroke()

        // Board outline
        let boardOutlinePath = UIBezierPath(rect: rect)
        boardOutlinePath.lineWidth = lineWidth
        boardOutlinePath.stroke()

        // Row and column lines
        for row in 1..<numberOfRows {
            let currentRowY = playableRect.origin.y + cellSize.height * CGFloat(row)

            let rowPath = UIBezierPath()

            rowPath.moveToPoint(CGPoint(x: 0.0, y: currentRowY))
            rowPath.addLineToPoint(CGPoint(x: playableRect.size.width, y: currentRowY))
            rowPath.lineWidth = lineWidth

            rowPath.stroke()
        }

        for column in 1..<numberOfColumns {
            let currentColX = cellSize.width * CGFloat(column)

            // Borders
            let columnPath = UIBezierPath()

            columnPath.moveToPoint(CGPoint(x: currentColX, y: 0.0))
            columnPath.addLineToPoint(CGPoint(x: currentColX, y: rect.size.height))
            columnPath.lineWidth = lineWidth

            UIColor.blackColor().setStroke()
            
            columnPath.stroke()
        }

        // Cells
        for row in 0..<numberOfRows {
            for column in 0..<numberOfColumns {

            }
        }


    }

}
