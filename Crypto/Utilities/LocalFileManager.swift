//
//  LocalFileManager.swift
//  Crypto
//
//  Created by Gael G. on 12/2/21.
//

import Foundation
import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    private init() {}
    
    func saveImage(image: UIImage, imageName: String, folderName: String) {
        createFolderIfNeeded(folderName: folderName)
        
        guard
            let data = image.pngData(),
            let url = getURLFromImage(imageName: imageName, folderName: folderName)
        else { return }
        
        do {
            try data.write(to: url)
        } catch {
            print("Error saving image [\(imageName)]: \(error)")
        }
    }
    
    func loadImage(imageName: String, folderName: String) -> UIImage? {
        guard
            let url = getURLFromImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error creating directory [\(folderName)]: \(error)")
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        return url.appendingPathComponent(folderName)
    }
    
    private func getURLFromImage(imageName: String, folderName: String) -> URL? {
        guard let folder = getURLForFolder(folderName: folderName) else { return nil }
        return folder.appendingPathComponent(imageName + ".png")
    }
}