
import UIKit

class UITableViewCellTemplate<ItemView: UIView>: UITableViewCell
{

    var itemView: ItemView!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Load and embed item view.
        self.itemView = ItemView.loadFromNib()
        self.contentView.embeddedView = self.itemView
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("UITableViewTemplateCell. ERROR: init(coder:) has not been implemented")
    }

}

