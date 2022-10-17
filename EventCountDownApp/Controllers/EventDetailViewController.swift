//
//  EventDetailViewController.swift
//  EventCountDownApp
//
//  Created by Sunil Mishra on 10/10/22.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    var viewModel: EventDetailViewModel!
    
    @IBOutlet var timeRemainingStackView: TimeRemainingStackView!{
        didSet {
            timeRemainingStackView.setup()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdate = { [weak self] in
            guard let self = self, let timeRemainingViewModel = self.viewModel.timeRemainingViewModel else { return }
            self.backgroundImageView.image = self.viewModel.image
            self.timeRemainingStackView.update(with: timeRemainingViewModel)
            
        }
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "pencil"), style: .plain, target: viewModel, action: #selector(viewModel.editButtonTapped))
        
        viewModel.viewDidLoad()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisapper()
    }

}
