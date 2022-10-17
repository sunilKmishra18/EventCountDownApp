//
//  TitleSubtitleCell.swift
//  EventCountDownApp
//
//  Created by Sunil Mishra on 22/09/22.
//

import UIKit

final class TitleSubtitleCell: UITableViewCell{
    private let titleLabel = UILabel()
    let subTitleTextField = UITextField()
    private let verticalStackView = UIStackView()
    private let constant: CGFloat = 15
    
    private let datePickerView = UIDatePicker()
    private let toolbar = UIToolbar(frame: .init(x: 0, y: 0, width: 100, height: 100))
    lazy var doneButton: UIBarButtonItem = {UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))}()
    
    private let photoImageView = UIImageView()
    
    private var viewModel: TitleSubtitleCellViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: TitleSubtitleCellViewModel){
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        subTitleTextField.text = viewModel.subTitle
        subTitleTextField.placeholder = viewModel.placeHolder
        
        datePickerView.frame = CGRect(x: 30, y: 50, width: 200, height: 200)
        //datePickerView.backgroundColor = .red
        
        subTitleTextField.inputView = viewModel.type == .text ? nil : datePickerView
        subTitleTextField.inputAccessoryView = viewModel.type == .text ? nil : toolbar
        
        photoImageView.isHidden = viewModel.type != .image
        subTitleTextField.isHidden = viewModel.type == .image
        
        photoImageView.image = viewModel.image
        
        verticalStackView.spacing = viewModel.type == .image ? 18 : verticalStackView.spacing
    }
    
    private func setupViews(){
        verticalStackView.axis = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subTitleTextField.font = .systemFont(ofSize: 20, weight: .medium)
        
        [verticalStackView, titleLabel,subTitleTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        toolbar.setItems([doneButton], animated: false)
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.datePickerMode = .date
        
        photoImageView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        photoImageView.layer.cornerRadius = 10
        
    }
    
    private func setupHierarchy(){
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subTitleTextField)
        verticalStackView.addArrangedSubview(photoImageView)
    }
    
    private func setupLayout(){
        verticalStackView.translatesAutoresizingMaskIntoConstraints=false
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: constant),
            verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: constant),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -constant),
            verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -constant)
        ])
        photoImageView.translatesAutoresizingMaskIntoConstraints=false
        photoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    @objc private func tappedDone(){
        viewModel?.update(datePickerView.date)
    }
}
