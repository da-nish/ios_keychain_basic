//
//  ViewController.swift
//  ios_keychain
//
//  Created by PropertyShare on 18/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    let service = "a"
    let account = "_a"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Sample data
        let service = "com.example.myapp"
        let account = "user@example.com"
        
  
    }
    
    @IBAction func readButton(_ sender: UIButton) {
        readData()
    }
    
    @IBAction func createButton(_ sender: UIButton) {
        let password = "securepassword"
        let passwordData = password.data(using: .utf8)!
        createData(passwordData: passwordData)
    }
    
    @IBAction func updateButton(_ sender: UIButton) {
        updateData()
    }
    @IBAction func deleteButton(_ sender: UIButton) {
        deleteData()
    }
    
    
    func readData(){
        // Read (Retrieve Data)
        if let retrievedData = KeychainHelper.getKeychainItem(service: service, account: account),
           let retrievedPassword = String(data: retrievedData, encoding: .utf8) {
            print("Retrieved Password: \(retrievedPassword)")
        }
        
        
       
        
    }
    
    func createData( passwordData: Data){
        // Create (Add/Save Data)
        let addSuccess = KeychainHelper.addKeychainItem(service: service, account: account, data: passwordData)
        print("Add Success: \(addSuccess)")
        
        
        
        
    }
    
    
    func updateData(){
        // Update
        let newPassword = "newsecurepassword"
        let newPasswordData = newPassword.data(using: .utf8)!
        let updateSuccess = KeychainHelper.updateKeychainItem(service: service, account: account, newData: newPasswordData)
        print("Update Success: \(updateSuccess)")
        
    }
    
    
    func deleteData(){
        // Delete
        let deleteSuccess = KeychainHelper.deleteKeychainItem(service: service, account: account)
        print("Delete Success: \(deleteSuccess)")
        
    }


}

