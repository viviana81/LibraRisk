//
//  PlacesViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit
import PromiseKit

protocol PlacesViewControllerDelegate: class {
    func openDetail(withCollege college: College, andPlace place: Place)
}

class PlacesViewController: UIViewController {
    
    @IBOutlet weak var collegeTxtField: UITextField!
    @IBOutlet weak var placeTxtField: UITextField!
    
    weak var delegate: PlacesViewControllerDelegate?
    var selectedCollege: College?
    var selectedPlace: Place?
    var places: [Place] = []
    var colleges: [College] = []
    
    lazy var collegePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    lazy var placePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Collegi"
        collegeTxtField.inputView = collegePicker
        placeTxtField.inputView = placePicker
    }
    

    @IBAction func action() {
        
        guard let selectedCollege = selectedCollege,
            let selectedPlace = selectedPlace else { return }
        
        delegate?.openDetail(withCollege: selectedCollege, andPlace: selectedPlace)
        
    }
}

extension PlacesViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == collegePicker {
            return colleges.count
        } else {
            return places.count
        }
    }
}

extension PlacesViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == collegePicker {
            return colleges[row].name
        } else {
            return places[row].name
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == collegePicker {
            collegeTxtField.text = colleges[row].name
            selectedCollege =  colleges[row]
        } else {
            placeTxtField.text = places[row].name
            selectedPlace = places[row]
        }
        self.view.endEditing(true)
    }
}

