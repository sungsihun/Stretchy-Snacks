//
//  ViewController.swift
//  StretchySnacks
//
//  Created by NICE on 2018-09-13.
//  Copyright © 2018 NICE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

  @IBOutlet weak var navBar: UIView!
  @IBOutlet weak var plusButton: UIButton!
  @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var tableView: UITableView!
  
  var isExpanded = false
  var height: CGFloat?
  var angle: CGFloat?
  var titleLabelcenterYAnchorConstant: CGFloat?
  
  let stackView = UIStackView()
  let imageView1 = UIImageView()
  let imageView2 = UIImageView()
  let imageView3 = UIImageView()
  let imageView4 = UIImageView()
  let imageView5 = UIImageView()
  let titleLabel = UILabel()

  var tapGesture = UITapGestureRecognizer()
  
  var snacks = [String]()
  
  var titleLabelConstraintYCenter: NSLayoutConstraint!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // add navBar
    
    navBar.addSubview(titleLabel)
    titleLabel.text = "SNACKS"
    titleLabel.font = UIFont.systemFont(ofSize: 25)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
    titleLabel.centerXAnchor.constraint(equalTo: navBar.centerXAnchor).isActive = true
    
    self.titleLabelConstraintYCenter = titleLabel.centerYAnchor.constraint(equalTo: navBar.centerYAnchor)
    self.titleLabelConstraintYCenter.isActive = true

    // stackView setup
    
    stackViewSetup()
    
    // add tapGesture to Image view
    
    imageView1.tag = 1
    imageView2.tag = 2
    imageView3.tag = 3
    imageView4.tag = 4
    imageView5.tag = 5

    self.addTapGesturetoImageView(imageView: imageView1)
    self.addTapGesturetoImageView(imageView: imageView2)
    self.addTapGesturetoImageView(imageView: imageView3)
    self.addTapGesturetoImageView(imageView: imageView4)
    self.addTapGesturetoImageView(imageView: imageView5)
  }
  
  func addTapGesturetoImageView(imageView: UIImageView) {
    imageView.isUserInteractionEnabled = true
    tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(recognizer:)))
    tapGesture.numberOfTapsRequired = 1
    imageView.addGestureRecognizer(tapGesture)
  }
  

  @IBAction func plusButton(_ sender: UIButton) {
    isExpanded = isExpanded == false ? true : false
    updateView()
  }
  
  private func updateView() {
    if isExpanded == true {
      
      // stack view update
      stackView.isHidden = false
      height = CGFloat(220.0)
      angle = CGFloat.pi/4

      // title label update
      titleLabel.font = UIFont.systemFont(ofSize: 25)
      titleLabel.text = "Add a SNACK"
      self.titleLabelConstraintYCenter.constant = -40
      
    } else {
      
      // stack view update
      stackView.isHidden = true
      height = CGFloat(44.0)
      angle = CGFloat.pi/2
      
      // title label update
      titleLabel.font = UIFont.systemFont(ofSize: 25)
      titleLabel.text = "SNACKS"
      self.titleLabelConstraintYCenter.constant = 0

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
  
  func stackViewSetup() {
    stackView.addArrangedSubview(imageView1)
    stackView.addArrangedSubview(imageView2)
    stackView.addArrangedSubview(imageView3)
    stackView.addArrangedSubview(imageView4)
    stackView.addArrangedSubview(imageView5)
    
    // imageView 1
    
    imageView1.image = UIImage(named: "oreos")
    imageView1.translatesAutoresizingMaskIntoConstraints = false
    
    imageView1.leftAnchor.constraint(equalTo: stackView.leftAnchor).isActive = true
    imageView1.rightAnchor.constraint(equalTo: imageView2.leftAnchor).isActive = true
    
    // imageView 2
    
    imageView2.image = UIImage(named: "pizza_pockets")
    imageView2.translatesAutoresizingMaskIntoConstraints = false
    
    imageView2.leftAnchor.constraint(equalTo: imageView1.rightAnchor).isActive = true
    imageView2.rightAnchor.constraint(equalTo: imageView3.leftAnchor).isActive = true
    
    // imageView 3
    
    imageView3.image = UIImage(named: "pop_tarts")
    imageView3.translatesAutoresizingMaskIntoConstraints = false
    
    imageView3.leftAnchor.constraint(equalTo: imageView2.rightAnchor).isActive = true
    imageView3.rightAnchor.constraint(equalTo: imageView4.leftAnchor).isActive = true
    
    // imageView 4
    
    imageView4.image = UIImage(named: "popsicle")
    imageView4.translatesAutoresizingMaskIntoConstraints = false
    
    imageView4.leftAnchor.constraint(equalTo: imageView3.rightAnchor).isActive = true
    imageView4.rightAnchor.constraint(equalTo: imageView5.leftAnchor).isActive = true
    
    // imageView 5
    
    imageView5.image = UIImage(named: "ramen")
    imageView5.translatesAutoresizingMaskIntoConstraints = false
    
    imageView5.leftAnchor.constraint(equalTo: imageView4.rightAnchor).isActive = true
    imageView5.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
    
    // stackView
    
    stackView.isHidden = true
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.translatesAutoresizingMaskIntoConstraints = false
    self.navBar.addSubview(stackView)
    
    stackView.leftAnchor.constraint(equalTo: self.navBar.leftAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: self.navBar.bottomAnchor).isActive = true
    stackView.rightAnchor.constraint(equalTo: self.navBar.rightAnchor).isActive = true
    stackView.topAnchor.constraint(equalTo: self.navBar.topAnchor, constant: 100).isActive = true
  }
  
  // Tap Gesture
  
  @objc func handleTap(recognizer: UITapGestureRecognizer) {
    let tag = recognizer.view?.tag
    
    switch tag {
    case 1:
      self.snacks.append("Oreos")
    case 2:
      self.snacks.append("Pizza Pockets")
    case 3:
      self.snacks.append("Pop Tarts")
    case 4:
      self.snacks.append("Popsicle")
    case 5:
      self.snacks.append("Ramen")
    default:
      return
    }
    tableView.reloadData()
  }
}

extension ViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.snacks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    
    cell.label.text = self.snacks[indexPath.row]
    
    return cell
  }
}

