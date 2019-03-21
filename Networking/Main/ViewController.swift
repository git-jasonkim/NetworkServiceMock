//
//  ViewController.swift
//  Networking
//
//  Created by Jason Kim on 3/20/19.
//  Copyright © 2019 jklabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let networkingService = NetworkingService()
        networkingService.requestData { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let apod):
                if let apod = apod {
                    print(apod.title, apod.url)
                }
            }
        }
    }


}

