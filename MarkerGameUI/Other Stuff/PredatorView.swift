//
//  PredatorView.swift
//  CreateAnimationUI
//
//  Created by user246073 on 10/19/24.
//

import SwiftUI

struct PredatorView: View {
    var body: some View {
        ZStack {
            // Сетка координат
            Path { path in
                for i in stride(from: -20, through: 20, by: 1) {
                    let x = CGFloat(i) * 10 + 200
                    path.move(to: CGPoint(x: x, y: 0))
                    path.addLine(to: CGPoint(x: x, y: 400))
                    
                    let y = CGFloat(i) * 10 + 200
                    path.move(to: CGPoint(x: 0, y: y))
                    path.addLine(to: CGPoint(x: 400, y: y))
                }
            }
            .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
            
            // Массив групп точек и соответствующих цветов
            let groups: [PointGroup] = [
                PointGroup(points: group1, color: .black),
                PointGroup(points: group2, color: .red),
                PointGroup(points: group3, color: .black),
                PointGroup(points: group4, color: .orange),
                PointGroup(points: group5, color: .black),
                PointGroup(points: group6, color: .blue),
                PointGroup(points: group7, color: .blue),
                PointGroup(points: group8, color: .black),
            ]
            
            // Отрисовка линий из групп
            ForEach(groups.indices, id: \.self) { index in
                let group = groups[index]
                Path { path in
                    addLines(to: &path, points: group.points)
                }
                .stroke(group.color, lineWidth: 2)
            }
        }
        .frame(width: 400, height: 400)
    }
    
    // Структура для группы точек и цвета
    struct PointGroup {
        let points: [(Int, Int)]
        let color: Color
    }
    
    // Определение групп точек
    let group1 = [(3, 4), (6, 6), (9, 8), (11, 9), (12, 11), (12, 12), (11, 13), (10, 14), (8, 15), (6, 15), (4, 16), (0, 17), (-4, 16), (-6, 15), (-8, 15), (-10, 14), (-11, 13), (-12, 12), (-12, 11), (-11, 9), (-9, 8), (-6, 6), (-3, 4), (3, 4), (2, 6), (7, 9), (9, 11), (9, 13), (6, 15), (4, 16), (0, 17), (-4, 16), (-6, 15), (-9, 13), (-9, 11), (-7, 9), (-2, 6), (-3, 4)]
    let group2 = [(2, 2), (6, 4), (8, 4), (8, 3), (7, 3), (7, 2), (5, 1), (2, 1), (2, 2), (-2, 2), (-6, 4), (-8, 4), (-8, 3), (-7, 3), (-7, 2), (-5, 1), (-2, 1), (-2, 2)]
    let group3 = [(-14, -18), (-16,-15), (-18, -9), (-17, -6), (-18, -6), (-17, -4), (-17, 1), (-16, 5), (-14, 9), (-12, 11), (-11, 2), (-4, -2), (-4, -6), (-9, -1), (-10, 1), (-11, 2), (-10, -3), (-9, -4), (-8, -5), (-3, -9), (3, -9), (8, -5), (9, -4), (10, -3), (11, 2), (10, 1), (9, -1), (4, -6), (4, -2), (11, 2), (12, 11), (12, 12), (14, 9), (16, 5), (17, 1), (17, -4), (18, -6), (17, -6), (18, -9), (16, -15), (14, -18)]
    let group4 = [(-10, -3), (-7, -4), (-6, -5), (-5, -6), (-3, -8), (-3, -9), (-2, -9), (-1, 1), (1, 1), (2, -9), (3, -9), (3, -8), (5, -6), (6, -5), (7, -4), (10, -3)]
    let group5 = [(-11, 3), (-13, 1), (-14, -2), (-14, -6), (-13, -10), (-12, -14), (-11, -18)]
    let group6 = [(12, 8), (13, 6), (14, 3), (15, -1), (15, -4), (16, -7), (16, -10), (15, -13), (14, -16), (13, -17)]
    let group7 = [(-12, 8), (-13, 6), (-14, 3), (-15, -1), (-15, -4), (-16, -7), (-16, -10), (-15, -13), (-14, -16), (-13, -17)]
    let group8 = [(11, 3), (13, 1), (14, -2), (14, -6), (13, -10), (12, -14), (11, -18)]
    
    // Функция для добавления линий по точкам
    func addLines(to path: inout Path, points: [(Int, Int)]) {
        guard let firstPoint = points.first else { return }
        let startX = CGFloat(firstPoint.0) * 10 + 200
        let startY = -CGFloat(firstPoint.1) * 10 + 200
        path.move(to: CGPoint(x: startX, y: startY))
        for point in points.dropFirst() {
            let x = CGFloat(point.0) * 10 + 200
            let y = -CGFloat(point.1) * 10 + 200
            path.addLine(to: CGPoint(x: x, y: y))
        }
    }
}

#Preview {
    PredatorView()
}
