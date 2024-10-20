//
//  TestGame.swift
//  CreateAnimationUI
//
//  Created by user246073 on 10/19/24.
//

import SwiftUI

struct Line: Identifiable {
    let id = UUID()
    let from: CGPoint
    let to: CGPoint
    let color: Color
}

struct PointGroup: Identifiable {
    var id = UUID()
    let points: [CGPoint]
    var color: Color
}

struct TestGame: View {
    @State private var selectedPoints: [CGPoint] = []
    @State private var lines: [Line] = []
    @State private var currentColor: Color = .blue
    @State private var selectedDrawingIndex = 0 // Индекс выбранного рисунка
    
    var body: some View {
        VStack {
            Spacer()
            // Выбор рисунка
            Picker("Выберите рисунок", selection: $selectedDrawingIndex) {
                ForEach(DataStorage.shared.drawings.indices, id: \.self) { index in
                    Text(DataStorage.shared.drawings[index].name)
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .onChange(of: selectedDrawingIndex) { _ in
                // Сбрасываем линии и выбор точек при смене рисунка
                lines.removeAll()
                selectedPoints.removeAll()
            }
            
            // Выбор цвета и кнопки управления
            HStack {
                Text("Цвет линии:")
                ColorPicker("", selection: $currentColor)
                    .labelsHidden()
                Spacer()
                Button(action: {
                    if !lines.isEmpty {
                        lines.removeLast()
                    }
                }) {
                    Text("Отменить последнюю линию")
                        .padding(8)
                        .background(Color.yellow.opacity(0.2))
                        .cornerRadius(8)
                }
                Button(action: {
                    lines.removeAll()
                    selectedPoints.removeAll()
                }) {
                    Text("Сбросить всё")
                        .padding(8)
                        .background(Color.red.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding()
            
            GeometryReader { geometry in
                let desiredWidth: CGFloat = 390 // Установите желаемую ширину здесь
                let scaleFactor = desiredWidth / 400 // 400 - исходный размер фрейма
                let offsetX = (geometry.size.width - desiredWidth) / 2
                let offsetY = (geometry.size.height - desiredWidth) / 2
                
                ZStack {
                    // Сетка координат
                    Path { path in
                        for i in stride(from: -20, through: 20, by: 1) {
                            let x = CGFloat(i) * 10 * scaleFactor + 200 * scaleFactor
                            path.move(to: CGPoint(x: x, y: 0))
                            path.addLine(to: CGPoint(x: x, y: desiredWidth))
                            
                            let y = CGFloat(i) * 10 * scaleFactor + 200 * scaleFactor
                            path.move(to: CGPoint(x: 0, y: y))
                            path.addLine(to: CGPoint(x: desiredWidth, y: y))
                        }
                    }
                    .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                    
                    // Отображение линий, нарисованных пользователем
                    ForEach(lines) { line in
                        Path { path in
                            path.move(to: CGPoint(
                                x: (line.from.x - 200) * scaleFactor + 200 * scaleFactor,
                                y: (line.from.y - 200) * scaleFactor + 200 * scaleFactor
                            ))
                            path.addLine(to: CGPoint(
                                x: (line.to.x - 200) * scaleFactor + 200 * scaleFactor,
                                y: (line.to.y - 200) * scaleFactor + 200 * scaleFactor
                            ))
                        }
                        .stroke(line.color, lineWidth: 2)
                    }
                    
                    // Отображение точек выбранного рисунка
                    let selectedDrawing = DataStorage.shared.drawings[selectedDrawingIndex]
                    ForEach(selectedDrawing.groups.indices, id: \.self) { groupIndex in
                        let group = selectedDrawing.groups[groupIndex]
                        ForEach(group.points.indices, id: \.self) { pointIndex in
                            let point = group.points[pointIndex]
                            let scaledPoint = CGPoint(
                                x: (point.x - 200) * scaleFactor + 200 * scaleFactor,
                                y: (point.y - 200) * scaleFactor + 200 * scaleFactor
                            )
                            Circle()
                                .fill(group.color)
                                .frame(width: 6)
                                .position(scaledPoint)
                                .onTapGesture {
                                    handlePointTap(point)
                                }
                        }
                    }
                }
                .frame(width: desiredWidth, height: desiredWidth)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
            
            
            Spacer()
        }
        
    }
    
    func handlePointTap(_ point: CGPoint) {
        if selectedPoints.isEmpty {
            selectedPoints.append(point)
        } else {
            let fromPoint = selectedPoints.removeLast()
            let newLine = Line(from: fromPoint, to: point, color: currentColor)
            lines.append(newLine)
        }
    }
}

#Preview {
    TestGame()
}
