//
//  Model.swift
//  HW25
//
//  Created by Sergey Bodnar on 30.06.2022.
//

import Foundation

struct MagicTable {
    var sectionsTable: [SectionTable]
}

struct SectionTable {
    var nameSection: String
    var tableCell: [TableCell]
}

struct TableCell {
    var imageCell: String
    var textCell: String
}

