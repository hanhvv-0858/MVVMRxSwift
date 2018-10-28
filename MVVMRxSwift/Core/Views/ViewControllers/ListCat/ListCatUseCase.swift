//
//  ListCatUseCase.swift
//  MVVMRxSwift
//
//  Created by Hanh Vu on 10/28/18.
//  Copyright © 2018 vu.van.hanh. All rights reserved.
//

protocol ListCatUseCaseType {
    func getCatList() -> Observable<PagingInfo<Cat>>
    func loadMoreCatList(page: Int) -> Observable<PagingInfo<Cat>>
    func deleteCat(id: Int) -> Observable<Void>
}

struct ListCatUseCase: ListCatUseCaseType {
    
    func getCatList() -> Observable<PagingInfo<Cat>> {
        return loadMoreCatList(page: 1)
    }
    
    func loadMoreCatList(page: Int) -> Observable<PagingInfo<Cat>> {
        return getProductList(page: page)
    }
    
    func deleteProduct(id: Int) -> Observable<Void> {
        return Observable.just(())
    }
    
    func getProductList(page: Int) -> Observable<PagingInfo<Cat>> {
        return Observable.create { observer in
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
                let products = Array(0...9)
                    .map { $0 + (page - 1) * 10 }
                    .map { id in
                        Cat().with {
                            $0.catId = id
                            $0.name = "Product \(id)"
                            $0.breed = "Hello"
                        }
                }
                let page = PagingInfo<Cat>(page: page, items: OrderedSet<Cat>(sequence: products))
                
                observer.onNext(page)
                observer.onCompleted()
            })
            return Disposables.create()
        }
    }
    
    func deleteCat(id: Int) -> Observable<Void> {
        return Observable.just(())
    }
    
    func update(_ product: Cat) -> Observable<Void> {
        return Observable.just(())
    }
}
