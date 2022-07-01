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
        // 네비게이션 아이템 추가
        // style: .plain -> 기본
        // selector는 objc에서 사용했던 것
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "toss", style: .plain, target: self, action: #selector(goToBellVC))

        navigationItem.rightBarButtonItems = [ UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(goToBellVC)) ,UIBarButtonItem(image: UIImage(systemName: "message.fill"), style: .plain, target: self, action: #selector(goToMessageVC)) ]
        
    }
    
    // 버튼 클릭했을때 사용
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

