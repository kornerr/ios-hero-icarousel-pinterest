
import UIKit

class UICollectionViewCellTemplate<ItemView: UIView>: UICollectionViewCell
{

    var itemView: ItemView!

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        // Load and embed item view.
        self.itemView = ItemView.loadFromNib()
        self.contentView.embeddedView = self.itemView
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("UICollectionViewTemplateCell. ERROR: init(coder:) has not been implemented")
    }

}

