//
//  EventDetailViewModel.swift
//  EventCountDownApp
//
//  Created by Sunil Mishra on 10/10/22.
//

import UIKit
import CoreData

final class EventDetailViewModel {
    private let eventID: NSManagedObjectID
    private let eventService: EventServiceProtocol
    private var event: Event?
    private let date = Date()
    var onUpdate = {}
    var coordinator: EventDetailCoordinator?
    
    var image: UIImage? {
        
        guard let imageData = event?.image else { return nil }
        return UIImage(data: imageData)
    }
    
    var timeRemainingViewModel: TimeRemainingViewModel? {
        guard let eventDate = event?.date, let timeRemainingParts = date.timeRemainingComponent(until: eventDate)?.components(separatedBy: ",") else { return nil }
        return TimeRemainingViewModel(timeRemainingParts: timeRemainingParts, mode: .detail)
    }
    
    init(eventID: NSManagedObjectID, eventService: EventServiceProtocol = EventService()) {
        self.eventID = eventID
        self.eventService = eventService
    }
    
    func viewDidLoad() {
        reload()
    }
    
    func viewDidDisapper(){
        coordinator?.didFinish()
    }
    
    func reload(){
        event = eventService.getEvent(eventID)
        onUpdate()
        
    }
    
    @objc func editButtonTapped() {
        guard let event = event else { return }
        coordinator?.onEditEvent(event: event)
    }
}
