//
//  Network.swift
//  ViperListingDemo
//
//  Created by Ashish's Macbook on 20/07/2024.
//

import Foundation
import UIKit
import Network

class NetworkManager {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")

    var isConnected: Bool = false

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
            if self?.isConnected == true {
                print("Connected to the internet")
            } else {
                print("No internet connection")
            }
        }
        monitor.start(queue: queue)
    }
}
