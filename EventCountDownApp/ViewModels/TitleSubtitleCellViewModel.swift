//
//  TitleSubtitleCellViewModel.swift
//  EventCountDownApp
//
//  Created by Sunil Mishra on 22/09/22.
//

import UIKit

final class TitleSubtitleCellViewModel {
    enum CellType{
        case text
        case date
        case image
    }
    
    let title: String
    private(set) var subTitle: String
    let placeHolder: String
    let type: CellType
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyy"
        return dateFormatter
    }()
    
    private(set) var image: UIImage?
    
    private(set) var onCellUpdate: (() -> Void)?
    
    init(title: String, subTitle: String, placeHolder: String, type: CellType, onCellUpdate: (() -> Void)?) {
        self.title = title
        self.subTitle = subTitle
        self.placeHolder = placeHolder
        self.type = type
        self.onCellUpdate = onCellUpdate
    }
    
    func update(_ subtitle: String){
        self.subTitle = subtitle
    }
    
    func update(_ date: Date){
        let dateString = dateFormatter.string(from: date)
        self.subTitle = dateString
        onCellUpdate?()
    }
    
    func update(_ image: UIImage){
        self.image = image
        onCellUpdate?()
    }
}
