import UIKit

class GridViewController: UIViewController {
    
    let vm = MovieViewModel()
    
    
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
        
        
        vm.fetchPopularMoviesData { [weak self] in
            DispatchQueue.main.async {
                self?.gridCollectionView?.reloadData()
                print(self?.gridCollectionView)
            }
            
//            print(self?.vm.cellForRowAt(indexPath: IndexPath(row: 0, section: 0)))
//            self?.gridCollectionView?.reloadData()
            
        }
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

extension GridViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.numberOfRowsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(vm.cellForRowAt(indexPath: indexPath))
        let model = vm.cellForRowAt(indexPath: indexPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCollectionViewCell.identifier, for: indexPath) as! GridCollectionViewCell
        cell.configure(with: model)
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        self.navigationController?.pushViewController(desVC, animated: true)
        print(navigationController)
        print(desVC)
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
