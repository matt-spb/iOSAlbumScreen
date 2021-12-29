import UIKit

class CollectionTableViewCell: UITableViewCell {

    static let identifier = "CollectionTableViewCell"
    @IBOutlet weak var collection: UICollectionView!

    var model = Model()

    override func awakeFromNib() {
        super.awakeFromNib()
        collection.delegate = self
        collection.dataSource = self
        collection.register(MyCollectionViewCell.nib(),
                            forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    }

    static func nib() -> UINib {
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }

    public func configure(with model: Model) {
        self.model = model
    }
}

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch model.type {
            case .myAlbums:
                return model.myAlbums.count
            case .sharedAlbums:
                return model.sharedAlbums.count
            case .peopleAndPlaces:
                return model.peopleAndPlaces.count
            default:
                return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch model.type {
            case .myAlbums:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier,
                                                              for: indexPath) as! MyCollectionViewCell
                cell.configure(with: model.myAlbums[indexPath.row])
                return cell

            case .sharedAlbums:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier,
                                                              for: indexPath) as! MyCollectionViewCell
                cell.configure(with: model.sharedAlbums[indexPath.row])
                return cell

            case .peopleAndPlaces:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier,
                                                              for: indexPath) as! MyCollectionViewCell
                cell.configure(with: model.peopleAndPlaces[indexPath.row])
                return cell
                
            default:
                return UICollectionViewCell()
        }
    }
}

extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200.0, height: 280.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
