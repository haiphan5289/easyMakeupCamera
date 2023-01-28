//
//  BaseViewController.swift
//  Easy Camera Makeup
//
//  Created by haiphan on 26/01/2023.
//

import UIKit
import RxSwift
import EasyBaseCodes

class BaseViewController: UIViewController {
    
    enum NavigationType {
        case show, hide
    }
    
    var navigationType: NavigationType = .show
    internal let disposeBag = DisposeBag()
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = navigationType == .hide
        navigationBarCustom(font: UIFont.boldSystemFont(ofSize: 18),
                            bgColor: Asset.primaryColor.color,
                            textColor: .white,
                            isTranslucent: false)
    }
}

extension BaseViewController {
}
