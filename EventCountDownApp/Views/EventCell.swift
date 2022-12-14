//
//  EventCell.swift
//  EventCountDownApp
//
//  Created by Sunil Mishra on 29/09/22.
//

import UIKit

final class EventCell: UITableViewCell {
    
    private let timeRemainingStackView = TimeRemainingStackView()
    private let dateLabel = UILabel()
    
    private let eventNameLabel = UILabel()
    private let backgroundImageView = UIImageView()
    private let verticalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        timeRemainingStackView.setup()
        
        [dateLabel, eventNameLabel, backgroundImageView, verticalStackView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        dateLabel.font = .systemFont(ofSize: 25, weight: .medium)
        dateLabel.textColor = .white
        
        eventNameLabel.font = .systemFont(ofSize: 28, weight: .bold)
        eventNameLabel.textColor = .white
        
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .trailing
    }
    
    private func setupHierarchy(){
        
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(verticalStackView)
        contentView.addSubview(eventNameLabel)
        
        verticalStackView.addArrangedSubview(TimeRemainingStackView())
        verticalStackView.addArrangedSubview(UIView())
        verticalStackView.addArrangedSubview(dateLabel)
        
    }
    
    private func setupLayout(){
        backgroundImageView.pinToSuperViewEdges([.left, .top, .right])
        let bottomConstraint = backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomConstraint.priority = .required - 1
        bottomConstraint.isActive = true
        
        backgroundImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        verticalStackView.pinToSuperViewEdges([.top, .right, .bottom], constant: 15)
        eventNameLabel.pinToSuperViewEdges([.left, .bottom], constant: 15)
        
    }
    
    func update(with viewModel: EventCellViewModel){
        if let timeRemainingViewModel = viewModel.timeRemainingViewModel {
            timeRemainingStackView.update(with: viewModel.timeRemainingViewModel!)
        }
        dateLabel.text = viewModel.dateText
        eventNameLabel.text = viewModel.eventName
        
        viewModel.loadImage { image in
            self.backgroundImageView.image = image
        }
        
    }
}
