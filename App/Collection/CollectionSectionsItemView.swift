
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

    // MARK: - IMAGE

    var image: UIImage?
    {
        get
        {
            return self.imageView?.image
        }
        set
        {
            self.imageView?.image = newValue
        }
    }
    
    @IBOutlet private var imageView: UIImageView!
    
}

