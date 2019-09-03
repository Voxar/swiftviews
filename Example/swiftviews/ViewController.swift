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
                .foreground(.orange)
                .background(.gray),
            ScrollViewExample(),
            ImageExample(),
            SpacerExample(),
            Spacer(size: 2).background(.green),
        ]}.whenTapped {
            self.printLabelAt(point: $0.location(in: nil))
        }
        
        self.body = ScrollView(scrollDirection: .vertical) { body }
            .border(width: 1, color: .lightGray)
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
    var body: View {
        return HStack {[
            Text("red")
                .foreground(.red),
            Text("green")
                .foreground(.green),
            Text("blue")
                .foreground(.blue),
            ]}
    }
}

struct BackgroundColorExample: View {
    var body: View {
        return HStack {[
            Text("red")
                .background(.red),
            Text("green")
                .background(.green),
            Text("blue")
                .background(.blue),
            ]}
    }
}
