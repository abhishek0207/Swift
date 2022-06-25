//
//  ViewController.swift
//  HWSProject15
//
//  Created by Ahuja, Abhishek on 6/5/22.
//

import UIKit

class ViewController: UIViewController {
//    var imageView: UIImageView!
//    var nameLabel : UILabel!
//    var descriptionText : UILabel!
    var customTitle: UILabel!
    var collectionView : UICollectionView!

    override func viewWillLayoutSubviews() {
        customTitle  = UILabel()
        customTitle.text = "My personal collection <3"
        customTitle.translatesAutoresizingMaskIntoConstraints = false


        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        collectionView = UICollectionView(frame: CGRect(x: 0, y: 150, width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .red
        collectionView.register(MyCustomCell.self, forCellWithReuseIdentifier: "custom")
        view.addSubview(customTitle)
        view.addSubview(collectionView)

        customTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        customTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
//        imageView = UIImageView(image: UIImage(named: "penguin"))
//        nameLabel = UILabel()
//        nameLabel.text = "Abhishek Ahuja"
//        descriptionText = UILabel()
//        descriptionText.text = "Abhishek Ahuja is an upcoming ios developer currently working with amazon music where he is working on his ios dev skills"
//        descriptionText.lineBreakMode = .byWordWrapping
//        descriptionText.numberOfLines = 0
//        view.addSubview(imageView)
//        view.addSubview(nameLabel)
//        view.addSubview(descriptionText)
//
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        descriptionText.translatesAutoresizingMaskIntoConstraints = false
//        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
//        imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant:  60).isActive = true
//        nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        descriptionText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
//        descriptionText.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
//        descriptionText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
//
//        imageView.sizeToFit()

    }
}

extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell tapped")
    }
}
extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath) as! MyCustomCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

}
//extension ViewController : UICollectionViewDelegateFlowLayout {
//
//}
