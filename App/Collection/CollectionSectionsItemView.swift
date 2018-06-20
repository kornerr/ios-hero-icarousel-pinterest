
import UIKit

class CollectionSectionsItemView: UIView
{

    // MARK: - SETUP

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    // MARK: - SIZE

    class func size() -> CGSize
    {
        let value = 100
        return CGSize(width: value, height: value)
    }
    
}

