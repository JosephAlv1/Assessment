//
//  MasterPresenter.swift
//  Assessment
//
//  Created by iQueue on 11/01/2022.
//

import UIKit

protocol MasterPresentationProtocol {
    func presentAnimies(viewData: Master.ViewData)
    func presentError(errorString: String)
}

class MasterPresenter {
    weak var viewController: MasterDisplayLogic?
    
    init(viewController: MasterDisplayLogic) {
        self.viewController = viewController
    }
}

extension MasterPresenter: MasterPresentationProtocol {
    func presentAnimies(viewData: Master.ViewData) {
        viewController?.displayAnimies(viewData: viewData)
    }
    
    func presentError(errorString: String) {
        
    }
}
