//
//  HorseView.swift
//  CreateAnimationUI
//
//  Created by user246073 on 10/19/24.
//

import SwiftUI

struct PokemonView: View {
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
                PointGroup(points: group1, color: .purple),
                PointGroup(points: group2, color: .purple),
                PointGroup(points: group3, color: .purple),
                PointGroup(points: group4, color: .purple),
                PointGroup(points: group5, color: .purple),
                PointGroup(points: group6, color: .orange),
                PointGroup(points: group7, color: .red),
                PointGroup(points: group8, color: .red),
                PointGroup(points: group9, color: .red),
                PointGroup(points: group10, color: .purple),
                PointGroup(points: group11, color: .purple),
                PointGroup(points: group12, color: .red),
                PointGroup(points: group13, color: .orange),
                PointGroup(points: group14, color: .orange)
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
    let group1 = [(-9, -8), (-14, -5), (-15, -3), (-15, -2), (-15, -1), (-14, 3), (-13, 6), (-13, 10), (-12, 13), (-11, 16), (-8, 20), (-7, 19), (-7, 12), (-8, 9), (-9, 8), (-8, 9), (3, 8), (1, 7), (3, 8), (13, 11), (18, 11), (17, 10), (12, 7), (6, 5), (4, 5), (5, 5), (5, -4), (4, -5), (3, -6), (2, -7), (0, -7)]
    let group2 = [(4, -5), (4, -7), (5, -9), (6, -11), (7, -11), (8, -12), (7, -13), (9, -11), (10, -11), (10, -14), (8, -18), (7, -19), (6, -19), (6, -17), (6, -19), (-1, -19), (2, -15), (3, -12), (3, -11)]
    let group3 = [(-1, -19), (0, -20), (-6, -20), (-5, -19), (-5, -14), (-4, -10)]
    let group4 = [(-6, -11), (-5, -14), (-5, -19), (-7, -20), (-10, -20), (-10, -19), (-9, -18), (-12, -14), (-13, -11), (-13, -9)]
    let group5 = [(-10, -19), (-17, -19), (-19, -16), (-20, -13), (-20, -12), (-19, -11), (-18, -11), (-17, -13), (-16, -16), (-17, -13), (-17, -12), (-15, -11), (-14, -9), (-13, -7), (-13, -6)]
    let group6 = [(-11, -1), (-10, -1), (-9, -4), (-7, -6), (-6, -6), (-4, -4), (-3, -2), (-3, -1), (-2, -1), (-4, -1), (-6, 0), (-8, 0), (-9, -1), (-11, -1)]
    let group7 = [(5, 1), (10, 3), (15, 4), (20, 4), (15, -4), (8, -4), (10, -9), (6, -10), (6, -11), (5, -9), (7, -8), (5, -4)]
    let group8 = [(-15, 0), (-14, 0), (-13, -1), (-13, -2), (-14, -3), (-15, -3)]
    let group9 = [(0, -2), (1, -1), (3, -1), (4, -2), (4, -3), (3, -4), (1, -4), (0, -3), (0, -2)]
    let group10 = [(-11, 1), (-12, 2), (-12, 3), (-11, 4), (-10, 4), (-9, 3), (-9, 2), (-10, 1), (-11, 1)]
    let group11 = [(-2, 2), (-2, 3), (-1, 4), (0, 4), (1, 3), (1, 2), (0, 1), (-1, 1), (-2, 2)]
    let group12 = [(-7, 1)]
    let group13 = [(12, 7), (13, 11)]
    let group14 = [(-12, 13), (-9, 15), (-7, 15)]
    
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
    PokemonView()
}
