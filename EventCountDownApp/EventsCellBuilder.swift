//
//  EventsCellBuilder.swift
//  EventCountDownApp
//
//  Created by Sunil Mishra on 26/09/22.
//

import Foundation

struct EventsCellBuilder {
    func makeTitleSubtitleCellViewModel(_ type: TitleSubtitleCellViewModel.CellType, onCellUpdate:  (() -> Void)?=nil) -> TitleSubtitleCellViewModel {
        switch type {
        case .text:
            return TitleSubtitleCellViewModel(title: "Name", subTitle: "", placeHolder: "Add a name", type: .text, onCellUpdate: onCellUpdate)
        case .date:
            return TitleSubtitleCellViewModel(title: "Date", subTitle: "", placeHolder: "Add a date", type: .date, onCellUpdate: onCellUpdate)
        case .image:
            return TitleSubtitleCellViewModel(title: "Background", subTitle: "", placeHolder: "", type: .image, onCellUpdate: onCellUpdate)
        }
    }
}
