
import iCarousel
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
    }

    // MARK: - ITEMS

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

    // MARK: - SELECTED ITEM

    var selectedItemIdChanged: SimpleCallback?
    var selectedItemId: Int
    {
        get
        {
            return self.carouselView.currentItemIndex
        }
        set
        {
            self.carouselView.currentItemIndex = newValue
        }
    }
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel)
    {
        if let report = self.selectedItemIdChanged
        {
            report()
        }
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
            let item = self.items[index]
            return self.createCarouselItemView(item)
        }
    }

    private func createCarouselItemView(_ item: SectionsItem) -> UIView
    {
        let view = SectionsItemView()
        view.image = item.image

        // Resize.
        let height = self.frame.size.height
        let geom = CGRect(x: 0, y: 0, width: ITEM_WIDTH, height: height)
        view.frame = geom

        return view
    }

}

