//
//  ContentView.swift
//  SwiftUISelectionBox
//
//  Created by Angelos Staboulis on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    @State var show:Bool
    @State var rectangle:CGRect! = .zero
    @State var startPoint:CGPoint! = CGPoint.init()
    @State var endPoint:CGPoint! = .zero
    var body: some View {
        ZStack{
            Color.white
            Path { path in
                path.addRect(rectangle)
            }
            .strokedPath(StrokeStyle(lineWidth: 15, lineCap: .square, lineJoin: .round))
            .foregroundColor(.red)
            .opacity(show ? 1.0 : 0.0)
          
        }.gesture(
            DragGesture()
                .onChanged({ value in
                    startPoint = value.startLocation
                    endPoint = value.location
                    rectangle = CGRect(x: startPoint.x, y: startPoint.y, width:endPoint.x - startPoint.x, height: endPoint.y - startPoint.y)
                    show = true
                })
                
        )
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(show: false)
    }
}
