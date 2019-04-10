//
//  ViewController.swift
//  animation-demo
//
//  Created by Benjamin on 2019-04-10.
//  Copyright © 2019 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //let floatIn = -1000
    let headerView : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        return view
    }()
    
    let profileText: UITextView = {
        let text = UITextView(frame: .zero)
        return text
    }()
    
    let profileImageView: UIImageView = {
        let image = UIImage(named: "profile")
        let imageView = UIImageView(image: image )
        return imageView
    }()
    
    let profileTitle: UITextView = {
        let title = UITextView(frame: .zero)
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUi()
        
        //showProfile()
    }
    
    private func setupUi() {
        let screenSize = UIScreen.main.bounds
        let height = screenSize.height
        let width = screenSize.width
        
        let headerFrame = CGRect(x: width / 4 , y: 100, width: width / 2, height: 50)
        headerView.frame = headerFrame
        view.addSubview(headerView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(toogleProfile))
        headerView.addGestureRecognizer(tap)
        profileImageView.frame = CGRect(x: width / 4, y: 100, width: width/2, height: 200)
        profileImageView.alpha = 0
        view.addSubview(profileImageView)
        
        profileTitle.frame = CGRect(x: 1000, y: height / 2 - 50, width: width, height: 100)
        profileTitle.text = "Profile name"
        //profileTitle.sizeToFit()
        profileTitle.textAlignment = .center
        profileTitle.alpha = 0
        profileTitle.font = UIFont(name: "Verdana", size: 32)
        view.addSubview(profileTitle)
    }
    var isVisible = false
    @objc private func toogleProfile() {
        if !isVisible {
            showProfile()
        } else {
            hideProfile()
        }
        isVisible = !isVisible
    }
    
    private func showProfile() {
        UIView.animate(withDuration: 0.5, animations: {
            self.headerView.transform = CGAffineTransform(scaleX: 2, y: 1)
        }) { (finished) in
            UIView.animate(withDuration: 1, animations: {
                self.headerView.transform = CGAffineTransform(scaleX: 2, y: 8)
                self.profileTitle.transform = CGAffineTransform(translationX: -1000, y: 0)
                self.profileTitle.alpha = 1
            }) { (finished) in
                UIImageView.animate(withDuration: 1, animations: {
                    self.profileImageView.alpha = 1
                })
            }
        }
    }

    private func hideProfile() {
        UIImageView.animate(withDuration: 1, animations: {
            self.profileImageView.alpha = 0
        }) { (Bool) in
            UIView.animate(withDuration: 0.5, animations: {
                self.headerView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.profileTitle.transform = CGAffineTransform(translationX: 1000, y: 0)
                self.profileTitle.alpha = 0
            })
        }
    }
}

