
import iCarousel
import SkeletonView
import UIKit

private func SECTIONS_VIEW_LOG(_ message: String)
{
    NSLog("SectionsView \(message)")
}

// TODO Take view width as the base.
private let ITEM_WIDTH: CGFloat = 200

private let BOUNCE_DISTANCE: CGFloat = 0.2

class SectionsView: UIView, iCarouselDataSource, iCarouselDelegate
{

    // MARK: - SETUP

    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.setupCarousel()
        self.isSkeletonable = true
    }

    var items: [SectionsItem]
    {
        get
        {
            return _items
        }
        set
        {
            _items = newValue
            self.updateItems()
        }
    }
    private var _items = [SectionsItem]()

    private func updateItems()
    {
        self.carouselView.reloadData()
    }

    // MARK: - CAROUSEL
    
    @IBOutlet private var carouselView: iCarousel!

    private func setupCarousel()
    {
        self.carouselView.dataSource = self
        self.carouselView.delegate = self
        self.carouselView.bounceDistance = BOUNCE_DISTANCE
        self.carouselView.isPagingEnabled = true
        self.carouselView.type = .coverFlow
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int
    {
        return self.items.count
    }

    func carousel(
        _ carousel: iCarousel,
        viewForItemAt index: Int,
        reusing view: UIView?
    ) -> UIView {
        // Reuse old view.
        if let view = view
        {
            return view
        }
        // Create new view.
        else
        {
            return self.createCarouselItemView()
        }
    }

    private func createCarouselItemView() -> UIView
    {
        let view = SectionsItemView()
        view.backgroundColor = .red
        view.isSkeletonable = true
        // Resize.
        let height = self.frame.size.height
        let geom = CGRect(x: 0, y: 0, width: ITEM_WIDTH, height: height)
        view.frame = geom

        return view
    }

}

