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
            ForegroundColorExample(),
            BackgroundColorExample(),
            HStackExample()
                .foreground(color: .orange)
                .background(color: .gray),
            ScrollViewExample(),
            ImageExample(),
            SpacerExample(),
        ]}.whenTapped {
            self.printLabelAt(point: $0.location(in: nil))
        }
        
        self.body = ScrollView(scrollDirection: .vertical) { body }
    }
    
    func printLabelAt(point: CGPoint) {
        let view = UIApplication.shared
            .windows.first?
            .hitTest(point, with: nil)
            as? UILabel
        
        print("Hello", view?.text ?? "unknown")
    }
}

struct SpacerExample: View {
    var body: View {
        return HStack {[
            VStack {[
                Text("v Spacer v").textAlignment(.center),
                Spacer(size: 10).background(color: .red),
                Text("^ Spacer ^").textAlignment(.center),
            ]},
            HStack {[
                Text("Spacer ->").textAlignment(.right),
                Spacer(size: 10).background(color: .red),
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
                .background(color: .yellow)
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
            }.background(color: .init(white: 0.8, alpha: 1))
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
    var body: View {
        return HStack {[
            Text("red")
                .foreground(color: .red),
            Text("green")
                .foreground(color: .green),
            Text("blue")
                .foreground(color: .blue),
            ]}
    }
}

struct BackgroundColorExample: View {
    var body: View {
        return HStack {[
            Text("red")
                .background(color: .red),
            Text("green")
                .background(color: .green),
            Text("blue")
                .background(color: .blue),
            ]}
    }
}
