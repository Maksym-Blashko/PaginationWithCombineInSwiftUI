//
//  ContentView.swift
//  PaginationWithCombineInSwiftUI
//
//  Created by Blashko Maksym on 09.03.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.users) { user in
                UserCell(user: user)
            }
            
            switch viewModel.state {
            case .loadMore:
                Color.clear
                    .onAppear {
                        viewModel.loadMore()
                    }
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
            case .none:
                EmptyView()
            }
        }
        .listStyle(.plain)
    }
}

struct UserCell: View {
    var user: User

    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            VStack(alignment: .leading, spacing: 15) {
                Text(user.name.first)
                Text(user.email)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
