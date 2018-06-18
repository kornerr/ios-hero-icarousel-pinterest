
import UIKit

class SrcView: UIView
{

    // MARK: - SETUP

    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    @IBOutlet var sheetView: UIView!

    // MARK: - SHOW

    var showReport: SimpleCallback?
    
    @IBAction func show(_ sender: Any)
    {
        if let report = showReport
        {
            report()
        }
    }
    
}

