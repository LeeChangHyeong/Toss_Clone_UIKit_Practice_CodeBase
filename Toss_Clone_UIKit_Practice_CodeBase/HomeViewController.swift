//
//  HomeViewController.swift
//  Toss_Clone_UIKit_Practice_CodeBase
//
//  Created by 이창형 on 2022/07/12.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var titleView: UILabel = UILabel()
    private var idField: UITextField = UITextField()
    private var pwField: UITextField = UITextField()
    private var loginButton: UIButton = UIButton()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            return cv
        }()
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        // 레지스터 구현을 해줘야 컬렉션 뷰에서 가져와서 사용 가능
        // 푸터는 젤 밑에
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        let bell = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(goToBellVC))
        let message = UIBarButtonItem(image: UIImage(systemName: "message.fill"), style: .plain, target: self, action: #selector(goToMessageVC))
        let tossImage = UIImage(named: "toss")?.resizeTo(size: CGSize(width: 120, height: 300))
        let tossButton = UIButton()
        tossButton.setBackgroundImage(tossImage, for: .normal)
        
        // view가 최상단
        view.backgroundColor = .systemGray6
        
        
        // MARK: 네비게이션 아이템 추가
        // style: .plain -> 기본
        // selector는 objc에서 사용했던 것
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: tossButton)
        navigationItem.leftBarButtonItem?.tintColor = .gray
        
        
        navigationItem.rightBarButtonItems = [bell, message]
        
        bell.tintColor = .gray
        message.tintColor = .gray
    }
   
    
    // MARK: 버튼 클릭했을때 사용
    @objc fileprivate func goToBellVC(){
        // 객체 인스턴스 생성
        let bellVC = BellViewController()
        // 푸쉬한다
        self.navigationController?.pushViewController(bellVC, animated: true)
    }
    
    @objc fileprivate func goToMessageVC(){
        let messageVC = MessageViewController()
        // 푸쉬한다
        self.navigationController?.pushViewController(messageVC, animated: true)
    }
    
    
}

// 이미지 사이즈 줄여 줌
extension UIImage {
    func resizeTo(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { _ in
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: size))
        }
        
        return image.withRenderingMode(self.renderingMode)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else if section == 1 {
            return 4
        } else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .black
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            headerView.backgroundColor = .blue
            
            return headerView
            
        }else {
            return UICollectionReusableView()
        }
        
    }
    
    // 셀의 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 컬렉션뷰 자체의 전체 width - 32
        // 왼쪽 오른쪽 16씩 뺌


        return CGSize(width: collectionView.frame.width - 16, height: 100)
    }
    
    
    // 헤더 위치
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let value:CGFloat = 16.0
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    // 헤더의 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        
        return CGSize(width: collectionView.frame.width / 2, height: 50)
    }
    
    
}
