//
//  ViewController.swift
//  swiftviews
//
//  Created by Patrik Sjöberg on 09/02/2019.
//  Copyright (c) 2019 Patrik Sjöberg. All rights reserved.
//

import UIKit
import swiftviews

class ViewController: HostViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let body = VStack {[
            VStackExample(),
            HStackExample(),
            ForegroundColorExample(align: self.align),
            BackgroundColorExample(align: self.align),
            HStackExample()
                .foreground(.orange)
                .background(.gray),
            ScrollViewExample(),
            ImageExample(),
            SpacerExample(),
            FontExample(size: 12),
            FontExample(size: 22),
            Spacer(size: 2).background(.green),
            SpacerExample(),
            SpacerExample(),
            SpacerExample(),
            SpacerExample(),
            SpacerExample(),
            SpacerExample(),
            SpacerExample(),
            SpacerExample(),
            SpacerExample(),
        ]}.whenTapped {
            self.printLabelAt(point: $0.location(in: nil))
        }
        
        self.body = ScrollView(scrollDirection: .vertical) { body }
            .border(width: 1, color: .lightGray)
            .padding(10)
    }
    
    var align: NSTextAlignment? = nil {
        didSet { self.body = self.body }
    }
    
    func printLabelAt(point: CGPoint) {
        let view = UIApplication.shared
            .windows.first?
            .hitTest(point, with: nil)
            as? UILabel
        
        
        switch view?.text ?? "" {
        case "center": align = .center
        case "left": align = .left
        case "right": align = .right
        default: align = nil
        }
        print("Hello", view?.text ?? "unknown")
    }
}

struct FontExample: View {
    let size: CGFloat
    
    func text(with fontName: String) -> View? {
        return UIFont(name: fontName, size: size)
            .flatMap({ Text(fontName).font($0) })?
            .padding(2)
    }
    
    var firstFontNames: ArraySlice<String> {
        let names = UIFont.familyNames
            .compactMap({UIFont.fontNames(forFamilyName: $0).first})
        return names[0..<min(10, names.count)]
    }
    
    var body: View {
        return ScrollView(scrollDirection: .horizontal) {
            HStack {
                self.firstFontNames.compactMap(self.text)
            }
            .padding(10)
        }
    }
}

struct SpacerExample: View {
    var body: View {
        return HStack {[
            VStack {[
                Text("v Spacer v").textAlignment(.center),
                Spacer(size: 10).background(.red),
                Text("^ Spacer ^").textAlignment(.center),
            ]},
            HStack {[
                Text("Spacer ->").textAlignment(.right),
                Spacer(size: 10).background(.red),
                Text("<- Spacer").textAlignment(.left),
            ]}
        ]}
    }
}

struct ImageExample: View {
    var body: View {
        return HStack {[
            Image(size: CGSize(width: 50, height: 50), color: .red)
                .contentHuggingPriority(vertical: .init(rawValue: 0))
                .contentCompressionResistance(vertical: .defaultLow)
                .background(.yellow)
            ,
            Image(named: "x")
                .contentMode(.center)
            ,
            Image(named: "check")
                .contentMode(.center)
        ]}
        .contentMode(.scaleAspectFit)
    }
}

struct ScrollViewExample: View {
    var body: View {
        return ScrollView(scrollDirection: .horizontal) {
            return HStack(spacing: 5) {
                (0...50).map { i in
                    Text(String(i))
                        .textAlignment(.center)
                }
            }.background(.init(white: 0.8, alpha: 1))
        }
    }
}

struct VStackExample: View {
    var body: View {
        return VStack {[
            Text("left")
                .textAlignment(.left),
            Text("center")
                .textAlignment(.center),
            Text("right")
                .textAlignment(.right),
            ]}
    }
}

struct HStackExample: View {
    var body: View {
        return HStack {[
            Text("left")
                .textAlignment(.left),
            Text("center")
                .textAlignment(.center),
            Text("right")
                .textAlignment(.right),
            ]}
    }
}

struct ForegroundColorExample: View {
    let align: NSTextAlignment?
    var body: View {
        let body = HStack {[
            Text("red")
                .foreground(.red),
            Text("green")
                .foreground(.green),
            Text("blue")
                .foreground(.blue),
            ]}
        if let align = align { return body.textAlignment(align) }
        return body
    }
}

struct BackgroundColorExample: View {
    let align: NSTextAlignment?
    var body: View {
        let body = HStack {[
            Text("red")
                .background(.red),
            Text("green")
                .background(.green),
            Text("blue")
                .background(.blue),
            ]}
        if let align = align { return body.textAlignment(align) }
        return body
    }
}
