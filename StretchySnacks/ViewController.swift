//
//  ViewController.swift
//  StretchySnacks
//
//  Created by NICE on 2018-09-13.
//  Copyright © 2018 NICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var navBar: UIView!
  @IBOutlet weak var plusButton: UIButton!
  @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
  
  
  var isExpanded = false
  var height: CGFloat?
  var angle: CGFloat?
  
  let stackView = UIStackView()
  let imageView1 = UIImageView()
  let imageView2 = UIImageView()
  let imageView3 = UIImageView()
  let imageView4 = UIImageView()
  let imageView5 = UIImageView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    stackView.addArrangedSubview(imageView1)
    stackView.addArrangedSubview(imageView2)
    stackView.addArrangedSubview(imageView3)
    stackView.addArrangedSubview(imageView4)
    stackView.addArrangedSubview(imageView5)

    
    imageView1.backgroundColor = .red
    imageView1.translatesAutoresizingMaskIntoConstraints = false

    imageView1.leftAnchor.constraint(equalTo: stackView.leftAnchor).isActive = true
    imageView1.rightAnchor.constraint(equalTo: imageView2.leftAnchor).isActive = true
    imageView1.heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true
    
    
    imageView2.backgroundColor = .orange
    imageView2.translatesAutoresizingMaskIntoConstraints = false
    
    imageView2.leftAnchor.constraint(equalTo: imageView1.rightAnchor).isActive = true
    imageView2.rightAnchor.constraint(equalTo: imageView3.leftAnchor).isActive = true
    imageView2.heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true
    
    imageView3.backgroundColor = .yellow
    imageView3.translatesAutoresizingMaskIntoConstraints = false
    
    imageView3.leftAnchor.constraint(equalTo: imageView2.rightAnchor).isActive = true
    imageView3.rightAnchor.constraint(equalTo: imageView4.leftAnchor).isActive = true
    imageView3.heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true
  
    imageView4.backgroundColor = .blue
    imageView4.translatesAutoresizingMaskIntoConstraints = false
    
    imageView4.leftAnchor.constraint(equalTo: imageView3.rightAnchor).isActive = true
    imageView4.rightAnchor.constraint(equalTo: imageView5.leftAnchor).isActive = true
    imageView4.heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true
    
    imageView5.backgroundColor = .green
    imageView5.translatesAutoresizingMaskIntoConstraints = false
    
    imageView5.leftAnchor.constraint(equalTo: imageView4.rightAnchor).isActive = true
    imageView5.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
    imageView5.heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true

    stackView.isHidden = true
    stackView.backgroundColor = .black
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.translatesAutoresizingMaskIntoConstraints = false
    self.navBar.addSubview(stackView)

    stackView.leftAnchor.constraint(equalTo: self.navBar.leftAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: self.navBar.bottomAnchor).isActive = true
    stackView.rightAnchor.constraint(equalTo: self.navBar.rightAnchor).isActive = true
    stackView.topAnchor.constraint(equalTo: self.navBar.topAnchor, constant: 50).isActive = true
  }



  @IBAction func plusButton(_ sender: UIButton) {
    isExpanded = isExpanded == false ? true : false
    updateView()
  }
  
  private func updateView() {
    //2:TODO - implement animation for adjusting height constant
    
    if isExpanded == true {
      stackView.isHidden = false
      height = CGFloat(220.0)
      angle = CGFloat.pi/4
    } else {
      stackView.isHidden = true
      height = CGFloat(64.0)
      angle = CGFloat.pi/2
    }
    
    self.navBarHeightConstraint.constant = height!

    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
      self.view.layoutIfNeeded()
    }) { (completion) in
      print("navBar moved!")
    }
    
    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: {
      self.plusButton.transform = CGAffineTransform(rotationAngle: self.angle!)
    }) { (completion) in
      print("plusButton rotated!")
    }
  }
  
}

