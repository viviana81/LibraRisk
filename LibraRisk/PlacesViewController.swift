//
//  PlacesViewController.swift
//  LibraRisk
//
//  Created by Viviana Capolvenere on 29/04/2020.
//  Copyright © 2020 Viviana Capolvenere. All rights reserved.
//

import UIKit
import PromiseKit

class PlacesViewController: UIViewController {
    
    @IBOutlet weak var collegeTxtField: UITextField!
    @IBOutlet weak var placeTxtField: UITextField!
    private let services: Services
    
    var selectedCollege: College?
    var selectedPlace: Place?
    
    init(services: Services) {
        self.services = services
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
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
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        // IN PARALLELO
        let placesPromise = getPlaces()
        let collegesPromise = getColleges()
        
        firstly {
            when(fulfilled: placesPromise, collegesPromise)
        }.done { places, colleges in
            self.places = places
            self.colleges = colleges
        }.ensure {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }.catch { error in
            print(error)
        }
        
        /* IN SERIE
        firstly { // Inizia con...
            placesPromise
        }.then { myPlaces -> Promise<[College]> in // quindi fai...
            self.places = myPlaces
            return collegesPromise
        }.done { myColleges in // in conclusione...
            self.colleges = myColleges
            // Qui è il punto in cui la catena di chiamate ha finito (punto in cui fare solitamente reloadData o popolare la UI)
        }.ensure { // assicurati che..
            // Scatta in qualsiasi caso, sia Done che Catch
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }.catch { error in // in caso di errore..
            print(error)
        }
    */
    }
    
    func getPlaces() -> Promise<[Place]> {
        
        return Promise<[Place]> { seal in
            
            services.getPlaces { (places, error) in
                if let places = places {
                    seal.fulfill(places)
                } else if let error = error {
                    seal.reject(error)
                }
            }
        }
    }
    
    func getColleges() -> Promise<[College]> {
        
        return Promise<[College]> { seal in
            
            services.getColleges { (colleges, error) in
                if let colleges = colleges {
                    seal.fulfill(colleges)
                } else if let error = error {
                    seal.reject(error)
                }
            }
        }
    }
    
    @IBAction func action() {
        
        guard let selectedCollege = selectedCollege,
            let selectedPlace = selectedPlace else { return }
        
        services.getCollegeResponse(place: selectedPlace, college: selectedCollege) { (collegeResponse, error) in
           
            if let collegeResponse = collegeResponse {
                let detail = DetailCollegeViewController(collegeResponse: collegeResponse)
                self.navigationController?.pushViewController(detail, animated: true)
            }
        }
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

