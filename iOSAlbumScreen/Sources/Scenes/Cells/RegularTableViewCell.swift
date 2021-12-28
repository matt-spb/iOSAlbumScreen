import UIKit

class RegularTableViewCell: UITableViewCell {

    static let identifier = "RegularTableViewCell"

    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 21)

        return label
    }()

    lazy var icon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .systemGray
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail

        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
        accessoryType = .disclosureIndicator
        contentView.addSubview(label)
        contentView.addSubview(icon)
        contentView.addSubview(detailLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let iconHeight = contentView.frame.size.height - 12

        icon.frame = CGRect(x: 7,
                            y: (contentView.frame.size.height - iconHeight) / 2,
                            width: iconHeight,
                            height: iconHeight)

//        icon.clipsToBounds = true

        label.frame = CGRect(x: iconHeight + 18,
                             y: 0,
                             width: contentView.bounds.size.width - iconHeight - 10,
                             height: contentView.bounds.size.height)

        detailLabel.frame = CGRect(x: contentView.frame.size.width / 2,
                                   y: 0,
                                   width: contentView.frame.size.width / 2 - 10,
                                   height: contentView.bounds.size.height)
    }

    public func configure(with model: CellOption) {
        icon.image = UIImage(systemName: model.iconName)
        label.text = model.title
        detailLabel.text = String(model.number)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        icon.image = nil
        detailLabel.text = nil
    }
}
