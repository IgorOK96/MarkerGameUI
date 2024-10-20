//
//  HelperView.swift
//  MarkerGameUI
//
//  Created by user246073 on 10/20/24.
//

import SwiftUI

struct HelperView: View {
    @State private var selectedDrawingIndex = 0 // Индекс выбранного рисунка
    
    var body: some View {
        VStack {
            // Выбор рисунка
            Picker("Выберите рисунок", selection: $selectedDrawingIndex) {
                ForEach(DataStorage.shared.drawings.indices, id: \.self) { index in
                    Text(DataStorage.shared.drawings[index].name)
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            GeometryReader { geometry in
                ZStack {
                    let minDimension = min(geometry.size.width, geometry.size.height)
                    let scaleFactor = minDimension / 400 // 400 - исходный размер фрейма
                    
                    // Отображение линий готового рисунка
                    let selectedDrawing = DataStorage.shared.drawings[selectedDrawingIndex]
                    ForEach(selectedDrawing.groups) { group in
                        Path { path in
                            let points = group.points.map { point -> CGPoint in
                                CGPoint(
                                    x: (point.x - 200) * scaleFactor + geometry.size.width / 2,
                                    y: (point.y - 200) * scaleFactor + geometry.size.height / 2
                                )
                            }
                            // Если в группе больше одной точки, рисуем линии
                            if points.count > 1 {
                                path.addLines(points)
                            }
                        }
                        .stroke(group.color, lineWidth: 2)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    HelperView()
}
