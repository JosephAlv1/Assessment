//
//  MasterInteractor.swift
//  Assessment
//
//  Created by iQueue on 11/01/2022.
//

import Foundation

// MARK: - MasterInteractorProtocol
protocol MasterInteractorProtocol {
    func viewDidLoad()
    func searchAnimesWith(text: String)
    var presenter: MasterPresentationProtocol? { get set }
}

// MARK: - MasterInteractor
class MasterInteractor {
    var presenter: MasterPresentationProtocol?
    init(presenter: MasterPresentationProtocol) {
        self.presenter = presenter
    }
}

// MARK: - MasterInteractor delegates
extension MasterInteractor: MasterInteractorProtocol {
    func viewDidLoad() {
        // call methods needed in viewDidLoad
    }
    
    func searchAnimesWith(text: String) {
        
        APIWorker.searchAnimesWith(text: text) { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let data):
                guard let _data = data, let _animes = _data.results else { return }
                self.populateViewDataFrom(animes: _animes)
                
            case .failure(let errorString):
                self.presenter?.presentError(errorString: errorString)
            }
        }
        
    }
    
    func populateViewDataFrom(animes: [Animie]) {
        var dataSource: [Master.Animie] = []
        
        for object in animes {
            
            let animie = Master.Animie.init(malID: object.malID, url: object.url, imageURL: object.imageURL, title: object.title, airing: object.airing, synopsis: object.synopsis, type: object.type, episodes: object.episodes, score: object.score, startDate: object.startDate, endDate: object.endDate, members: object.members, rated: object.rated)
            dataSource.append(animie)
        }
        let viewData = Master.ViewData.init(animies: dataSource)
        self.presenter?.presentAnimies(viewData: viewData)
    }
}
