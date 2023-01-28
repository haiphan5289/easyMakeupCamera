
//
//  
//  SelectPhotoVC.swift
//  Easy Camera Makeup
//
//  Created by haiphan on 27/01/2023.
//
//
import UIKit
import RxCocoa
import RxSwift
import EasyBaseCodes

class SelectPhotoVC: BaseViewController, SetupBaseCollection {
    
    // Add here outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Add here your view model
    var albumdModel: AlbumModels?
    private var viewModel: SelectPhotoVM = SelectPhotoVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupRX()
    }
    
}
extension SelectPhotoVC {
    
    private func setupUI() {
        // Add here the setup for the UI
        navigationType = .show
        customLeftBarButton(imgArrow: Asset.icBackWhite.image)
        guard let model = self.albumdModel else {
            return
        }
        title = model.getTitle()
        setupCollectionView(collectionView: collectionView,
                            delegate: self,
                            name: SelectPhotoCell.self)
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private func setupRX() {
        // Add here the setup for the RX
        Observable.just([1,2,3,4,5,6,7,8])
            .bind(to: self.collectionView.rx.items(cellIdentifier: SelectPhotoCell.identifier,
                                                   cellType: SelectPhotoCell.self)) { row, data, cell in
                cell.backgroundColor = .red
            }.disposed(by: disposeBag)
    }
}
extension SelectPhotoVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ManageCameraMakeUp.shared.calculateSizeCell(collectionView: collectionView,
                                                                numberOfCell: 4)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
}
