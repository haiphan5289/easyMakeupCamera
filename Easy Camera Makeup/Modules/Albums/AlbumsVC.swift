
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

class AlbumsVC: UIViewController, SetupBaseCollection {
    
    struct Constant {
        static let heihgtCell: Int = 100
        static let distanceSide: CGFloat = 16
        static let distanceItem: Int = 8
    }
    
    // Add here outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Add here your view model
    private var viewModel: AlbumsVM = AlbumsVM()
    private var sizeCell: CGSize = .zero
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
        setupCollectionView(collectionView: collectionView, delegate: self, name: AlbumsCell.self)
        collectionView.contentInset = UIEdgeInsets(top: Constant.distanceSide,
                                                   left: Constant.distanceSide,
                                                   bottom: Constant.distanceSide,
                                                   right: Constant.distanceSide)
        DispatchQueue.main.async {
            self.sizeCell = CGSize(width: self.calculaterSizeCell(), height: Constant.heihgtCell)
            self.collectionView.reloadData()
        }
    }
    
    private func setupRX() {
        // Add here the setup for the RX
        Observable.just([1,2,3,4])
            .bind(to: self.collectionView.rx.items(cellIdentifier: AlbumsCell.identifier,
                                                   cellType: AlbumsCell.self)) { row, data, cell in
                cell.backgroundColor = .red
            }.disposed(by: disposeBag)
    }
    
    private func calculaterSizeCell() -> Int {
        let twoSide = Constant.distanceSide * 2
        let numberOfCell: Int = 2
        let width = ((Int(collectionView.bounds.size.width) - Int(twoSide)) / numberOfCell) - Constant.distanceItem
        return Int(width)
    }
    
}
extension AlbumsVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.sizeCell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Constant.distanceItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Constant.distanceItem)
    }
}
