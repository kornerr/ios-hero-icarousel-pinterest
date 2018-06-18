
import UIKit

class SectionsItemView: UIView {

    // MARK: - SETUP

    //weak var delegate: Delegate?

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    // MARK: - IMAGE

    var image: UIImage?
    {
        get
        {
            return _image
        }
        set
        {
            _image = newValue
            self.updateImage()
        }
    }
    private var _image: UIImage?

    @IBOutlet private var imageView: UIImageView!

    private func updateImage()
    {
        if let image = self.image
        {
            self.imageView?.image = image
        }
    }
    
}

