import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    static let identifier = "MyCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        image.contentMode = .scaleAspectFill
    }

    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }

    public func configure(with model: CellOption) {

        image.image = UIImage(named: model.iconName)
        titleLabel.text = model.title
        detailLabel.text = String(model.number)
    }

    override func prepareForReuse() {
        image.image = nil
        titleLabel.text = nil
        detailLabel.text = nil
    }
}
