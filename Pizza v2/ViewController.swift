//
//  ViewController.swift
//  Pizza v2
//
//  Created by Pawel on 28.07.2016.
//  Copyright © 2016 LiczekCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var orderAndPaymentButton: UIButton!
    @IBAction func orderAndPayButton(sender: AnyObject) {
    }
    @IBOutlet weak var totalToPayLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    
    
    
    
    let section = ["Pizza", "Pasta", "Hot & Cold Drinks"]
    let items = [["Margarita", "Capriciosa"], ["Carbonara", "Bolonese"],["Tea", "CocaCola"]]
    let itemDescription = [["sauce & cheese", "sauce, cheese & mushrooms"], ["cheese, mushrooms, ham, cheese sauce", "cheese, tomato sauce, meet, onion"], ["black tea 150ml / 250ml", "bottle 200ml / 500ml"]]
    let normalItemPrice = [[14.00, 15.00], [18.00, 19.00], [5.00, 5.00]]
    let largeItemPrice = [[18.00, 19.00], [20.00, 21.00], [7.00, 8.00]]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.backgroundColor = UIColor.blackColor()
        self.view.backgroundColor = UIColor.blackColor()
    // topLabel configuration
        self.topLabel.backgroundColor = UIColor.blackColor()
        self.topLabel.textAlignment = NSTextAlignment.Center
        self.topLabel.text = "Pizza u Liczka"
        self.topLabel.text = "Pizza u Liczka Test2"
        self.topLabel.textColor = UIColor.whiteColor()
        self.topLabel.font = UIFont.systemFontOfSize(34)
        
    // bottom controller configuration
        orderAndPaymentButton.setTitle("Order & Pay", forState: UIControlState.Normal)
        orderAndPaymentButton.tintColor = UIColor.whiteColor()
        orderAndPaymentButton.backgroundColor = UIColor.redColor()
        orderAndPaymentButton.layer.cornerRadius = 10
    // Veryfication if any of product was chosen
        totalValueLabel.text = "0"
        totalValueLabel.textAlignment = NSTextAlignment.Center
        
        func veryficationOfTotalValue(text: String) -> Bool
        {
            var result = false
            
            if text != "0"
            {
                result = true
            }
            return result
        }
        
        if veryficationOfTotalValue(totalValueLabel.text!)
        {
            orderAndPaymentButton.enabled = true
            orderAndPaymentButton.setTitle("Order & Pay", forState: UIControlState.Normal)
            orderAndPaymentButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        }
        else
        {
            orderAndPaymentButton.enabled = false
            orderAndPaymentButton.setTitle("Choose sth", forState: UIControlState.Disabled)
            orderAndPaymentButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Disabled)
        }
        
        totalToPayLabel.text = "Total to pay:"
        totalToPayLabel.textColor = UIColor.redColor()
        
        totalValueLabel.textColor = UIColor.yellowColor()
//????????!!!!!!!!!!!!!!!
//      totalValueLabel.txt = suma wszystkich For items: czyli suma toPayLabel z każdego row.
//????????!!!!!!!!!!!!!!!
        
        
       
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapView")
        view.addGestureRecognizer(tap)
    }
    
    func tapView()
    {
        view.endEditing(true)
        
    }
        
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return section.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.tintColor = UIColor(red:0.97, green:0.39, blue:0.42, alpha:1.0)
        headerView.textLabel?.textColor = UIColor.darkGrayColor()
        headerView.textLabel?.textAlignment = NSTextAlignment.Center
        headerView.textLabel?.text?.uppercaseString
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rows = self.items[section]
        return rows.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ItemsTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ItemsTableViewCell
        cell.itemNameLabel.text = items[indexPath.section][indexPath.row]
        cell.itemDescriptionLabel.text = itemDescription[indexPath.section][indexPath.row]
        let normalPrice = normalItemPrice[indexPath.section][indexPath.row]
        cell.normalItemLabel.text = "Normal: \(String(format: "%.02f", normalPrice))zł"
        let largePrice = largeItemPrice[indexPath.section][indexPath.row]
        cell.largeItemLabel.text = "Large: \(String(format:"%.02f", largePrice))zł"
        let item = items[indexPath.section][indexPath.row]
        cell.forItemsLabel.text = "For \(item)s:"
        cell.backgroundColor = UIColor.redColor()
    // normalTextField configuration
        cell.normalTextField.backgroundColor = UIColor.blackColor()
        cell.normalTextField.textColor = UIColor.redColor()
        cell.normalTextField.text = String(0)
        cell.normalTextField.textAlignment = NSTextAlignment.Center
        cell.normalTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
        cell.normalTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        cell.normalTextField.clearsOnBeginEditing = true
        cell.normalTextField.keyboardType = UIKeyboardType.NumberPad
        
        
    // largeTextField configuration
        cell.largeTextField.backgroundColor = UIColor.blackColor()
        cell.largeTextField.textColor = UIColor.redColor()
        cell.largeTextField.text = String(0)
        cell.largeTextField.textAlignment = NSTextAlignment.Center
        cell.largeTextField.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
        cell.largeTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        cell.largeTextField.clearsOnBeginEditing = true
        cell.normalTextField.keyboardType = UIKeyboardType.NumberPad
        
    // toPayLabel
        let amountOfNormalItems: Double = Double(cell.normalTextField.text!)!
        let normalCostForItems: Double = normalPrice * amountOfNormalItems
        let amountOfLargeItems: Double = Double(cell.largeTextField.text!)!
        let largeCostForItems: Double = largePrice * amountOfLargeItems
        let toPayForItems = normalCostForItems + largeCostForItems
        cell.toPayLabel.text = String(toPayForItems)
        
        return cell
    }
    
    
    


}

