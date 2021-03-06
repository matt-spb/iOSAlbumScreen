import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {

    static let identifier = "CustomHeaderView"
    var contentViewSize = CGSize()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()

    let detailButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailButton)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        titleLabel.frame = CGRect(x: 16,
                                  y: 0,
                                  width: 200,
                                  height: 30)

        detailButton.frame = CGRect(x: contentViewSize.width - 85,
                                    y: 0,
                                    width: 80,
                                    height: 30)
    }

    public func configure(with model: [String: String]) {
        titleLabel.text = model.keys.first
        detailButton.setTitle(model.values.first, for: .normal)
    }

    override func prepareForReuse() {
        titleLabel.text = nil
        detailButton.setTitle(nil, for: .normal)
    }
}
