//
//  ViewModel.swift
//  PaginationWithCombineInSwiftUI
//
//  Created by Blashko Maksym on 09.03.2023.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    enum State: Comparable {
        case loadMore
        case isLoading
        case none
    }
    
    private var userRouter = APIRouter<UserEndPoint>()
    private let quantityPerRequest = 10
    private var page = 1
    private let maxPageToLoad = 5

    private var cancellables = Set<AnyCancellable>()
    
    @Published var users: [User] = []
    @Published var state: State = .loadMore
    
    func fetchUsers() {
        guard state == .loadMore else { return }
        guard self.page <= self.maxPageToLoad else { return }
        state = .isLoading
            
        _ = self.userRouter.request(.getUsers(results: String(self.quantityPerRequest), page: String(self.page)), responseHandler: nil) { [weak self] (result: Result<UserResponse, Error>) in
            guard let self else { return }
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let response):
                DispatchQueue.main.async {
                    self.page += 1
                    self.users += response.results
                    self.state = .loadMore
                }
            }
        }
    }

    func loadMore() {
        fetchUsers()
    }
}
