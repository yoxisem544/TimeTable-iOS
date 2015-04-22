//
//  KeychainAccess.swift
//  WeekTable
//
//  Created by David on 2015/4/21.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit;
import Security;

class KeychainAccess: NSObject {
    
    func setPasscode(identifier: String, passcode: String) {
        var dataFromString: NSData = passcode.dataUsingEncoding(NSUTF8StringEncoding)!;
        /*
        var keychainQuery = [
        kSecClass       : kSecClassGenericPassword,
        kSecAttrService : identifier,
        kSecValueData   : dataFromString];
        */
        
        var keychainQuery = NSDictionary(
            objects: [kSecClassGenericPassword, identifier, dataFromString],
            forKeys: [kSecClass, kSecAttrService, kSecValueData]);
        
        SecItemDelete(keychainQuery as CFDictionaryRef);
        var status: OSStatus = SecItemAdd(keychainQuery as CFDictionaryRef, nil);
    }
    
    func getPasscode(identifier: String) -> String? {
        
        /*
        var keychainQuery = [
        kSecClass       : kSecClassGenericPassword,
        kSecAttrService : identifier,
        kSecReturnData  : kCFBooleanTrue,
        kSecMatchLimit  : kSecMatchLimitOne];
        */
        
        var keychainQuery = NSDictionary(
            objects: [kSecClassGenericPassword, identifier, kCFBooleanTrue, kSecMatchLimitOne],
            forKeys: [kSecClass, kSecAttrService, kSecReturnData, kSecMatchLimit]);
        
        var dataTypeRef :Unmanaged<AnyObject>?;
        let status: OSStatus = SecItemCopyMatching(keychainQuery, &dataTypeRef);
        let opaque = dataTypeRef?.toOpaque();
        var passcode: String?;
        if let op = opaque {
            let retrievedData = Unmanaged<NSData>.fromOpaque(op).takeUnretainedValue();
            passcode = NSString(data: retrievedData, encoding: NSUTF8StringEncoding) as? String;
        } else {
            println("Passcode not found. Status code \(status)");
        }
        return passcode;
    }
}