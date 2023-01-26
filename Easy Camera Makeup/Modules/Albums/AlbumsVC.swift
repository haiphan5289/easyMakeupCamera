
//
//  
//  AlbumsVC.swift
//  Easy Camera Makeup
//
//  Created by haiphan on 26/01/2023.
//
//
import UIKit
import RxCocoa
import RxSwift

class AlbumsVC: UIViewController {
    
    // Add here outlets
    
    // Add here your view model
    private var viewModel: AlbumsVM = AlbumsVM()
    
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupRX()
    }
    
}
extension AlbumsVC {
    
    private func setupUI() {
        // Add here the setup for the UI
    }
    
    private func setupRX() {
        // Add here the setup for the RX
    }
}
