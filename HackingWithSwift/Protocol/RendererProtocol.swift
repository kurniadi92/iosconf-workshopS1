//
//  RendererProtocol.swift
//  HackingWithSwift
//
//  Created by Kurniadi on 11/02/19.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import Foundation
import UIKit

protocol RendererProtocol {
    var project: Project { get }
    var colors: [UIColor] { get }
    var projectName: String { get }
    
    func drawTitleImage() -> UIImage
}

extension RendererProtocol {
    
    func drawTitleImage() -> UIImage {
        if let cached = imageFromCache() {
            return cached
        }
        
        let image = render()
        cache(image)
        
        return image
    }
    
    private func render() -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = UIScreen.main.scale
        format.opaque = true
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 400, height: 200), format: format)
        
        return renderer.image { ctx in
            let colorSpace = ctx.cgContext.colorSpace ?? CGColorSpaceCreateDeviceRGB()
            let cgColors = colors.map { $0.cgColor } as CFArray
            
            guard let gradient = CGGradient(colorsSpace: colorSpace, colors: cgColors, locations: [0, 1]) else {
                fatalError("Failed creating gradient.")
            }
            
            ctx.cgContext.drawLinearGradient(gradient, start: CGPoint.zero, end: CGPoint(x: 0, y: 200), options: [])
            
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.blue
            shadow.shadowBlurRadius = 5
            
            let text = projectName
            let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 32, weight: .bold), .shadow: shadow]
            let string = NSAttributedString(string: text, attributes: attributes)
            string.draw(at: CGPoint(x: 20, y: 150))
            
            if(projectName == "Game Project") {
                drawDice(ctx: ctx)
            }
        }
    }
    
    private func drawDice(ctx: UIGraphicsImageRendererContext) {
        if let image = UIImage(named: "dice") {
            ctx.cgContext.translateBy(x: 300, y: 20)
            ctx.cgContext.rotate(by: .pi / 4)
            image.draw(in: CGRect(x: 0, y: 0, width: 100, height: 100), blendMode: .overlay, alpha: 1)
        }
    }
    
    private func imageFromCache() -> UIImage? {
        let url = getCachesDirectory().appendingPathComponent(project.title)
        let fm = FileManager.default
        
        if fm.fileExists(atPath: url.path) {
            if let data = try? Data(contentsOf: url) {
                return UIImage(data: data, scale: UIScreen.main.scale)
            }
        }
        
        return nil
    }
    
    private func cache(_ image: UIImage) {
        let url = getCachesDirectory().appendingPathComponent(project.title)
        try? image.pngData()?.write(to: url)
    }
    
    private func getCachesDirectory() -> URL {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return paths[0]
    }
}


