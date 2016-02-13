//
//  MainMoviesListWireframe.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit

struct MainMoviesListWireframe {

   static func presentMainMoviesListModule(window: UIWindow) {
      
      let mainMoviesListView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainMoviesListView") as! MainMoviesListView

      let apiService = TmdbApiService()
      let apiDataManager = TmdbApiDataManager(apiService: apiService)
      
      let mainMoviesListInteractor = MainMoviesListInteractor(apiDataManager: apiDataManager)
      mainMoviesListView.presenter = MainMoviesListPresenter(interactor: mainMoviesListInteractor, wireframe: MainMoviesListWireframe())
      
      let navigationController = UINavigationController(rootViewController: mainMoviesListView)
      window.rootViewController = navigationController

   }
   
   func showDetail() {
      MovieDetailWireframe.presentMovieDetailModule(UIApplication.sharedApplication().keyWindow!)
   }
   
}