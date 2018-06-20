
import UIKit

class CollectionView: UIView, UICollectionViewDataSource
{

    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.setupCollectionView()
    }

    @IBOutlet private var collectionView: UICollectionView!

    private func setupCollectionView()
    {
    }
    
    // MARK: - DATA SOURCE

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

}

