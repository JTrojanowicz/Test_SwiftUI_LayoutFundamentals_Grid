//
//  ContentView.swift
//  Test_SwiftUI_LayoutFundamentals_Grid
//
//  Created by Jaroslaw Trojanowicz on 05/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOn = true
    
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    Text("Hello")
                    Image(systemName: "globe")
                }
                Divider()
                    .gridCellUnsizedAxes(.horizontal) // To prevent a flexible view from taking more space on a given axis than the other cells in a row or column require
                GridRow {
                    Image(systemName: "hand.wave")
                    Text("World")
                }
            }
            
            Grid(alignment: .bottom, horizontalSpacing: 1, verticalSpacing: 1) {
                GridRow {
                    Text("Row 1")
                    ForEach(0..<2) { _ in Color.red } // flexible Color views share the remaining space offered by the grid’s parent view equally.
                }
//                .border(.primary) // this will draw the border over every cell
                GridRow {
                    Text("Row 2")
                    ForEach(0..<5) { _ in Color.green }
                }
//                .border(.primary) // this will draw the border over every cell
                GridRow {
                    Text("Row 3")
                    ForEach(0..<4) { _ in Color.blue }
                }
//                .border(.primary) // this will draw the border over every cell
            }
            
            Divider()
            
            Grid(alignment: .leadingFirstTextBaseline) {
                GridRow {
                    Text("Regular font:")
                        .gridColumnAlignment(.trailing) // Align the ENTIRE first column. // you can use the gridColumnAlignment(_:) modifier to override the horizontal alignment of a column within the grid. (the overall alignment is done in the init(...) section)
                    Text("Helvetica 12")
                    Button("Select...") { }
                }
                GridRow {
                    Text("Fixed-width font:")
                    Text("Menlo Regular 11")
                    Button("Select...") { }
                }
                GridRow {
                    Color.clear
                        .gridCellUnsizedAxes([.vertical, .horizontal]) // To prevent a flexible view from taking more space on a given axis than the other cells in a row or column require
                    Toggle("Use fixed-width font for new documents", isOn: $isOn)
                        .gridCellColumns(2)
                }
            }
            
            Divider()
            
            // https://developer.apple.com/documentation/swiftui/view/gridcellanchor(_:)
            Grid(horizontalSpacing: 1, verticalSpacing: 1) {
                GridRow {
                    Color.red.frame(width: 60, height: 60)
                    Color.red.frame(width: 60, height: 60)
                    Color.red.frame(width: 60, height: 60)
                }
                GridRow {
                    Color.red.frame(width: 60, height: 60)
                    Color.blue.frame(width: 10, height: 10)
//                        .gridCellAnchor(UnitPoint(x: 0.25, y: 0.75))
//                        .gridCellAnchor(.topTrailing)
                        .gridCellColumns(2)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
