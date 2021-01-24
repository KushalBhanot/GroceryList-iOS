//
//  ViewController.swift
//  GroceryList
//
//  Created by kushal on 13/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    var appTitle: UILabel!
    
    var itemLabel: UILabel!
    var itemInput: UITextField!
    
    var quantityLabel: UILabel!
    var quantityInput: UITextField!
    
    var addItem: UIButton!
    
    var displayList: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        appTitle = UILabel()
        appTitle.translatesAutoresizingMaskIntoConstraints = false
        appTitle.text = "Grocery List"
        appTitle.textAlignment = .center
        appTitle.font = .systemFont(ofSize: 20, weight: .bold)
        view.addSubview(appTitle)
        
        itemLabel = UILabel()
        itemLabel.text = "Grocery Item: "
        itemLabel.textColor = .black
        itemLabel.textAlignment = .center
        itemLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemLabel)
        
        itemInput = UITextField()
        itemInput.translatesAutoresizingMaskIntoConstraints = false
        itemInput.borderStyle = .roundedRect
        itemInput.placeholder = "Input the item here"
        view.addSubview(itemInput)
        
        quantityLabel = UILabel()
        quantityLabel.text = "Quantity: "
        quantityLabel.textColor = .black
        quantityLabel.textAlignment = .center
        quantityLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quantityLabel)
        
        quantityInput = UITextField()
        quantityInput.translatesAutoresizingMaskIntoConstraints = false
        quantityInput.borderStyle = .roundedRect
        quantityInput.placeholder = "Input the quantity here"
        view.addSubview(quantityInput)
        
        addItem = UIButton()
        addItem.setTitle("Add Item", for: .normal)
        addItem.setTitleColor(.blue, for: .normal)
        addItem.translatesAutoresizingMaskIntoConstraints = false
        addItem.layer.borderWidth = 1
        addItem.layer.borderColor = UIColor.blue.cgColor
        addItem.layer.cornerRadius = 10
        addItem.addTarget(self, action: #selector(appendItemToList), for: .touchUpInside)
        view.addSubview(addItem)
        
        displayList = UITextView()
        displayList.translatesAutoresizingMaskIntoConstraints = false
        displayList.isEditable = false
        displayList.isHidden = false
        displayList.font = .systemFont(ofSize: 20, weight: .medium)
        displayList.text = ""
        view.addSubview(displayList)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            appTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            appTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appTitle.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: appTitle.bottomAnchor, constant: 20),
            itemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            itemLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            itemInput.topAnchor.constraint(equalTo: appTitle.bottomAnchor, constant: 20),
            itemInput.leadingAnchor.constraint(equalTo: itemLabel.trailingAnchor, constant: 10),
            itemInput.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 20),
            quantityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            quantityLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            quantityInput.topAnchor.constraint(equalTo: itemInput.bottomAnchor, constant: 20),
            quantityInput.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 10),
            quantityInput.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            addItem.topAnchor.constraint(equalTo: quantityInput.bottomAnchor, constant: 40),
            addItem.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addItem.widthAnchor.constraint(equalToConstant: 100),
            addItem.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            displayList.topAnchor.constraint(equalTo: addItem.bottomAnchor, constant: 40),
            displayList.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            displayList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            displayList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            displayList.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    @objc func appendItemToList() {
        let item = itemInput.text!
        let quantity = quantityInput.text!
        
        itemInput.text = ""
        quantityInput.text = ""
        itemInput.placeholder = "Type something..."
        quantityInput.placeholder = "Type something...."
        
        displayList.text = displayList.text! + "\n" + "\(item)" + ": " + "\(quantity)"
    }
}

