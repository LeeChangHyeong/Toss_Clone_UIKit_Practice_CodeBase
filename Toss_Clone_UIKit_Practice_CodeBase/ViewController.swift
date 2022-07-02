//
//  ViewController.swift
//  Toss_Clone_UIKit_Practice_CodeBase
//
//  Created by 이창형 on 2022/07/01.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.title = "뷰컨트롤러 No StoryBoard"
        // view가 최상단
        self.view.backgroundColor = .white

        
        // MARK: 스크롤 뷰 생성
        let scrollView : UIScrollView! = UIScrollView()
        let contentView : UIView! = UIView()
        
        // scrollView와 contentView의 위치와 제약을 걸어준다
        // scrollView와 contentView에 autolayout을 적용하기 위해 translatesAutoresizingMaskIntoConstraints = false
        // view에는 scrollView를 scrollView에는 contentView를 올려준다
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // scrollView를 화면의 safeArea에 딱 맞게 맞춰준다
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        
        // contentView는 scrollView의 contentLayoutGuide와 동일하게 잡아준다
        // 만드려는 contentView의 전체 높이는 scrollView가 보여지는 영역보다 커질 수 있으므로 frameLayoutGuide가 아닌 contentLayoutGuide와 맞춰준다
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
        ])
        
        // 이후 수직 스크롤을 적용하기 위해 contentView와 scrollView의 width를 동일하게 잡아주고 height를 동일하게 잡아주되 priority값을 조정하여 scroll될 수 있도록 한다!
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        
//        let image = UIImage(systemName: "bell.fill")?.withRenderingMode(.alwaysTemplate)
        
        // MARK: 네비게이션 아이템 추가
        // style: .plain -> 기본
        // selector는 objc에서 사용했던 것
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "toss", style: .plain, target: self, action: #selector(goToBellVC))
       

        navigationItem.rightBarButtonItems = [ UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(goToBellVC)) ,UIBarButtonItem(image: UIImage(systemName: "message.fill"), style: .plain, target: self, action: #selector(goToMessageVC)) ]
        
        navigationController?.navigationBar.tintColor = .systemGray
        
        
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

