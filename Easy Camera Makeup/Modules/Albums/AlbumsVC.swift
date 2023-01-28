
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

class AlbumsVC: BaseViewController,
                SetupBaseCollection,
                ActionEditImageProtocol {
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupRX()
    }
    
}
extension AlbumsVC {
    
    private func setupUI() {
        // Add here the setup for the UI
        navigationType = .hide
        
        setupCollectionView(collectionView: collectionView, delegate: self, name: AlbumsCell.self)
        collectionView.contentInset = UIEdgeInsets(top: Constant.distanceSide,
                                                   left: Constant.distanceSide,
                                                   bottom: Constant.distanceSide,
                                                   right: Constant.distanceSide)
        DispatchQueue.main.async {
            self.sizeCell = CGSize(width: self.calculaterSizeCell(), height: self.calculaterSizeCell() + 100)
            self.collectionView.reloadData()
        }
    }
    
    private func setupRX() {
        // Add here the setup for the RX
        ManageCameraMakeUp.shared.albumsPhoto
            .withUnretained(self)
            .debounce(.milliseconds(200), scheduler: MainScheduler.instance)
            .bind { owner, _ in
                owner.collectionView.reloadData()
            }.disposed(by: disposeBag)
        
        ManageCameraMakeUp.shared.albumsPhoto
            .bind(to: self.collectionView.rx.items(cellIdentifier: AlbumsCell.identifier,
                                                   cellType: AlbumsCell.self)) { row, data, cell in
                cell.bindModel(model: data)
            }.disposed(by: disposeBag)
        
        self.collectionView
            .rx
            .itemSelected
            .withUnretained(self)
            .bind { owner, idx in
                let item = ManageCameraMakeUp.shared.albumsPhoto.value[idx.row]
                owner.openSelectImage(album: item)
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
