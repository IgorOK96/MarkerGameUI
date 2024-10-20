//
//  Data Storage.swift
//  MarkerGameUI
//
//  Created by user246073 on 10/20/24.
//

import SwiftUI

final class DataStorage {
    static let shared = DataStorage()
    
    struct Drawing {
        let name: String
        let groups: [PointGroup]
    }
    
    // Рисунок Пикачу
    let pikachuDrawing: Drawing
    // Рисунок Предатор
    let predatorDrawing: Drawing
    
    // Массив всех рисунков
    let drawings: [Drawing]
    
    private init() {
        // Функция для преобразования точек
        func convertPoints(_ points: [(Int, Int)]) -> [CGPoint] {
            return points.map { point in
                let x = CGFloat(point.0) * 10 + 200
                let y = -CGFloat(point.1) * 10 + 200
                return CGPoint(x: x, y: y)
            }
        }
        
        // ---- Рисунок Пикачу ----
        // Определение групп точек для Пикачу
        let pikachuGroup1 = convertPoints([(-9, -8), (-14, -5), (-15, -3), (-15, -2), (-15, -1), (-14, 3), (-13, 6), (-13, 10), (-12, 13), (-11, 16), (-8, 20), (-7, 19), (-7, 12), (-8, 9), (-9, 8), (-8, 9), (3, 8), (1, 7), (3, 8), (13, 11), (18, 11), (17, 10), (12, 7), (6, 5), (4, 5), (5, 5), (5, -4), (4, -5), (3, -6), (2, -7), (0, -7)])
        let pikachuGroup2 = convertPoints([(4, -5), (4, -7), (5, -9), (6, -11), (7, -11), (8, -12), (7, -13), (9, -11), (10, -11), (10, -14), (8, -18), (7, -19), (6, -19), (6, -17), (6, -19), (-1, -19), (2, -15), (3, -12), (3, -11)])
        let pikachuGroup3 = convertPoints([(-1, -19), (0, -20), (-6, -20), (-5, -19), (-5, -14), (-4, -10)])
        let pikachuGroup4 = convertPoints([(-6, -11), (-5, -14), (-5, -19), (-7, -20), (-10, -20), (-10, -19), (-9, -18), (-12, -14), (-13, -11), (-13, -9)])
        let pikachuGroup5 = convertPoints([(-10, -19), (-17, -19), (-19, -16), (-20, -13), (-20, -12), (-19, -11), (-18, -11), (-17, -13), (-16, -16), (-17, -13), (-17, -12), (-15, -11), (-14, -9), (-13, -7), (-13, -6)])
        let pikachuGroup6 = convertPoints([(-11, -1), (-10, -1), (-9, -4), (-7, -6), (-6, -6), (-4, -4), (-3, -2), (-3, -1), (-2, -1), (-4, -1), (-6, 0), (-8, 0), (-9, -1), (-11, -1)])
        let pikachuGroup7 = convertPoints([(5, 1), (10, 3), (15, 4), (20, 4), (15, -4), (8, -4), (10, -9), (6, -10), (6, -11), (5, -9), (7, -8), (5, -4)])
        let pikachuGroup8 = convertPoints([(-15, 0), (-14, 0), (-13, -1), (-13, -2), (-14, -3), (-15, -3)])
        let pikachuGroup9 = convertPoints([(0, -2), (1, -1), (3, -1), (4, -2), (4, -3), (3, -4), (1, -4), (0, -3), (0, -2)])
        let pikachuGroup10 = convertPoints([(-11, 1), (-12, 2), (-12, 3), (-11, 4), (-10, 4), (-9, 3), (-9, 2), (-10, 1), (-11, 1)])
        let pikachuGroup11 = convertPoints([(-2, 2), (-2, 3), (-1, 4), (0, 4), (1, 3), (1, 2), (0, 1), (-1, 1), (-2, 2)])
        let pikachuGroup12 = convertPoints([(-7, 1)])
        let pikachuGroup13 = convertPoints([(12, 7), (13, 11)])
        let pikachuGroup14 = convertPoints([(-12, 13), (-9, 15), (-7, 15)])
        
        let pikachuGroups: [PointGroup] = [
            PointGroup(points: pikachuGroup1, color: .purple),
            PointGroup(points: pikachuGroup2, color: .purple),
            PointGroup(points: pikachuGroup3, color: .purple),
            PointGroup(points: pikachuGroup4, color: .purple),
            PointGroup(points: pikachuGroup5, color: .purple),
            PointGroup(points: pikachuGroup6, color: .orange),
            PointGroup(points: pikachuGroup7, color: .red),
            PointGroup(points: pikachuGroup8, color: .red),
            PointGroup(points: pikachuGroup9, color: .red),
            PointGroup(points: pikachuGroup10, color: .purple),
            PointGroup(points: pikachuGroup11, color: .purple),
            PointGroup(points: pikachuGroup12, color: .red),
            PointGroup(points: pikachuGroup13, color: .orange),
            PointGroup(points: pikachuGroup14, color: .orange)
        ]
        
        pikachuDrawing = Drawing(name: "Пикачу", groups: pikachuGroups)
        
        // ---- Рисунок Предатор ----
        // Определение групп точек для Предатора
        let predatorGroup1 = convertPoints([(3, 4), (6, 6), (9, 8), (11, 9), (12, 11), (12, 12), (11, 13), (10, 14), (8, 15), (6, 15), (4, 16), (0, 17), (-4, 16), (-6, 15), (-8, 15), (-10, 14), (-11, 13), (-12, 12), (-12, 11), (-11, 9), (-9, 8), (-6, 6), (-3, 4), (3, 4), (2, 6), (7, 9), (9, 11), (9, 13), (6, 15), (4, 16), (0, 17), (-4, 16), (-6, 15), (-9, 13), (-9, 11), (-7, 9), (-2, 6), (-3, 4)])
        let predatorGroup2 = convertPoints([(2, 2), (6, 4), (8, 4), (8, 3), (7, 3), (7, 2), (5, 1), (2, 1), (2, 2), (-2, 2), (-6, 4), (-8, 4), (-8, 3), (-7, 3), (-7, 2), (-5, 1), (-2, 1), (-2, 2)])
        let predatorGroup3 = convertPoints([(-14, -18), (-16,-15), (-18, -9), (-17, -6), (-18, -6), (-17, -4), (-17, 1), (-16, 5), (-14, 9), (-12, 11), (-11, 2), (-4, -2), (-4, -6), (-9, -1), (-10, 1), (-11, 2), (-10, -3), (-9, -4), (-8, -5), (-3, -9), (3, -9), (8, -5), (9, -4), (10, -3), (11, 2), (10, 1), (9, -1), (4, -6), (4, -2), (11, 2), (12, 11), (12, 12), (14, 9), (16, 5), (17, 1), (17, -4), (18, -6), (17, -6), (18, -9), (16, -15), (14, -18)])
        let predatorGroup4 = convertPoints([(-10, -3), (-7, -4), (-6, -5), (-5, -6), (-3, -8), (-3, -9), (-2, -9), (-1, 1), (1, 1), (2, -9), (3, -9), (3, -8), (5, -6), (6, -5), (7, -4), (10, -3)])
        let predatorGroup5 = convertPoints([(-11, 3), (-13, 1), (-14, -2), (-14, -6), (-13, -10), (-12, -14), (-11, -18)])
        let predatorGroup6 = convertPoints([(12, 8), (13, 6), (14, 3), (15, -1), (15, -4), (16, -7), (16, -10), (15, -13), (14, -16), (13, -17)])
        let predatorGroup7 = convertPoints([(-12, 8), (-13, 6), (-14, 3), (-15, -1), (-15, -4), (-16, -7), (-16, -10), (-15, -13), (-14, -16), (-13, -17)])
        let predatorGroup8 = convertPoints([(11, 3), (13, 1), (14, -2), (14, -6), (13, -10), (12, -14), (11, -18)])
        
        let predatorGroups: [PointGroup] = [
            PointGroup(points: predatorGroup1, color: .black),
            PointGroup(points: predatorGroup2, color: .red),
            PointGroup(points: predatorGroup3, color: .black),
            PointGroup(points: predatorGroup4, color: .orange),
            PointGroup(points: predatorGroup5, color: .black),
            PointGroup(points: predatorGroup6, color: .blue),
            PointGroup(points: predatorGroup7, color: .blue),
            PointGroup(points: predatorGroup8, color: .black)
        ]
        
        predatorDrawing = Drawing(name: "Предатор", groups: predatorGroups)
        
        // Массив всех рисунков
        drawings = [pikachuDrawing, predatorDrawing]
    }
}

