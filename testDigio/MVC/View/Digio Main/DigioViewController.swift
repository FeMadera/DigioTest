//
//  ViewController.swift
//  testDigio
//
//  Created by Felipe madeira on 20/11/20.
//

import UIKit

protocol DigioViewControllerDelegate:class {
    func reloadData()
}

class DigioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DigioViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var presenter : DigioTableViewPresenterDelegate? = DigioTableViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setupCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.presenter?.getProductsList({ (digio) in
            self.presenter?.products = digio
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })
    }
    
    //MARK: - DelegateController
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Methods
    func setupCell() {
        registerCell()
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: String(describing: DigioSpotlighTableCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DigioSpotlighTableCell.self))
        tableView.register(UINib(nibName: String(describing: DigioCashTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DigioCashTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: DigioProductTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DigioProductTableViewCell.self))
    }
    
    func createHeader(title: String, titleContrast: String , iconImg: String = "") -> UIView {
        let header = (Bundle.main.loadNibNamed("DigioHeaderView", owner: self, options: nil)![0] as? UIView) as? DigioHeaderView
        header?.title.text = title
        header?.titleContrast.text = titleContrast
        header?.icIcone.image = UIImage(named: iconImg)
        if iconImg == "" {
            header?.icIcone.frame.size = CGSize(width: 0.0, height: 0.0)
            header?.leftConstraint.constant = 12.0
            header?.leftLblConstraint.constant =  1.0
        }
        return header ?? UIView()
    }
    
    //MARK: - TablewView Delegate/DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellSpotlight : DigioSpotlighTableCell = DigioSpotlighTableCell.createCell(tableView, indexPath: indexPath)
            cellSpotlight.fill(with: digioSpotlightTCellDTO(products: presenter?.products))
            cellSpotlight.backgroundColor = .clear
            return cellSpotlight
        case 1:
            guard let product = presenter?.products else {return UITableViewCell() }
            let cellCash : DigioCashTableViewCell = DigioCashTableViewCell.createCell(tableView, indexPath: indexPath)
            cellCash.fill(with: DigioCashTableViewCellDTO(products: product))
            cellCash.backgroundColor = .clear
            return cellCash
        case 2:
            guard let product = presenter?.products else {return UITableViewCell() }
            let cellProduct : DigioProductTableViewCell = DigioProductTableViewCell.createCell(tableView, indexPath: indexPath)
            cellProduct.fill(with: DigioProductTableViewCellDTO(products: product))
            cellProduct.backgroundColor = .clear
            return cellProduct
        default:
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200.0
        case 1:
            return 135.0
        case 2:
            return 160.0
        default:
            return 12.0
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 28.0
        case 1:
            return 22.0
        case 2:
            return 22.0
        default:
            return 12.0
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return createHeader(title: "Olá, Maria", titleContrast: "", iconImg: "logo")
        case 1:
            return createHeader(title: "digio", titleContrast: "Cash")
        case 2:
            return createHeader(title: "Produto", titleContrast: "")
        default:
            return nil
        }
    }
}



