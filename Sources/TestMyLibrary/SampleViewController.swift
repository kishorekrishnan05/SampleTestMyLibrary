//
//  SampleViewController.swift
//  
//
//  Created by Kishore on 17/08/22.
//

import UIKit
struct  TestDataForHeight{
    var height: CGFloat?
    var name: String?
}


public class SampleViewController: UIViewController,UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var viewTest = UIView()
        viewTest.frame = CGRect(x: 10, y: 20, width: 200, height: 40)
        
        var label: UILabel = UILabel()
        let headerFrame = mScrollView.frame
        mScrollView.frame.origin.y = CGFloat(max(40, scrollView.contentOffset.y))
        mScrollView.frame = headerFrame
        self.yPosition = scrollView.contentOffset.y
        for (index,i) in header.enumerated() {
            if index != header.count - 1 {
            if scrollView.contentOffset.y < header[index + 1].height! {
                label.text = i.name
                viewTest.addSubview(label)
                self.view.bringSubviewToFront(viewTest)
               // view.insertSubview(viewTest, aboveSubview: mScrollView)
                print(i.name)
                print(i.height)
                break
             //   print(<#T##items: Any...##Any#>)
            }
            }else{
                label.text = i.name
                viewTest.addSubview(label)
                self.view.bringSubviewToFront(viewTest)
               // view.insertSubview(viewTest, aboveSubview: mScrollView)
                print(i.name)
                print(i.height)
            }
        }
        
    }
    
    //SE 13 13 pro max  ipad  8 plus

    @IBOutlet weak var mScrollView: UIScrollView!
    var seatsVMData : NSMutableDictionary?
    var yPosition : CGFloat = 0
    let label = UILabel()
    var test : ModelSeatMap?
    var header = [TestDataForHeight]()
    var seatIconBtnsIndex: Int = 0
    var cabinAvgSeatHeightData : NSMutableArray?
    var testArray: [CGFloat] = []
    var imgSeat = UIButton()
    var isFirstRowInCabin: Bool?
    public override func viewDidLoad() {
        super.viewDidLoad()
        testJson()
       // UALSeatVMCRM.buildDataObjects((self.test?.crmSeatMapResponse?.seatMap)!)
       // seatsVMData = UALSeatVMCRM.getSeatsData()
        //LabelUI()
        //newFuncRowWise()
        //newFuncEqualSpacing()
        newFunc()
        mScrollView.delegate = self
        //newFuncwith4Padding()
        //newFuncclounmWise()
        // Do any additional setup after loading the view.
        
    }
    /*func tstdata(){
        var ButtonList = ["Button 1", "Button 2", "Button 3"]
        let buttonWidth = 100
        let buttonSpace = 10
        for (index,ButtonText) in ButtonList.enumerated(){
            //calculate the x coordinate of each button
            let xCoord = CGFloat(index*buttonWidth + index*buttonSpace)
            //CGRect(x: px+10, y: py+10, width: 100, height: 45)
            let codedButton:UIButton = UIButton(frame: CGRectMake(xCoord, 0, 100, 50))
            codedButton.backgroundColor = UIColor.red
            codedButton.setTitle(ButtonText, forState: UIControlState.Normal)
            codedButton.addTarget(self, action: #selector(ViewController.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            codedButton.tag = index
            self.mScrollView.addSubview(codedButton)
            }
    }*/
    func testJson() {
        let jsonDecoder = JSONDecoder()
        do {
            let decoder = JSONDecoder()
            let messages = try decoder.decode(ModelSeatMap.self, from: readLocalFile(forName: "2325Flight")!)
            test = messages
        } catch DecodingError.dataCorrupted(let context) {
            print(context)
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        
        let responseModel = try? jsonDecoder.decode(ModelSeatMap.self, from: readLocalFile(forName: "201Update")!)
        self.test = responseModel
       // dynamicButtonCreationNew()
    }
    @objc func pressed() {
        print("Kishore")
    }
    func newFunc(){
        var xAxis:CGFloat = 10
        var yOffset:CGFloat = 10
        var xOffset:CGFloat = 10
        
        var height:CGFloat = 0
        
        var ynewOffset:CGFloat = 8
        var xnewOffset:CGFloat = 16
        //mScrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 50))
        
        
        //mScrollView.backgroundColor = UIColor.blue
        mScrollView.translatesAutoresizingMaskIntoConstraints = false
        if let value = self.test?.crmSeatMapResponse?.seatMap?.cabins {
            var button = UIButton()
            var imageView = UIImageView()
            var header1 = TestDataForHeight()
            //print(value.count)
            for j in 0..<value.count {
                button = UIButton()
                //button.frame = CGRect(x: 100, y: CGFloat(j == 0 ? height: height - 40), width: 200, height: 40)
                button.frame = CGRect(x: 100, y: CGFloat(height), width: 200, height: 40)
                //mScrollView.addSubview(button)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                button.setTitle("\(value[j].cos!)", for: .normal)
                button.setTitleColor(UIColor.gray, for: .normal)
               // button.translatesAutoresizingMaskIntoConstraints = false
                testArray.append(height)
                header1.height = height
                header1.name = "\(value[j].cos!)"
                header.append(header1)
               // header?.testDataForHeight?.append(height.)
                mScrollView.addSubview(button)
                height += 50
                let row = value[j].rows
                let rowIndexAddABCD = (row?.count ?? -1) + 1
                var headerBool = 0
                    for rowtry in 0..<rowIndexAddABCD{
                            if j == 0 && headerBool == 0{
                                ynewOffset = height
                                xnewOffset = 16
                            } else {
                                xnewOffset = 16
                                ynewOffset = height //yaxis padding
                            }
                        
                        let widthHeightButton  = buttonWidthrowWise(index: row?[0].seats?.count ?? 0) - CGFloat(8)
                        if headerBool == 0 {//|| rowIndexAddABCD == headerBool + 1{
                            
                            print("\(rowtry)kishore rowtry inside configuration \(headerBool)")
                            headerBool += 1
                        for abcd in 0..<(value[j].configuration?.count ?? 0 ){
                            
                        if let configuartioValue = value[j].configuration {
                            let index = String.Index(encodedOffset: abcd)
                           // if rowIndexAddABCD == 0 || rowIndexAddABCD - 1 == rowtry {
                                button = UIButton()
                                //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.clear
                                if configuartioValue[index] != "-" {
                                button.setTitle("\(configuartioValue[index])", for: .normal)
                                    button.setTitleColor(UIColor.gray, for: .normal)
                                }
                                
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                xnewOffset = xnewOffset  + CGFloat(8) + widthHeightButton
                                mScrollView.addSubview(button)
                            }
                        if abcd  == (value[j].configuration?.count ?? 0 ) - 1{
                            height = ynewOffset + widthHeightButton + 8 //yaxis padding
                        }
                        }
                        }
                            else {
                                
                                print("\(rowtry)kishore rowtry \(headerBool)")
                                headerBool += 1
                        for seattry in 0..<(row?[rowtry - 1].seats?.count ?? -1){
                           // print(row?[rowtry].seats?[seattry].number
                            
                            var seatindexValue = row?[rowtry - 1].seats?[seattry]
                            
                            if seatindexValue?.exit == true {
                                button = UIButton()
                                button.backgroundColor = UIColor.red
                                button.frame = CGRect(x: 4, y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                mScrollView.addSubview(button)
                                if seattry  == (row?[rowtry - 1].seats?.count ?? 0) - 1{
                                    button = UIButton()
                                    button.backgroundColor = UIColor.red
                                    button.frame = CGRect(x: xnewOffset + widthHeightButton + 10 , y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                    //button.frame = CGRect(x: xnewOffset + widthHeightButton + 8 , y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                    mScrollView.addSubview(button)
                                }
                            }
                            if seatindexValue?.seatvalue == "-"  {
                                button = UIButton()
                                button.backgroundColor = UIColor.clear
                               // if row?[rowtry - 1].number != ""{
                                    //button.setTitle("Kishore", for: .normal)
                                button.titleLabel?.font = .systemFont(ofSize: 12)
                                button.setTitle("\((row?[rowtry - 1].number)!)", for: .normal)
                                button.setTitleColor(UIColor.gray, for: .normal)
                                //}
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                xnewOffset = xnewOffset  + CGFloat(8) + widthHeightButton
                                mScrollView.addSubview(button)
                            }else{
                                let imageSize:CGSize = CGSize(width: 20, height: 20)
                                button = UIButton()
                                button.backgroundColor = UIColor.gray
                                //button.setTitle("\((row?[rowtry - 1].seats?[seattry].number)!)", for: .normal)
                                //button.setImage(UIImage(named: "Icons_24px_Travel_"), for: .normal)
                                button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
                                button.imageView?.contentMode = .scaleAspectFit
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                xnewOffset = xnewOffset  + CGFloat(8) + widthHeightButton
                                button.layer.cornerRadius = 5
                                button.layer.borderWidth = 1
                                button.layer.borderColor = UIColor.gray.cgColor
                                imageView = UIImageView()
                                imageView = UIImageView(image: #imageLiteral(resourceName: "Icons_24px_Travel_"))
                                    imageView  = UIImageView(frame:CGRect(x: xnewOffset, y: CGFloat(ynewOffset ), width: widthHeightButton, height: widthHeightButton));
                                imageView.image = UIImage(named:"left")
                                imageView.backgroundColor = UIColor.clear
                                imageView.clipsToBounds = true
                                imageView.translatesAutoresizingMaskIntoConstraints = false
                                ///    imageView.image = UIImage(named:"Icons_24px_Travel_")
                                var iconbutton = UIButton()
                                iconbutton.setImage(UIImage(named: "action"), for: .normal)
                                iconbutton.backgroundColor = UIColor.green
                                iconbutton.imageView?.contentMode = .scaleAspectFill
                                iconbutton.frame = CGRect(x: xnewOffset - 18, y: CGFloat(ynewOffset - 8), width: 16, height: 16)
                                iconbutton.layer.cornerRadius = 0.5 * iconbutton.bounds.size.width
                                iconbutton.clipsToBounds = true
                               /* button.imageEdgeInsets = UIEdgeInsets(top: 8,left: 8,bottom: 8,right: 8)UIEdgeInsets(
                                        top: (button.frame.size.height - imageSize.height) / 2,
                                        left: (button.frame.size.width - imageSize.width) / 2,
                                        bottom: (button.frame.size.height - imageSize.height) / 2,
                                        right: (button.frame.size.width - imageSize.width) / 2)*/
                               // mScrollView.addSubview(imageView)
                                mScrollView.addSubview(button)
                                mScrollView.addSubview(iconbutton)
                                //mScrollView.addSubview(imageView)
                            }
                                //print("\(seattry) seat \(row?[rowtry].seats?.count ?? 0)")
                            if seattry  == (row?[rowtry - 1].seats?.count ?? 0) - 1{
                                height = ynewOffset + widthHeightButton + 8//yaxis padding
                            }
                        }
                        }
                    }
                
               /* var imageView : UIImageView
                    imageView  = UIImageView(frame:CGRect(x: 10, y: CGFloat(height ), width: 100, height: 40));
                    imageView.image = UIImage(named:"left")
                    self.mScrollView.addSubview(imageView)
                var leftimageView : UIImageView
                leftimageView  = UIImageView(frame:CGRect(x: 300, y: CGFloat(height ), width: 100, height: 40));
                leftimageView.image = UIImage(named:"right")
                    self.mScrollView.addSubview(leftimageView)*/
                //height = ynewOffset + 130
                
                
            }
        }
        
        
        mScrollView.contentSize = CGSize(width: 0, height: height)
    }
    func newFuncWorkingFine(){
        var xAxis:CGFloat = 10
        var yOffset:CGFloat = 10
        var xOffset:CGFloat = 10
        
        var height:CGFloat = 0
        
        var ynewOffset:CGFloat = 8
        var xnewOffset:CGFloat = 16
        //mScrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 50))
        
        
        //mScrollView.backgroundColor = UIColor.blue
        mScrollView.translatesAutoresizingMaskIntoConstraints = false
        if let value = self.test?.crmSeatMapResponse?.seatMap?.cabins {
            var button = UIButton()
            var imageView = UIImageView()
            //print(value.count)
            for j in 0..<value.count {
                
                let row = value[j].rows
                var rowIndexAddABCD = (row?.count ?? -1) + 1
                var headerBool = 0
                    for rowtry in 0..<rowIndexAddABCD{
                            if j == 0 && headerBool == 0{
                                ynewOffset = 8
                                xnewOffset = 16
                            } else {
                                xnewOffset = 16
                                ynewOffset = height + 20
                            }
                        
                        let widthHeightButton  = buttonWidthrowWise(index: row?[0].seats?.count ?? 0) - CGFloat(8)
                        if headerBool == 0 {//|| rowIndexAddABCD == headerBool + 1{
                            
                            print("\(rowtry)kishore rowtry inside configuration \(headerBool)")
                            headerBool += 1
                        for abcd in 0..<(value[j].configuration?.count ?? 0 ){
                            
                        if let configuartioValue = value[j].configuration {
                            let index = String.Index(encodedOffset: abcd)
                           // if rowIndexAddABCD == 0 || rowIndexAddABCD - 1 == rowtry {
                                button = UIButton()
                                //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.clear
                                if configuartioValue[index] != "-" {
                                button.setTitle("\(configuartioValue[index])", for: .normal)
                                    button.setTitleColor(UIColor.gray, for: .normal)
                                }
                                
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                xnewOffset = xnewOffset  + CGFloat(8) + widthHeightButton
                                mScrollView.addSubview(button)
                            }
                        if abcd  == (value[j].configuration?.count ?? 0 ) - 1{
                            height = ynewOffset + widthHeightButton + 10
                        }
                        }
                        }
                            else {
                                
                                print("\(rowtry)kishore rowtry \(headerBool)")
                                headerBool += 1
                        for seattry in 0..<(row?[rowtry - 1].seats?.count ?? -1){
                           // print(row?[rowtry].seats?[seattry].number
                            
                            var seatindexValue = row?[rowtry - 1].seats?[seattry]
                            
                            if seatindexValue?.exit == true {
                                button = UIButton()
                                button.backgroundColor = UIColor.red
                                button.frame = CGRect(x: 0, y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                mScrollView.addSubview(button)
                                if seattry  == (row?[rowtry - 1].seats?.count ?? 0) - 1{
                                    button = UIButton()
                                    button.backgroundColor = UIColor.red
                                    button.frame = CGRect(x: xnewOffset + widthHeightButton + 8 , y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                    mScrollView.addSubview(button)
                                }
                            }
                            if seatindexValue?.seatvalue == "-"  {
                                button = UIButton()
                                button.backgroundColor = UIColor.clear
                               // if row?[rowtry - 1].number != ""{
                                    //button.setTitle("Kishore", for: .normal)
                                button.setTitle("\((row?[rowtry - 1].number)!)", for: .normal)
                                button.setTitleColor(UIColor.gray, for: .normal)
                                //}
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                xnewOffset = xnewOffset  + CGFloat(8) + widthHeightButton
                                mScrollView.addSubview(button)
                            }else{
                                let imageSize:CGSize = CGSize(width: 20, height: 20)
                                button = UIButton()
                                button.backgroundColor = UIColor.gray
                                //button.setTitle("\((row?[rowtry - 1].seats?[seattry].number)!)", for: .normal)
                                //button.setImage(UIImage(named: "Icons_24px_Travel_"), for: .normal)
                                button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
                                button.imageView?.contentMode = .scaleAspectFit
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                xnewOffset = xnewOffset  + CGFloat(8) + widthHeightButton
                                button.layer.cornerRadius = 5
                                button.layer.borderWidth = 1
                                button.layer.borderColor = UIColor.gray.cgColor
                                imageView = UIImageView()
                                imageView = UIImageView(image: #imageLiteral(resourceName: "Icons_24px_Travel_"))
                                    imageView  = UIImageView(frame:CGRect(x: xnewOffset, y: CGFloat(ynewOffset ), width: widthHeightButton, height: widthHeightButton));
                                imageView.image = UIImage(named:"left")
                                imageView.backgroundColor = UIColor.clear
                                imageView.clipsToBounds = true
                                imageView.translatesAutoresizingMaskIntoConstraints = false
                                ///    imageView.image = UIImage(named:"Icons_24px_Travel_")
                                var iconbutton = UIButton()
                                iconbutton.setImage(UIImage(named: "action"), for: .normal)
                                iconbutton.backgroundColor = UIColor.green
                                iconbutton.imageView?.contentMode = .scaleAspectFill
                                iconbutton.frame = CGRect(x: xnewOffset - 18, y: CGFloat(ynewOffset - 8), width: 16, height: 16)
                                iconbutton.layer.cornerRadius = 0.5 * iconbutton.bounds.size.width
                                iconbutton.clipsToBounds = true
                               /* button.imageEdgeInsets = UIEdgeInsets(top: 8,left: 8,bottom: 8,right: 8)UIEdgeInsets(
                                        top: (button.frame.size.height - imageSize.height) / 2,
                                        left: (button.frame.size.width - imageSize.width) / 2,
                                        bottom: (button.frame.size.height - imageSize.height) / 2,
                                        right: (button.frame.size.width - imageSize.width) / 2)*/
                               // mScrollView.addSubview(imageView)
                                mScrollView.addSubview(button)
                                mScrollView.addSubview(iconbutton)
                                //mScrollView.addSubview(imageView)
                            }
                                //print("\(seattry) seat \(row?[rowtry].seats?.count ?? 0)")
                            if seattry  == (row?[rowtry - 1].seats?.count ?? 0) - 1{
                                height = ynewOffset + widthHeightButton + 10
                            }
                        }
                        }
                    }
                button = UIButton()
                button.frame = CGRect(x: 100, y: CGFloat(height), width: 200, height: 40)
                //mScrollView.addSubview(button)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                button.setTitle("\(value[j].cos!)", for: .normal)
                button.setTitleColor(UIColor.gray, for: .normal)
               // button.translatesAutoresizingMaskIntoConstraints = false
                mScrollView.addSubview(button)
                var imageView : UIImageView
                    imageView  = UIImageView(frame:CGRect(x: 10, y: CGFloat(height ), width: 100, height: 40));
                    imageView.image = UIImage(named:"left")
                    self.mScrollView.addSubview(imageView)
                var leftimageView : UIImageView
                leftimageView  = UIImageView(frame:CGRect(x: 300, y: CGFloat(height ), width: 100, height: 40));
                leftimageView.image = UIImage(named:"right")
                    self.mScrollView.addSubview(leftimageView)
            
                    /*let centerXConstraint = NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
                    let centerYConstraint = NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
                    NSLayoutConstraint.activate([centerXConstraint, centerYConstraint])*/
               // NSLayoutConstraint.activate([centerYConstraint])
                height = ynewOffset + 130
                
            }
        }
        
        
        mScrollView.contentSize = CGSize(width: 0, height: height)
    }
    func newFuncEqualSpacing(){
        var xAxis:CGFloat = 10
        var yOffset:CGFloat = 10
        var xOffset:CGFloat = 10
        
        var height:CGFloat = 0
        
        var ynewOffset:CGFloat = 8
        var xnewOffset:CGFloat = 16
        //mScrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 50))
        
        
        //mScrollView.backgroundColor = UIColor.blue
        mScrollView.translatesAutoresizingMaskIntoConstraints = false
        if let value = self.test?.crmSeatMapResponse?.seatMap?.cabins {
            var button = UIButton()
            var imageView = UIImageView()
            //print(value.count)
            for j in 0..<value.count {
                
                let row = value[j].rows
                var rowIndexAddABCD = (row?.count ?? -1) + 1
                var headerBool = 0
                    for rowtry in 0..<rowIndexAddABCD{
                            if j == 0 && headerBool == 0{
                                ynewOffset = 8
                                xnewOffset = 16
                            } else {
                                xnewOffset = 16
                                ynewOffset = height + 20
                            }
                        
                        let paddingButton  = buttonPadding(index:  row?[0].seats?.count ?? 0)
                        let widthHeightButton  = buttonWidth(index: row?[0].seats?.count ?? 0) - paddingButton//buttonWidthrowWise(index: row?[0].seats?.count ?? 0) - CGFloat(8)
                        if headerBool == 0 {//|| rowIndexAddABCD == headerBool + 1{
                            
                            print("\(rowtry)kishore rowtry inside configuration \(headerBool)")
                            headerBool += 1
                        for abcd in 0..<(value[j].configuration?.count ?? 0 ){
                            
                        if let configuartioValue = value[j].configuration {
                            let index = String.Index(encodedOffset: abcd)
                           // if rowIndexAddABCD == 0 || rowIndexAddABCD - 1 == rowtry {
                                button = UIButton()
                                //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.clear
                                if configuartioValue[index] != "-" {
                                button.setTitle("\(configuartioValue[index])", for: .normal)
                                    button.setTitleColor(UIColor.gray, for: .normal)
                                }
                                
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                xnewOffset = xnewOffset  + paddingButton + widthHeightButton
                                mScrollView.addSubview(button)
                            }
                        if abcd  == (value[j].configuration?.count ?? 0 ) - 1{
                            height = ynewOffset + widthHeightButton + 10
                        }
                        }
                        }
                            else {
                                
                                print("\(rowtry)kishore rowtry \(headerBool)")
                                headerBool += 1
                        for seattry in 0..<(row?[rowtry - 1].seats?.count ?? -1){
                           // print(row?[rowtry].seats?[seattry].number
                            
                            var seatindexValue = row?[rowtry - 1].seats?[seattry]
                            
                            if seatindexValue?.exit == true {
                                button = UIButton()
                                button.backgroundColor = UIColor.red
                                button.frame = CGRect(x: 0, y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                mScrollView.addSubview(button)
                                if seattry  == (row?[rowtry - 1].seats?.count ?? 0) - 1{
                                    button = UIButton()
                                    button.backgroundColor = UIColor.red
                                    button.frame = CGRect(x: xnewOffset + widthHeightButton + 8 , y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                    mScrollView.addSubview(button)
                                }
                            }
                            if seatindexValue?.seatvalue == "-"  {
                                button = UIButton()
                                button.backgroundColor = UIColor.clear
                               // if row?[rowtry - 1].number != ""{
                                    //button.setTitle("Kishore", for: .normal)
                                button.setTitle("\((row?[rowtry - 1].number)!)", for: .normal)
                                button.setTitleColor(UIColor.gray, for: .normal)
                                //}
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                xnewOffset = xnewOffset  + paddingButton + widthHeightButton
                                mScrollView.addSubview(button)
                            }else{
                                let imageSize:CGSize = CGSize(width: 20, height: 20)
                                button = UIButton()
                                button.backgroundColor = UIColor.gray
                                //button.setTitle("\((row?[rowtry - 1].seats?[seattry].number)!)", for: .normal)
                                //button.setImage(UIImage(named: "Icons_24px_Travel_"), for: .normal)
                                button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
                                button.imageView?.contentMode = .scaleAspectFit
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                xnewOffset = xnewOffset  + paddingButton + widthHeightButton
                                button.layer.cornerRadius = 5
                                button.layer.borderWidth = 1
                                button.layer.borderColor = UIColor.gray.cgColor
                                imageView = UIImageView()
                                imageView = UIImageView(image: #imageLiteral(resourceName: "Icons_24px_Travel_"))
                                    imageView  = UIImageView(frame:CGRect(x: xnewOffset, y: CGFloat(ynewOffset ), width: widthHeightButton, height: widthHeightButton));
                                imageView.image = UIImage(named:"left")
                                imageView.backgroundColor = UIColor.clear
                                imageView.clipsToBounds = true
                                imageView.translatesAutoresizingMaskIntoConstraints = false
                                ///    imageView.image = UIImage(named:"Icons_24px_Travel_")
                                var iconbutton = UIButton()
                                iconbutton.setImage(UIImage(named: "action"), for: .normal)
                                iconbutton.backgroundColor = UIColor.green
                                iconbutton.imageView?.contentMode = .scaleAspectFill
                                iconbutton.frame = CGRect(x: xnewOffset - 18, y: CGFloat(ynewOffset - 8), width: 16, height: 16)
                                iconbutton.layer.cornerRadius = 0.5 * iconbutton.bounds.size.width
                                iconbutton.clipsToBounds = true
                               /* button.imageEdgeInsets = UIEdgeInsets(top: 8,left: 8,bottom: 8,right: 8)UIEdgeInsets(
                                        top: (button.frame.size.height - imageSize.height) / 2,
                                        left: (button.frame.size.width - imageSize.width) / 2,
                                        bottom: (button.frame.size.height - imageSize.height) / 2,
                                        right: (button.frame.size.width - imageSize.width) / 2)*/
                               // mScrollView.addSubview(imageView)
                                mScrollView.addSubview(button)
                                mScrollView.addSubview(iconbutton)
                                //mScrollView.addSubview(imageView)
                            }
                                //print("\(seattry) seat \(row?[rowtry].seats?.count ?? 0)")
                            if seattry  == (row?[rowtry - 1].seats?.count ?? 0) - 1{
                                height = ynewOffset + widthHeightButton + 10
                            }
                        }
                        }
                    }
                button = UIButton()
                button.frame = CGRect(x: 100, y: CGFloat(height), width: 200, height: 40)
                //mScrollView.addSubview(button)
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                button.setTitle("\(value[j].cos!)", for: .normal)
                button.setTitleColor(UIColor.gray, for: .normal)
               // button.translatesAutoresizingMaskIntoConstraints = false
                mScrollView.addSubview(button)
                /*var imageView : UIImageView
                    imageView  = UIImageView(frame:CGRect(x: 10, y: CGFloat(height ), width: 100, height: 40));
                    imageView.image = UIImage(named:"left")
                    self.mScrollView.addSubview(imageView)
                var leftimageView : UIImageView
                leftimageView  = UIImageView(frame:CGRect(x: 300, y: CGFloat(height ), width: 100, height: 40));
                leftimageView.image = UIImage(named:"right")
                    self.mScrollView.addSubview(leftimageView)*/
            
                    /*let centerXConstraint = NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
                    let centerYConstraint = NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
                    NSLayoutConstraint.activate([centerXConstraint, centerYConstraint])*/
               // NSLayoutConstraint.activate([centerYConstraint])
                height = ynewOffset + 130
                
            }
        }
        
        
        mScrollView.contentSize = CGSize(width: 0, height: height)
    }
    func newFuncwith4Padding(){
        var xAxis:CGFloat = 10
        var yOffset:CGFloat = 10
        var xOffset:CGFloat = 10
        
        var height:CGFloat = 0
        
        var ynewOffset:CGFloat = 8
        var xnewOffset:CGFloat = 16
        //mScrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 50))
        
        
        mScrollView.backgroundColor = UIColor.blue
        mScrollView.translatesAutoresizingMaskIntoConstraints = false
        if let value = self.test?.crmSeatMapResponse?.seatMap?.cabins {
            var button = UIButton()
            //print(value.count)
            for j in 0..<value.count {
                
                let row = value[j].rows
                var rowIndexAddABCD = (row?.count ?? -1)
                    for rowtry in 0..<rowIndexAddABCD{
                            if j == 0 && rowtry == 0{
                                ynewOffset = 8
                                xnewOffset = 16
                            } else {
                                xnewOffset = 16
                                ynewOffset = height + 20
                            }
                        for seattry in 0..<(row?[rowtry].seats?.count ?? -1){
                           // print(row?[rowtry].seats?[seattry].number)
                            var seatindexValue = row?[rowtry].seats?[seattry]
                            let widthHeightButton  = buttonWidthrowWise(index: row?[rowtry].seats?.count ?? 0) - CGFloat(4)
                            if seatindexValue?.exit == true {
                                button = UIButton()
                                button.backgroundColor = UIColor.red
                                button.frame = CGRect(x: 0, y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                mScrollView.addSubview(button)
                                if seattry  == (row?[rowtry].seats?.count ?? 0) - 1{
                                    button = UIButton()
                                    button.backgroundColor = UIColor.red
                                    button.frame = CGRect(x: xnewOffset + widthHeightButton + 8 , y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                    mScrollView.addSubview(button)
                                }
                            }
                            if seatindexValue?.seatvalue == "-"  {
                                button = UIButton()
                                button.backgroundColor = UIColor.clear
                                if row?[rowtry].number == ""{
                                button.setTitle("\((row?[rowtry].number)!)", for: .normal)
                                }
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                xnewOffset = xnewOffset  + CGFloat(4) + widthHeightButton
                                mScrollView.addSubview(button)
                            }else{
                                button = UIButton()
                                button.backgroundColor = UIColor.gray
                               // button.setTitle("\((row?[rowtry].seats?[seattry].number)!)", for: .normal)
                                button.setImage(UIImage(named: "Icons_24px_Travel_"), for: .normal)
                                button.imageView?.contentMode = .scaleAspectFill
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                xnewOffset = xnewOffset  + CGFloat(4) + widthHeightButton
                                mScrollView.addSubview(button)
                            }
                            if seattry  == (row?[rowtry].seats?.count ?? 0) - 1{
                                height = ynewOffset + widthHeightButton + 10
                            }
                        }

                    }
            }
        }
        
        
        mScrollView.contentSize = CGSize(width: 0, height: height)
    }
    func newFuncRowWise(){
        var xAxis:CGFloat = 10
        var yOffset:CGFloat = 10
        var xOffset:CGFloat = 10
        
        var height:CGFloat = 0
        
        var ynewOffset:CGFloat = 8
        var xnewOffset:CGFloat = 16
        //mScrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 50))
        
        
        mScrollView.backgroundColor = UIColor.blue
        mScrollView.translatesAutoresizingMaskIntoConstraints = false
        if let value = self.test?.crmSeatMapResponse?.seatMap?.cabins {
            var button = UIButton()
            //print(value.count)
            for j in 0..<value.count {
                
                let row = value[j].rows
                isFirstRowInCabin = true
                /*if j == 0 {
                    yOffset = 10
                }*/
                var rowIndexAddABCD = (row?.count ?? -1)
                // print(row?.count)
                /*for abcd in 0..<(value[j].configuration?.count ?? 0 ){
                    if j == 0 && abcd == 0{
                        yOffset = 10
                        xOffset = 10
                       // rowIndexAddABCD += 2
                    } else {
                        if j != 0 {
                            
                            if abcd == 0 {
                                yOffset += 10
                            xOffset = 10
                                
                            }else{
                                xOffset += 60
                              yOffset = height
                            }
                        } else{
                            yOffset = 10
                            xOffset += 60
                        }
                    }*/
                    for rowtry in 0..<rowIndexAddABCD{
                        //print("\(row?[rowtry].number) - Kishore")
                        var testFrist : Bool = true
                       /* if rowtry == 0 || rowIndexAddABCD - 1 == rowtry {
                            testFrist = false
                        }*/
                        //if testFrist{
                            if j == 0 && rowtry == 0{
                                ynewOffset = 8
                                xnewOffset = 16
                               // rowIndexAddABCD += 2
                            } else {
                                xnewOffset = 16
                                ynewOffset = height + 20
                                /*if rowtry != 0 {
                                    
                                    if rowtry == 0 {
                                        ynewOffset += 10
                                        xnewOffset = 10
                                        
                                    }else{
                                       // xnewOffset += 60
                                        xnewOffset = 10
                                        ynewOffset = height
                                    }
                                } else{
                                    ynewOffset = 10
                                    xnewOffset += 60
                                }*/
                            }
                        for seattry in 0..<(row?[rowtry].seats?.count ?? -1){
                           // print(row?[rowtry].seats?[seattry].number)
                            var seatindexValue = row?[rowtry].seats?[seattry]
                            let widthHeightButton  = buttonWidth(index: row?[rowtry].seats?.count ?? 0) - CGFloat( 8)
                            if seatindexValue?.exit == true {
                                button = UIButton()
                                //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.red
                               // button.setTitle("\((row?[rowtry].seats?[seattry].number)!)", for: .normal)
                                //button.setTitle("\((row?[rowtry].number)!)", for: .normal)

                                
                                button.frame = CGRect(x: 0, y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                //print(yOffset)
                                
                                
                                //xnewOffset = xnewOffset  + CGFloat(10) + button.frame.size.width
                               // print(yOffset)
                                mScrollView.addSubview(button)
                                if seattry  == (row?[rowtry].seats?.count ?? 0) - 1{
                                    button = UIButton()
                                    //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                    button.backgroundColor = UIColor.red
                                   // button.setTitle("\((row?[rowtry].seats?[seattry].number)!)", for: .normal)
                                    //button.setTitle("\((row?[rowtry].number)!)", for: .normal)

                                    
                                    button.frame = CGRect(x: xnewOffset + widthHeightButton + 10 , y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                    //print(yOffset)
                                    
                                    
                                    //xnewOffset = xnewOffset  + CGFloat(10) + button.frame.size.width
                                   // print(yOffset)
                                    mScrollView.addSubview(button)
                                }
                            }
                           /* let stackView   = UIStackView()
                            stackView.axis  = NSLayoutConstraint.Axis.vertical
                            stackView.distribution  = UIStackView.Distribution.equalSpacing
                            stackView.alignment = UIStackView.Alignment.center
                            stackView.spacing   = 16.0
                            stackView.addArrangedSubview(imageView)
                            stackView.addArrangedSubview(textLabel)
                            stackView.translatesAutoresizingMaskIntoConstraints = false*/
                            if seatindexValue?.number == ""  {
                                print("\(seatindexValue?.number) Kishore16 \(seattry) -seat \(rowtry) - row")
                                button = UIButton()
                                //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.green
                               // button.setTitle("\((row?[rowtry].seats?[seattry].number)!)", for: .normal)
                                button.setTitle("\((row?[rowtry].number)!)", for: .normal)

                                
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                //print(yOffset)
                                xnewOffset = xnewOffset  + CGFloat(8) + widthHeightButton
                                
                                //xnewOffset = xnewOffset  + CGFloat(10) + button.frame.size.width
                               // print(yOffset)
                                mScrollView.addSubview(button)
                            }else{
                                print("\(seatindexValue?.number) Kishore17 \(seattry) -seat \(rowtry) - row")
                                button = UIButton()
                                //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.gray
                               // button.setTitle("\((row?[rowtry].seats?[seattry].number)!)", for: .normal)
                                button.setImage(UIImage(named: "Icons_24px_Travel_"), for: .normal)
                                button.imageView?.contentMode = .scaleAspectFill
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                //print(yOffset)
                                
                                
                                xnewOffset = xnewOffset  + CGFloat(8) + widthHeightButton//button.frame.size.width
                               // print(yOffset)
                                mScrollView.addSubview(button)
                            }
                            if seattry  == (row?[rowtry].seats?.count ?? 0) - 1{
                                height = ynewOffset + widthHeightButton + 10
                                xnewOffset = 10
                            }
                            
                            
                         /*   if let configuartioValue = value[j].configuration {
                                
                               let index = String.Index(encodedOffset: abcd)
                                //print("\(configuartioValue[index]) Kishore16 \(seattry) -seat \(rowtry) - row")
                                 if configuartioValue[index] == "-"{
                                    //print("\(rowindex)")
                                    button = UIButton()
                                    //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                    button.backgroundColor = UIColor.clear
                                    button.setTitle("\(row?[rowtry].seats?[seattry].number)", for: .normal)
                                    
                                    button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: 53, height: 50)
                                    //print(yOffset)
                                    
                                    
                                    yOffset = yOffset  + CGFloat(10) + button.frame.size.width
                                   // print(yOffset)
                                    mScrollView.addSubview(button)
                                    
                                }else{
                                    button = UIButton()
                                   // button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                    button.backgroundColor = UIColor.darkGray
                                    button.setTitle("\(row?[rowtry].seats?[seattry].number)", for: .normal)
                                    
                                    button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: 53, height: 50)
                                    //print(yOffset)
                                    
                                    
                                    yOffset = yOffset  + CGFloat(10) + button.frame.size.width
                                   // print(yOffset)
                                    mScrollView.addSubview(button)
                                    //print("\(configuartioValue[index]) Kishore16 \(rowindex)")
                                }
                            }*/
                        }
                       // }

                    }
                    
                   /* for rowindex in 0..<rowIndexAddABCD {
                        //print(row?[rowindex].seats?.count)
                       // var seatValue = row?[rowindex].seats
                        
                        if let configuartioValue = value[j].configuration {
                           let index = String.Index(encodedOffset: abcd)
                            if rowindex == 0 || rowIndexAddABCD - 1 == rowindex {
                                print("\(rowindex)")
                                button = UIButton()
                                button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.clear
                                if configuartioValue[index] != "-" {
                                button.setTitle("\(configuartioValue[index])", for: .normal)
                                }
                                
                                button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: 53, height: 50)
                                print(yOffset)
                                
                                
                                yOffset = yOffset  + CGFloat(10) + button.frame.size.width
                                print(yOffset)
                                mScrollView.addSubview(button)
                            }else if configuartioValue[index] == "-"{
                                print("\(rowindex)")
                                button = UIButton()
                                button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.clear
                                button.setTitle("\(rowindex)", for: .normal)
                                
                                button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: 53, height: 50)
                                print(yOffset)
                                
                                
                                yOffset = yOffset  + CGFloat(10) + button.frame.size.width
                                print(yOffset)
                                mScrollView.addSubview(button)
                                
                            }else{
                                button = UIButton()
                                button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.darkGray
                                button.setTitle("\(configuartioValue[index])-\(rowindex)", for: .normal)
                                
                                button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: 53, height: 50)
                                print(yOffset)
                                
                                
                                yOffset = yOffset  + CGFloat(10) + button.frame.size.width
                                print(yOffset)
                                mScrollView.addSubview(button)
                                print("\(configuartioValue[index]) Kishore16 \(rowindex)")
                            }
                        }
                        if rowIndexAddABCD - 1 == rowindex && abcd  == value[j].configuration!.count - 1{
                            height = yOffset + 10
                        }
                    }*/
                    //height = yOffset
                   // yOffset = 10
                   // xOffset += 60
               // }
                print(yOffset)
                print(xOffset)
                
                /*yOffset = height + 10
                 xOffset = 10
                 print(xOffset)
                 print( height)*/
                /*yOffset = CGFloat((row?.count ?? 0) * 40 * value.count ) ?? 0
                 xOffset = 10
                 print(yOffset)
                 print(xOffset)*/
                //yOffset += yOffset
                // xOffset = 10
                print(value[j].cos)// header
            }
        }
        
        
        mScrollView.contentSize = CGSize(width: 0, height: height)
    }
    func buttonWidthrowWise(index: Int) -> CGFloat{
        return (view.frame.width - 40) / CGFloat(index)
    }
    
    func buttonWidth(index: Int) -> CGFloat{
       // return (view.frame.width - 40) / CGFloat(index)
        switch (index)  {
            
          case 3:
            return 70
        case 4:
          return 65
        case 5:
          return 60
        case 6:
          return 55
        case 7:
          return 50
        case 8:
          return 45
        case 9:
          return 40
        case 10:
          return 35
        case 11:
          return 30
        case 12:
          return 25
                
          default:
            return 0
        }
    }
    func buttonPadding(index: Int) -> CGFloat{
       // return (view.frame.width - 40) / CGFloat(index)
        switch (index)  {
            
          case 3:
            return 20
        case 4:
          return 15
        case 5:
          return 15
        case 6:
          return 15
        case 7:
          return 12
        case 8:
          return 13
        case 9:
          return 12
        case 10:
          return 8
        case 11:
          return 8
        case 12:
          return 8
                
          default:
            return 0
        }
    }
    func newFuncclounmWise(){
        var xAxis:CGFloat = 10
        var yOffset:CGFloat = 10
        var xOffset:CGFloat = 10
        
        var height:CGFloat = 0
        
        var ynewOffset:CGFloat = 8
        var xnewOffset:CGFloat = 16
        //mScrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 50))
        
        
        mScrollView.backgroundColor = UIColor.blue
        mScrollView.translatesAutoresizingMaskIntoConstraints = false
        if let value = self.test?.crmSeatMapResponse?.seatMap?.cabins {
            var button = UIButton()
            //print(value.count)
            for j in 0..<value.count {
                
                let row = value[j].rows
                isFirstRowInCabin = true
                /*if j == 0 {
                    yOffset = 10
                }*/
                var rowIndexAddABCD = (row?.count ?? -1)
                // print(row?.count)
                for abcd in 0..<(value[j].configuration?.count ?? 0 ){
                    if j == 0 && abcd == 0{
                        yOffset = 10
                        xOffset = 10
                       // rowIndexAddABCD += 2
                    } else {
                        if j != 0 {
                            
                            if abcd == 0 {
                                yOffset += 10
                            xOffset = 10
                                
                            }else{
                                xOffset += 60
                              yOffset = height
                            }
                        } else{
                            yOffset = 10
                            xOffset += 60
                        }
                    }
                   /* for rowtry in 0..<rowIndexAddABCD{
                        //print("\(row?[rowtry].number) - Kishore")
                        var testFrist : Bool = true
                       /* if rowtry == 0 || rowIndexAddABCD - 1 == rowtry {
                            testFrist = false
                        }*/
                        //if testFrist{
                            if j == 0 && rowtry == 0{
                                ynewOffset = 8
                                xnewOffset = 16
                               // rowIndexAddABCD += 2
                            } else {
                                xnewOffset = 16
                                ynewOffset = height + 20
                                /*if rowtry != 0 {
                                    
                                    if rowtry == 0 {
                                        ynewOffset += 10
                                        xnewOffset = 10
                                        
                                    }else{
                                       // xnewOffset += 60
                                        xnewOffset = 10
                                        ynewOffset = height
                                    }
                                } else{
                                    ynewOffset = 10
                                    xnewOffset += 60
                                }*/
                            }
                        for seattry in 0..<(row?[rowtry].seats?.count ?? -1){
                           // print(row?[rowtry].seats?[seattry].number)
                            var seatindexValue = row?[rowtry].seats?[seattry]
                            let widthHeightButton  = buttonWidth(index: row?[rowtry].seats?.count ?? 0) - CGFloat( 8)
                            if seatindexValue?.exit == true {
                                button = UIButton()
                                //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.red
                               // button.setTitle("\((row?[rowtry].seats?[seattry].number)!)", for: .normal)
                                //button.setTitle("\((row?[rowtry].number)!)", for: .normal)

                                
                                button.frame = CGRect(x: 0, y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                //print(yOffset)
                                
                                
                                //xnewOffset = xnewOffset  + CGFloat(10) + button.frame.size.width
                               // print(yOffset)
                                mScrollView.addSubview(button)
                                if seattry  == (row?[rowtry].seats?.count ?? 0) - 1{
                                    button = UIButton()
                                    //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                    button.backgroundColor = UIColor.red
                                   // button.setTitle("\((row?[rowtry].seats?[seattry].number)!)", for: .normal)
                                    //button.setTitle("\((row?[rowtry].number)!)", for: .normal)

                                    
                                    button.frame = CGRect(x: xnewOffset + widthHeightButton + 10 , y: CGFloat(ynewOffset), width: 5, height: widthHeightButton)
                                    //print(yOffset)
                                    
                                    
                                    //xnewOffset = xnewOffset  + CGFloat(10) + button.frame.size.width
                                   // print(yOffset)
                                    mScrollView.addSubview(button)
                                }
                            }
                           /* let stackView   = UIStackView()
                            stackView.axis  = NSLayoutConstraint.Axis.vertical
                            stackView.distribution  = UIStackView.Distribution.equalSpacing
                            stackView.alignment = UIStackView.Alignment.center
                            stackView.spacing   = 16.0
                            stackView.addArrangedSubview(imageView)
                            stackView.addArrangedSubview(textLabel)
                            stackView.translatesAutoresizingMaskIntoConstraints = false*/
                            if seatindexValue?.number == ""  {
                                print("\(seatindexValue?.number) Kishore16 \(seattry) -seat \(rowtry) - row")
                                button = UIButton()
                                //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.green
                               // button.setTitle("\((row?[rowtry].seats?[seattry].number)!)", for: .normal)
                                button.setTitle("\((row?[rowtry].number)!)", for: .normal)

                                
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                //print(yOffset)
                                xnewOffset = xnewOffset  + CGFloat(8) + widthHeightButton
                                
                                //xnewOffset = xnewOffset  + CGFloat(10) + button.frame.size.width
                               // print(yOffset)
                                mScrollView.addSubview(button)
                            }else{
                                print("\(seatindexValue?.number) Kishore17 \(seattry) -seat \(rowtry) - row")
                                button = UIButton()
                                //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.gray
                               // button.setTitle("\((row?[rowtry].seats?[seattry].number)!)", for: .normal)
                                button.setImage(UIImage(named: "Icons_24px_Travel_"), for: .normal)
                                button.imageView?.contentMode = .scaleAspectFill
                                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: widthHeightButton, height: widthHeightButton)
                                //print(yOffset)
                                
                                
                                xnewOffset = xnewOffset  + CGFloat(8) + widthHeightButton//button.frame.size.width
                               // print(yOffset)
                                mScrollView.addSubview(button)
                            }
                            if seattry  == (row?[rowtry].seats?.count ?? 0) - 1{
                                height = ynewOffset + widthHeightButton + 10
                                xnewOffset = 10
                            }
                            
                            
                         /*   if let configuartioValue = value[j].configuration {
                                
                               let index = String.Index(encodedOffset: abcd)
                                //print("\(configuartioValue[index]) Kishore16 \(seattry) -seat \(rowtry) - row")
                                 if configuartioValue[index] == "-"{
                                    //print("\(rowindex)")
                                    button = UIButton()
                                    //button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                    button.backgroundColor = UIColor.clear
                                    button.setTitle("\(row?[rowtry].seats?[seattry].number)", for: .normal)
                                    
                                    button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: 53, height: 50)
                                    //print(yOffset)
                                    
                                    
                                    yOffset = yOffset  + CGFloat(10) + button.frame.size.width
                                   // print(yOffset)
                                    mScrollView.addSubview(button)
                                    
                                }else{
                                    button = UIButton()
                                   // button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                    button.backgroundColor = UIColor.darkGray
                                    button.setTitle("\(row?[rowtry].seats?[seattry].number)", for: .normal)
                                    
                                    button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: 53, height: 50)
                                    //print(yOffset)
                                    
                                    
                                    yOffset = yOffset  + CGFloat(10) + button.frame.size.width
                                   // print(yOffset)
                                    mScrollView.addSubview(button)
                                    //print("\(configuartioValue[index]) Kishore16 \(rowindex)")
                                }
                            }*/
                        }
                       // }

                    }*/
                    
                    for rowindex in 0..<rowIndexAddABCD {
                        //print(row?[rowindex].seats?.count)
                       // var seatValue = row?[rowindex].seats
                        //Kishore abcd
                        if let configuartioValue = value[j].configuration {
                           let index = String.Index(encodedOffset: abcd)
                            if rowindex == 0 || rowIndexAddABCD - 1 == rowindex {
                                print("\(rowindex)")
                                button = UIButton()
                                button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.clear
                                if configuartioValue[index] != "-" {
                                button.setTitle("\(configuartioValue[index])", for: .normal)
                                }
                                
                                button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: 53, height: 50)
                                print(yOffset)
                                
                                
                                yOffset = yOffset  + CGFloat(10) + button.frame.size.width
                                print(yOffset)
                                mScrollView.addSubview(button)
                            }else if configuartioValue[index] == "-"{
                                print("\(rowindex)")
                                button = UIButton()
                                button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.clear
                                button.setTitle("\(rowindex)", for: .normal)
                                
                                button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: 53, height: 50)
                                print(yOffset)
                                
                                
                                yOffset = yOffset  + CGFloat(10) + button.frame.size.width
                                print(yOffset)
                                mScrollView.addSubview(button)
                                
                            }else{
                                button = UIButton()
                                button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.darkGray
                                button.setTitle("\(configuartioValue[index])-\(rowindex)", for: .normal)
                                
                                button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: 53, height: 50)
                                print(yOffset)
                                
                                
                                yOffset = yOffset  + CGFloat(10) + button.frame.size.width
                                print(yOffset)
                                mScrollView.addSubview(button)
                                print("\(configuartioValue[index]) Kishore16 \(rowindex)")
                            }
                        }
                        if rowIndexAddABCD - 1 == rowindex && abcd  == value[j].configuration!.count - 1{
                            height = yOffset + 10
                        }
                    }
                    //height = yOffset
                   // yOffset = 10
                   // xOffset += 60
                }
                print(yOffset)
                print(xOffset)
                
                /*yOffset = height + 10
                 xOffset = 10
                 print(xOffset)
                 print( height)*/
                /*yOffset = CGFloat((row?.count ?? 0) * 40 * value.count ) ?? 0
                 xOffset = 10
                 print(yOffset)
                 print(xOffset)*/
                //yOffset += yOffset
                // xOffset = 10
                print(value[j].cos)// header
            }
        }
        
        
        mScrollView.contentSize = CGSize(width: 0, height: height)
    }
    func newFuncworking(){
        var xAxis:CGFloat = 10
        var yOffset:CGFloat = 10
        var xOffset:CGFloat = 10
        
        var height:CGFloat = 0
        
        //mScrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 50))
        
        
        mScrollView.backgroundColor = UIColor.blue
        mScrollView.translatesAutoresizingMaskIntoConstraints = false
        if let value = self.test?.crmSeatMapResponse?.seatMap?.cabins {
            var button = UIButton()
            //print(value.count)
            for j in 0..<value.count {
                
                let row = value[j].rows
                isFirstRowInCabin = true
                if j == 0 {
                    yOffset = 10
                }
                
                // print(row?.count)
                for abcd in 0..<(value[j].configuration?.count ?? 0 ){
                    if j == 0 && abcd == 0{
                        yOffset = 10
                        xOffset = 10
                    } else {
                        if j != 0 {
                            
                            if abcd == 0 {
                                yOffset += 10
                            xOffset = 10
                                
                            }else{
                                xOffset += 60
                              yOffset = height
                            }
                        } else{
                            yOffset = 10
                            xOffset += 60
                        }
                    }
                    for rowindex in 0..<(row?.count ?? -1) {
                        if let configuartioValue = value[j].configuration {
                            let index = String.Index(encodedOffset: abcd)
                            if configuartioValue[index] == "-"{
                                print("\(rowindex)")
                                button = UIButton()
                                button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.clear
                                button.setTitle("\(rowindex)", for: .normal)
                                
                                button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: 53, height: 50)
                                print(yOffset)
                                
                                
                                yOffset = yOffset  + CGFloat(10) + button.frame.size.width
                                print(yOffset)
                                mScrollView.addSubview(button)
                                
                            }else{
                                button = UIButton()
                                button.tag = rowindex//"\(configuartioValue[index]) - \(rowindex) "
                                button.backgroundColor = UIColor.darkGray
                                button.setTitle("\(configuartioValue[index])-\(rowindex)", for: .normal)
                                
                                button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: 53, height: 50)
                                print(yOffset)
                                
                                
                                yOffset = yOffset  + CGFloat(10) + button.frame.size.width
                                print(yOffset)
                                mScrollView.addSubview(button)
                                print("\(configuartioValue[index]) Kishore16 \(rowindex)")
                            }
                        }
                        if row!.count - 1 == rowindex && abcd  == value[j].configuration!.count - 1{
                            height = yOffset + 10
                        }
                    }
                    //height = yOffset
                   // yOffset = 10
                   // xOffset += 60
                }
                print(yOffset)
                print(xOffset)
                
                /*yOffset = height + 10
                 xOffset = 10
                 print(xOffset)
                 print( height)*/
                /*yOffset = CGFloat((row?.count ?? 0) * 40 * value.count ) ?? 0
                 xOffset = 10
                 print(yOffset)
                 print(xOffset)*/
                //yOffset += yOffset
                // xOffset = 10
                print(value[j].cos)// header
            }
        }
        
        
        mScrollView.contentSize = CGSize(width: yOffset, height: yOffset)
    }
    func dynamicButtonCreationNew() {
        var buttonPadding:CGFloat = 10
        var xOffset:CGFloat = 10

            //mScrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 50))
           

            mScrollView.backgroundColor = UIColor.blue
            mScrollView.translatesAutoresizingMaskIntoConstraints = false
        if let value = self.test?.crmSeatMapResponse?.seatMap?.cabins {
            
            print(value.count)
            for j in 0..<value.count {
                
                let row = value[j].rows
                isFirstRowInCabin = true
                print(row?.count)
                for i in 0..<(row?.count ?? -1) {
                    let button = UIButton()
                    var seatIndex = 0;
                    var valueConfigution = 0
                    var isExitRow = false
                    for k in 0..<(value[j].configuration?.count ?? 0 ) {
                        
                        if let configuartioValue = value[j].configuration {
                            let replaced = configuartioValue.replacingOccurrences(of: "-", with: "")
                            let index = String.Index(encodedOffset: k)
                            //AB-DEFG-KL
                            if configuartioValue[index] == "-"{
                                    
                                    seatIndex += 1
                                }else{
                                    for p in 1...(row?.count ?? 0){
                                        print("\(configuartioValue[index]) - Kishore15 \(p) \(seatIconBtnsIndex)")
                                    }
                                    
                                    
                                    let seat = row?[i].seats?[seatIndex]
                                    seatIconBtnsIndex += 1
                                    //valueConfigution += 1
                                    print("\(configuartioValue[index]) - Kishore14 \(j) \(seatIconBtnsIndex) \(valueConfigution)")
                                   /* button.tag = i // A1
                                     button.backgroundColor = UIColor.darkGray
                                     button.setTitle("\(seatIconBtnsIndex)", for: .normal)
                                     //button.addTarget(self, action: #selector(btnTouch), for: UIControlEvents.touchUpInside)

                                     button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 53, height: 30)
                                     print(xOffset)
                                     

                                     xOffset = xOffset  + CGFloat(10) + button.frame.size.width
                                     print(xOffset)
                                     mScrollView.addSubview(button)
                                     
                                    if valueConfigution < replaced.count || valueConfigution != 0 {
                                        valueConfigution += 1
                                        print(valueConfigution)
                                        buttonPadding += 50
                                      //  xOffset = 10
                                    }else{
                                        valueConfigution = 0
                                        //buttonPadding += 50
                                         xOffset = 10
                                    }*/
                                    seatIndex += 1
                                }
                            //buttonPadding += 50
                           // xOffset = 10
                        }
                    }
                  /*  for valueconfig in value[j].configuration ?? "" {
                    if valueconfig == "-"{
                        print("- Kishore1 - ")
                        seatIndex += 1
                    }else{
                        print("\(valueconfig) - Kishore1 \(j)")
                        let seat = row?[i].seats?[seatIndex]
                        seatIconBtnsIndex += 1
                        print(<#T##items: Any...##Any#>)
                        //let seatVM = seatsVMData["\(seatIconBtnsIndex)"] as? UALSeatVMCRM//
                        let seatVM = seatsVMData?["\(seatIconBtnsIndex)"] as? UALSeatVMCRM
                        let avgSeatHeight = cabinAvgSeatHeightData?[j]
                        
                        if !isExitRow && ((seat?.exit) != nil) {
                            isExitRow = true
                        }

                        seatVM?.isExit = seat?.exit ?? false

                        var seatName = ""
                        seatName = seatVM?.seatNameOverride ?? ""
                        
                        drawSeatIcon(seatName)
                        if isFirstRowInCabin!{
                            
                        }
                    }
                        
                    }*/
                    //buttonPadding = 50
                    
                    button.tag = i
                    button.backgroundColor = UIColor.darkGray
                    button.setTitle("\(i)", for: .normal)
                    //button.addTarget(self, action: #selector(btnTouch), for: UIControlEvents.touchUpInside)

                    button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: 53, height: 30)
                    print(xOffset)
                    

                    xOffset = xOffset  + CGFloat(10) + button.frame.size.width
                    print(xOffset)
                    mScrollView.addSubview(button)
                    
                    
                    if UIScreen.main.bounds.width < xOffset{
                        buttonPadding += 50
                         xOffset = 10
                    }

                }
                buttonPadding += 50
                xOffset = 10
                
        }
        }


            mScrollView.contentSize = CGSize(width: xOffset, height: buttonPadding)
        }
    
    
    func drawSeatIcon(_ seatName: String?) {
        var seatName = seatName
        if seatName == "" {
            seatName = "Economy_Blank"
        }

        let img = UIImageView(image: UIImage(named: seatName ?? ""))
        //img.layer.shouldRasterize = SHOULDRASTERIZE

        imgSeat = UIButton()
        imgSeat.setImage(img.image, for: .normal)
        imgSeat.backgroundColor = UIColor.clear
        mScrollView.addSubview(imgSeat)
    }
    func setPlaneBgWidth(_ configurationIndex: Int, cabinIndex: Int, isFirstRowInCabin isFirstRowInCabin1: Bool) {
        //[UALSeatMapConfigCRM seatHeaderWidth] = 24
        //lngstSeatWidth = 36
        //config.seatSpaceX = 14
        //planeBgWidth = 50
        /*if configurationIndex == 0 {
            let lngstSeatWidth = (cabinLongestSeatWidthData[cabinIndex] as? NSNumber).doubleValue

            if isFirstRowInCabin1 {
                planeBgWidth += UALSeatMapConfigCRM.seatHeaderWidth() + lngstSeatWidth + config.seatSpaceX
            } else {
                planeBgWidth += lngstSeatWidth + config.seatSpaceX
            }
        }*/
    }
    func dynamicButtonCreation() {
            
            mScrollView.isScrollEnabled = true
            mScrollView.isUserInteractionEnabled = true
            
            let numberOfButtons = 20
            let numberofRows = 2
            
            var count = 0
            var px = 0
            var py = 0
            
            for _ in 1...numberofRows {
                px = 0
                
                if count < numberOfButtons/2 {
                    for j in 1...numberOfButtons/2 {
                        count += 1
                        
                        let Button = UIButton()
                        Button.tag = count
                        Button.frame = CGRect(x: px+10, y: py+10, width: 100, height: 45)
                        Button.backgroundColor = UIColor.black
                        Button.setTitle("Hello \(j) ", for: .normal)
                        print(j)
                        //Button.addTarget(self, action: #selector(scrollButtonAction), for: .touchUpInside)
                        mScrollView.addSubview(Button)
                        px = px + Int(mScrollView.frame.width)/2 - 30
                        print(px)
                      //  px = px + Int(mScrollView.frame.height)/2 - 30
                    }
                }else{
                    
                    for j in numberOfButtons/2+1...numberOfButtons {
                        count += 1
                        
                        let Button = UIButton()
                        Button.tag = count
                        Button.frame = CGRect(x: px+10, y: py+10, width: 100, height: 45)
                        Button.backgroundColor = UIColor.black
                        Button.setTitle("Hello \(j) ", for: .normal)
                        print(j)
                        //Button.addTarget(self, action: #selector(scrollButtonAction), for: .touchUpInside)
                        mScrollView.addSubview(Button)
                        px = px + Int(mScrollView.frame.width)/2 - 30
                       // px = px + Int(mScrollView.frame.height)/2 - 30
                    }
                    
                    
                }
                
                py =  Int(mScrollView.frame.height)-70
               // py =  Int(mScrollView.frame.width)-70
            }
            
           // mScrollView.contentSize = CGSize(width: px, height: py)
        mScrollView.contentSize = CGSize(width: py, height: px)
            
        }

    func LabelUI() {
        /*label.text = "Tap a button"
                
                // center the text in the label
                label.textAlignment = .center
                
                // so we can see the frames
                label.backgroundColor = .yellow
        mScrollView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
                
                // create a vertical stack view to hold the rows of buttons
                let verticalStackView = UIStackView()
                verticalStackView.axis = .vertical

                // we're going to use auto-layout
                label.translatesAutoresizingMaskIntoConstraints = false
        mScrollView.translatesAutoresizingMaskIntoConstraints = false
                verticalStackView.translatesAutoresizingMaskIntoConstraints = false

                // add label to view
                self.view.addSubview(label)
                
                // add Scrollview to view
                self.view.addSubview(mScrollView)
                
                // add stack view to scrollView
        mScrollView.addSubview(verticalStackView)

                // now let's create the buttons and add them
                var idx = 1
                
                for row in 0...100 {
                    // create a "row" stack view
                    let rowStack = UIStackView()
                    // add it to the vertical stack view
                    verticalStackView.addArrangedSubview(rowStack)
                    
                    for col in 0...6 {
                        let button = UIButton()
                        button.backgroundColor = .gray
                        button.setTitle("\(idx)", for: .normal)
                        //button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
                        
                        // add button to row stack view
                        rowStack.addArrangedSubview(button)
                        
                        // buttons should be 50x50
                        NSLayoutConstraint.activate([
                            button.widthAnchor.constraint(equalToConstant: 50.0),
                            button.heightAnchor.constraint(equalToConstant: 50.0),
                        ])
                        
                        idx += 1
                    }
                }

                // finally, let's set our constraints
                
                // respect safe-area
                let safeG = view.safeAreaLayoutGuide

                NSLayoutConstraint.activate([
                    
                    // constrain label
                    //  50-pts from top
                    //  80% of the width
                    //  centered horizontally
                    label.topAnchor.constraint(equalTo: safeG.topAnchor, constant: 50.0),
                    label.widthAnchor.constraint(equalTo: safeG.widthAnchor, multiplier: 0.8),
                    label.centerXAnchor.constraint(equalTo: safeG.centerXAnchor),
                    
                    // constrain scrollView
                    //  50-pts from bottom of label
                    //  Leading and Trailing to safe-area with 8-pts "padding"
                    //  Bottom to safe-area with 8-pts "padding"
                    mScrollView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50.0),
                    mScrollView.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 8.0),
                    mScrollView.trailingAnchor.constraint(equalTo: safeG.trailingAnchor, constant: -8.0),
                    mScrollView.bottomAnchor.constraint(equalTo: safeG.bottomAnchor, constant: -8.0),
                    
                    // constrain vertical stack view to scrollView Content Layout Guide
                    //  8-pts all around (so we have a little "padding")
                    verticalStackView.topAnchor.constraint(equalTo: mScrollView.contentLayoutGuide.topAnchor, constant: 8.0),
                    verticalStackView.leadingAnchor.constraint(equalTo: mScrollView.contentLayoutGuide.leadingAnchor, constant: 8.0),
                    verticalStackView.trailingAnchor.constraint(equalTo: mScrollView.contentLayoutGuide.trailingAnchor, constant: -8.0),
                    verticalStackView.bottomAnchor.constraint(equalTo: mScrollView.contentLayoutGuide.bottomAnchor, constant: -8.0),
                    
                ])*/
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }

}
