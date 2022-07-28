//
//  AnimeHelper.swift
//  MyAnimeTests
//
//  Created by Garry on 04/07/22.
//

import Foundation
import Moya
@testable import MyAnime

final class MyAnimeRemoteRepositoryHelper {
    private let stubProvider = MoyaProvider<AnimeListTargetType>(stubClosure: MoyaProvider.delayedStub(1.0), plugins: [NetworkLoggerPlugin]())
    
    private let endpointClosureError = { (target: AnimeListTargetType) -> Endpoint in
        return Endpoint(
            url: URL(target: target).absoluteString,
            sampleResponseClosure: {
                .networkResponse(404, Data())
            },
            method: target.method,
            task: target.task,
            httpHeaderFields: target.headers
        )
    }
    
    private var errorStubProvider: MoyaProvider<AnimeListTargetType> {
        return MoyaProvider<AnimeListTargetType>(endpointClosure: endpointClosureError, stubClosure: MoyaProvider.delayedStub(3))
    }
    
    func stubGetAnimeList() async throws -> AnimeList {
        try await stubProvider.requestAsync(.getAnimeList, model: AnimeList.self)
    }
}
