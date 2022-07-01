//
//  ViewController.swift
//  Toss_Clone_UIKit_Practice_CodeBase
//
//  Created by 이창형 on 2022/07/01.
//

import UIKit

class ViewController: UIViewController {
    // 메시지 아이콘 버튼 설정
    let messageIcon = UIBarButtonItem(image: UIImage(systemName: "message.fill"), style: .plain, target: self, action: #selector(goToMessageVC))
    // 벨 아이콘 버튼 설정
    let bellIcon = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(goToMessageVC))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.title = "뷰컨트롤러 No StoryBoard"
        
        // view가 최상단
        self.view.backgroundColor = .white
        // 네비게이션 아이템 추가
        // style: .plain -> 기본
        // selector는 objc에서 사용했던 것
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "toss", style: .plain, target: self, action: #selector(goToProfileVC))
        
        navigationItem.rightBarButtonItems = [bellIcon, messageIcon]
        
    }
    // 버튼 클릭했을때 사용
    @objc fileprivate func goToProfileVC(){
        print("press")
        // 객체 인스턴스 생성
        let profileVC = MessageViewController()
        // 푸쉬한다
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc fileprivate func goToMessageVC(){
        print("hi")
        
        let messageVC = MessageViewController()
        // 푸쉬한다
        self.navigationController?.pushViewController(messageVC, animated: true)
    }


}

