//
//  NetworkImage.swift
//  TabBarController
//
//  Created by R M Sharma on 09/05/21.
//

import Combine
import SwiftUI

struct NetworkImage: View {
    @StateObject private var viewModel = ViewModel()

    let url: URL?

    var body: some View {
        Group {
            if let data = viewModel.imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "photo")
            }
        }
        .onAppear {
            viewModel.loadImage(from: url)
        }
    }
}

extension NetworkImage {
    class ViewModel: ObservableObject {
        @Published var imageData: Data?
        @Published var isLoading = false

        private static let cache = NSCache<NSURL, NSData>()

        private var cancellables = Set<AnyCancellable>()

        func loadImage(from url: URL?) {
            isLoading = true
            guard let url = url else {
                isLoading = false
                return
            }
            if let data = Self.cache.object(forKey: url as NSURL) {
                imageData = data as Data
                isLoading = false
                return
            }
            URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .replaceError(with: nil)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] in
                    if let data = $0 {
                        Self.cache.setObject(data as NSData, forKey: url as NSURL)
                        self?.imageData = data
                    }
                    self?.isLoading = false
                }
                .store(in: &cancellables)
        }
    }
}
