//
//  FilterViewController.swift
//  TestProject
//
//  Created by Rami on 12/10/23.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var countryPickerView: UIPickerView!
    
    let countries = ["United States", "Canada", "United Kingdom", "Germany", "Australia", "France"]
    
    var currentSelectedCountry: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        currentSelectedCountry = countries[0]
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        UserDefaults.standard.setValue(currentSelectedCountry, forKey: "currentSelectedCountry")
    }
}

extension FilterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = countries[row]
        currentSelectedCountry = selectedValue
    }
    
    
}
