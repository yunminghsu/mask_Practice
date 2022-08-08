import UIKit

//分別建立貓咪圖片、背景圖片、底圖圖片
let catImage=UIImageView(image: UIImage(named: "cat.png"))
let backgroundImage=UIImageView(image: UIImage(named: "background.jpeg"))
let subbackgroundImage=UIImageView(image: UIImage(named: "subbackground.jpeg"))

//將圖幅全部修改至統一大小
catImage.frame=CGRect(x: 0, y: 0, width: 500, height: 500)
backgroundImage.frame=catImage.frame
subbackgroundImage.frame=catImage.frame

//調整內容顯示
backgroundImage.contentMode = .scaleAspectFill
subbackgroundImage.contentMode = .scaleAspectFill

//設定以貓咪圖形為主的遮罩，並將遮罩層貼至底圖上
backgroundImage.mask = catImage
subbackgroundImage.addSubview(backgroundImage)

//建立漸層遮罩圖層
let gradientLayer = CAGradientLayer()
//設定遮罩圖幅
gradientLayer.frame = subbackgroundImage.bounds
//設定漸層顏色係數及起始終點方向
gradientLayer.colors = [CGColor(red: 0, green: 0, blue: 1, alpha: 0.3),CGColor(red: 0, green: 0, blue: 1, alpha: 1)]
gradientLayer.startPoint = CGPoint(x: 0, y: 0)
gradientLayer.endPoint = CGPoint(x: 0, y: 1)

//將遮罩貼加至整個圖層之上
subbackgroundImage.layer.mask = gradientLayer
subbackgroundImage
