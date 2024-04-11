//
//  ViewController.swift
//  Homework_6(3)
//
//  Created by Maryia Dziarkach on 7.04.24.
//



//3. По нажатию кнопки экран заполняется разноцветными квадратами с фиксированной стороной. Квадраты не пересекаются
//
//
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    let square = UIView()
//    var squareSize: CGFloat = 75.0 // задаем ширину стороны квадрата
//    let distanceBetweenSquares: CGFloat = 0.0 // задаем дистанцию между квадртами
//
//    let screenWidth = UIScreen.main.bounds.width // определяем ширину экрана 393.0
//    let screenHeight = UIScreen.main.bounds.height // определяем высоту экрана 852.0
//
//
//
//    @IBOutlet weak var viewBoarders: UIView!
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//
//
//
//    @IBAction func pressedMeButton(_ sender: UIButton) {
//        createSquares()
//
//    }
//
//
//
//
//
//    func createSquares() {
//        let viewBoardsWidth = viewBoarders.frame.width // определяем ширину области view (393.0)
//        let viewBoardsHeight = viewBoarders.frame.height // определяем высоту области view (179.0)
//        let viewBoardsX = viewBoarders.frame.origin.x // определяем начальную точку по х (0.0)
//        let viewBoardsY = viewBoarders.frame.origin.y // определяем начальнкую точку по y (673.0)
//        print(viewBoardsWidth, viewBoardsHeight, viewBoardsX, viewBoardsY)
//
//        let maxColumns = Int((view.bounds.width - distanceBetweenSquares) / (squareSize + distanceBetweenSquares)) // определяем макс кол-во квадратов, которые поместятся по ширине
//        let maxRows = Int((view.bounds.height - distanceBetweenSquares) / (squareSize + distanceBetweenSquares)) // определяем макс кол-во квадратов, которые поместятся по высоте
//
//        var startX = view.frame.minX // Начинаем с самого левого края экрана
//        var startY = view.frame.minY // Начинаем с самого верхнего края экрана
//
//        var row = 0
//        while row < maxRows {
//        var column = 0
//        while column < maxColumns {
//            if startX + squareSize <= view.bounds.width && startY + squareSize <= (screenHeight - viewBoardsHeight) {
//                    let square = UIView(frame: CGRect(x: startX, y: startY, width: squareSize, height: squareSize))
//                    square.backgroundColor = randomColor()
//                    view.addSubview(square)
//                    startX += squareSize + distanceBetweenSquares
//                } else {
//                    return
//                }
//                column += 1
//            }
//            startY += squareSize + distanceBetweenSquares
//            startX = view.frame.minX // Сбрасываем startX для новой строки
//            row += 1
//        }
//    }
//
//    func randomColor() -> UIColor {
//        let red = CGFloat.random(in: 0...1)
//        let green = CGFloat.random(in: 0...1)
//        let blue = CGFloat.random(in: 0...1)
//        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
//    }
//}




/*По нажатию кнопки экран заполняется разноцветными квадратами с фиксированной стороной. Квадраты не пересекаются.
 NEW. Необходимо реализовать возможность задавать сторону квадрата (степпером или иначе, через UI), по нажатию кнопки заполнить экран разноцветными квадратами с указанной стороной (в центре каждого квадрата label с названием цвета)
 */


import UIKit

class ViewController: UIViewController {
    
    let square = UIView()
    var squareSize: CGFloat = 100
    
    let distanceBetweenSquares: CGFloat = 0.0 // задаем дистанцию между квадртами
    
    let screenWidth = UIScreen.main.bounds.width // определяем ширину экрана 393.0
    let screenHeight = UIScreen.main.bounds.height // определяем высоту экрана 852.0
    
    var allSquares = [UIView]()
    
    @IBOutlet weak var viewBoarders: UIView!
    
    
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.minimumValue = 80
        stepper.maximumValue = 120
        stepper.value = squareSize
        stepper.stepValue = 5
        
        stepper.addTarget(self, action: #selector(pressedStepper(_:)), for: .valueChanged)
        
        
    }
    
    @IBAction func pressedMeButton(_ sender: UIButton) {
        createSquares()
        
    }
    
    
    
    @IBAction func pressedStepper(_ sender: UIStepper) {
        squareSize = stepper.value
        
        if squareSize == stepper.maximumValue || squareSize == stepper.minimumValue {
            return
        }
        
        createSquares()
        
    }
    
    
    
    func createRect() {
        
        
    }
    
    
    
    func createSquares() {
        
        for (index, element) in allSquares.enumerated() {
            allSquares[index].removeFromSuperview()
        }
        
        let viewBoardsWidth = viewBoarders.frame.width // определяем ширину области view (393.0)
        let viewBoardsHeight = viewBoarders.frame.height // определяем высоту области view (179.0)
        let viewBoardsX = viewBoarders.frame.origin.x // определяем начальную точку по х (0.0)
        let viewBoardsY = viewBoarders.frame.origin.y // определяем начальнкую точку по y (673.0)
        print(viewBoardsWidth, viewBoardsHeight, viewBoardsX, viewBoardsY)
        
        let maxColumns = Int((view.bounds.width - distanceBetweenSquares) / (squareSize + distanceBetweenSquares)) // определяем макс кол-во квадратов, которые поместятся по ширине
        let maxRows = Int((view.bounds.height - distanceBetweenSquares) / (squareSize + distanceBetweenSquares)) // определяем макс кол-во квадратов, которые поместятся по высоте
        
        var startX = view.frame.minX // Начинаем с самого левого края экрана
        var startY = view.frame.minY // Начинаем с самого верхнего края экрана
        
        var row = 0
        
        let colorNames = ["clear", "black", "darkGray", "lightGray", "white", "gray", "red", "green", "blue", "cyan", "yellow", "magenta", "orange", "purple", "brown"]
        
        let colors = [UIColor.clear, UIColor.black, UIColor.darkGray, UIColor.lightGray, UIColor.white, UIColor.gray, UIColor.red, UIColor.green, UIColor.blue, UIColor.cyan, UIColor.yellow, UIColor.magenta, UIColor.orange, UIColor.purple, UIColor.brown]
        
        while row < maxRows {
            var column = 0
            while column < maxColumns {
                
                let colorIndex = Int.random(in: 0...(colors.count - 1))
                
                if startX + squareSize <= view.bounds.width && startY + squareSize <= (screenHeight - viewBoardsHeight) {
                    let square = UIView(frame: CGRect(x: startX, y: startY, width: squareSize, height: squareSize))
                    square.backgroundColor = colors[colorIndex]
                    view.addSubview(square)
                    
                    let colorName = colorNames[colorIndex]
                    let colorLabel = UILabel(frame: CGRect(x: 0, y: 0, width: squareSize, height: squareSize))
                    colorLabel.textAlignment = .center
                    colorLabel.textColor = UIColor.black
                    colorLabel.text = colorName
                    square.addSubview(colorLabel)
                    
                    allSquares.append(square)
                    
                    startX += squareSize + distanceBetweenSquares
                } else {
                    return
                }
                column += 1
            }
            startY += squareSize + distanceBetweenSquares
            startX = view.frame.minX // Сбрасываем startX для новой строки
            row += 1
        }
    }
    
    
    
    
}
