//
//  TabbarVC.swift
//  Easy Camera Makeup
//
//  Created by haiphan on 26/01/2023.
//

import UIKit
import RxCocoa
import RxSwift

class TabbarVC: UITabBarController {
    
    enum TabbarViewController: CaseIterable {
        case album
        
        var viewController: UIViewController {
            switch self {
            case .album: return AlbumsVC.createVC()
            }
        }
    }

    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
        // Do any additional setup after loading the view.
        
    }
}
extension TabbarVC {
    
    private func setupTabbar() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = Asset.black292929.color
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
//        tabBar.tintColor = Asset.orangeFF8300.color
        viewControllers = TabbarViewController.allCases.map { $0.viewController }
    }
    
}
