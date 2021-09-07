import UIKit

class GridViewController: UIViewController {
    
   
    
    private var model: [String]?
    var randomPictures = ["car1", "cat1", "panda1","car1", "cat1", "cat1", "panda1","car1", "cat1", "cat1", "panda1","car1", "cat1", "cat1", "panda1","car1", "cat1"]
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var gridCollectionView: UICollectionView?
//    @IBOutlet weak var likeImageViewWidthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model = randomPictures
        
        favButton?.tintColor = UIColor.cyan
        
        gridCollectionView?.register(UINib(nibName: "GridCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GridCollectionViewCell")
        gridCollectionView?.dataSource = self
        gridCollectionView?.delegate = self
        
        
    }
    
    
//
//    lazy var likeAnimator = FavAnimator(container: UIContentView, layoutConstraint: likeImageViewWidthConstraint)
//    //MARK implementation of animations on singleTap
//    lazy var singleTapRecognizer: UITapGestureRecognizer = {
//
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
//        tapRecognizer.numberOfTapsRequired = 1
//        return tapRecognizer
//    }()
    
}

extension GridViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let model = model else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCollectionViewCell.identifier, for: indexPath) as! GridCollectionViewCell
        cell.configure(with: model[indexPath.row])
        return cell
    }
    
    
    
    
  
    
    
//    @objc
//    func didTap() {
//
//        let isLiked = self.favButton.isSelected
//        if isLiked == false {
//            FavAnimator.animate { [weak self] in
//                self?.favButton.tintColor = UIColor.systemPink
//                self?.favButton.isSelected = true
//            }
//        }
//        else {
//            FavAnimator.animate { [weak self] in
//                self?.favButton.tintColor = UIColor.black
//                self?.favButton.isSelected = false
//            }
//        }
//    }
    
}
