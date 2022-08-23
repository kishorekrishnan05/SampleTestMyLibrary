//
//  ScrollViewController.swift
//  Projectseatmap1
//
//  Created by 2257848 on 26/07/22.
//

import UIKit
import Foundation

enum SeatsColor: String, Codable {
    case occuipedSeats = "X"
    case OpenSeats = "O"
    case OpenEconomyPlusSeats = "S"
//    case VPES = "DEPA"

    var backgroundColor: UIColor {
        switch self {
        case .occuipedSeats:
            return .gray
        case .OpenSeats , .OpenEconomyPlusSeats:
            return .white
    }
    }
        var borderColor: UIColor {
            switch self {
            case .occuipedSeats ,.OpenSeats :
                return .gray
            case .OpenEconomyPlusSeats:
                return .blue
        }
    }
}
public class MyTapGesture: UITapGestureRecognizer {
    var data : Seats?
}
public protocol scrollviewDelegete: AnyObject {
    func deatilsSeats(seats :Seats)
}
public struct  ModelHeader{
    var height: CGFloat?
    var name: String?
    var configuration : String?
    var seatSize : CGFloat?
}


public class SampleViewController: UIViewController, UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView){
        setupScrollHeader(scrollYPosition: scrollView.contentOffset.y)
    }
    func setupScrollHeader(scrollYPosition: CGFloat)
    {
        let leadingValue: CGFloat = 24
        viewHeader.isHidden =  scrollYPosition > 0 ? false : true
        viewHeader.subviews.forEach { temp in
            temp.removeFromSuperview()
        }
        viewHeader.layoutSubviews()
        for (itemIndex,itemValue) in headerValue.enumerated() {
            if itemIndex != headerValue.count - 1 {
                if scrollYPosition + 30 < headerValue[itemIndex + 1].height!  {
                    setupScrollHeaderValue(Index: itemIndex, value: itemValue, xAxis: leadingValue)
                    break
                }
            }else{
                setupScrollHeaderValue(Index: itemIndex, value: itemValue, xAxis: leadingValue)
            }
        }
        
    }
    func setupScrollHeaderValue(Index : Int, value:ModelHeader ,xAxis: CGFloat){
            // self.viewTest.isHidden = false
            // button.removeFromSuperview()
        label.textColor = UIColor.colorDarkblue
        label.font = UIFont(name: "OpenSans-SemiBold", size: 16)
        var leadingValue = xAxis
            label.text = value.name
            label.frame = CGRect(x: 0, y: 4, width: viewHeader.frame.width, height: 24)
            label.textAlignment = .center
        viewHeader.addSubview(label)
            for configurationValue in 0..<(value.configuration?.count ?? -1){
                //button.setTitle(" ", for: .normal)
                let index1 = String.Index(encodedOffset: configurationValue)
                button = UIButton()
                button.backgroundColor = UIColor.clear
                if value.configuration![index1] != "-" {
                    button.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 12)
                    button.setTitle("\(value.configuration![index1])", for: .normal)
                    button.setTitleColor(UIColor.colorGray, for: .normal)
                }
                
                button.frame = CGRect(x: leadingValue, y: CGFloat(36), width: value.seatSize ?? 0, height: 16)
                
                leadingValue = leadingValue  + CGFloat(8) + (value.seatSize ?? 0)
                viewHeader.addSubview(button)
            }
    }
    
    
    //SE 13 13 pro max  ipad  8 plus
   public var delegate : scrollviewDelegete?
    var viewHeader = UIView()
    var label: UILabel = UILabel()
    
    @IBOutlet weak var mScrollView: UIScrollView!
    // let label = UILabel()
    public var modelSeat : ModelSeatMap?
    var headerValue = [ModelHeader]()
    var height:CGFloat = 16
    var button = UIButton()
    @IBOutlet weak var labelHeader: UILabel!
    
    var ynewOffset:CGFloat = 8
    var xnewOffset:CGFloat = 16
    var imageView = UIImageView()
    @objc func tapped(sender : MyTapGesture) {
            print(sender.data)
        if let seats = sender.data {
            delegate?.deatilsSeats(seats: seats)
        }
           // label1.text = sender.title
        }
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollheaderView()
        for family in UIFont.familyNames {
            print("family:", family)
            for font in UIFont.fontNames(forFamilyName: family) {
                print("font:", font)
            }
        }
        //testJson()
        // UALSeatVMCRM.buildDataObjects((self.test?.crmSeatMapResponse?.seatMap)!)
        // seatsVMData = UALSeatVMCRM.getSeatsData()
        //LabelUI()
        //newFuncRowWise()
        //newFuncEqualSpacing()
        setupSeat()
        //newFuncWorkingFine()
        mScrollView.delegate = self
        //newFuncwith4Padding()
        //newFuncclounmWise()
        // Do any additional setup after loading the view.
        
    }
    func setupScrollheaderView(){
        viewHeader.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 65)
        viewHeader.backgroundColor = .colorGhostWhite
        viewHeader.layer.masksToBounds = false
        viewHeader.layer.shadowOffset = CGSize(width: -1, height: 1)
        viewHeader.layer.shadowRadius = 1
        viewHeader.layer.shadowOpacity = 0.5
        self.view.addSubview(viewHeader)
        self.view.bringSubviewToFront(viewHeader)
        self.viewHeader.isHidden = true
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
    @objc func pressed() {
        print("Kishore")
    }
    @objc func pressedd(sender: UIButton) {
        print("\(sender.tag)")
        print("Kishore")
        /*if let value = self.test?.crmSeatMapResponse?.seatMap?.cabins {
            print(value[0].rows?[0].seats?[sender.tag])
        }*/
        //delegate?.lastIndex(flightInfo: "Kishore", selecetdIndexDate: "Kishore")
    }
    
    func setupHeader(title: String,configuration: String) {
        label = UILabel()
        label.textColor = UIColor.colorDarkblue
        label.font = UIFont(name: "OpenSans-SemiBold", size: 16)
            label.text = title
        label.frame = CGRect(x: 0, y: CGFloat(height) + 4 , width: view.frame.width, height: 24)
            label.textAlignment = .center
       /* button.frame = CGRect(x: 100, y: CGFloat(height), width: 200, height: 40)
        //mScrollView.addSubview(button)
        button.titleLabel?.font = UIFont(name: "OpenSans-SemiBold", size: 16)//UIFont.boldSystemFont(ofSize: 16)//fontStyle?.mediumFont
        button.setTitle(tilte, for: .normal)
        button.setTitleColor(UIColor.colorDarkblue, for: .normal)//fontStyle?.colorBlue*/
        setupWingHeader(LeftWing: true)
        setupWingHeader(LeftWing: false)
        height += 36
        mScrollView.addSubview(label)
       // mScrollView.addSubview(imageView)
    }
    func setupWingHeader(LeftWing : Bool){
        var imageView = UIImageView()
        imageView.frame = CGRect(x:LeftWing ? view.frame.width - 120 : 8, y: height + 5, width: 100, height: 40)
        imageView.contentMode = .scaleAspectFit
        imageView.image = LeftWing ? UIImage(named:"leftUE") : UIImage(named:"RightUE")
        imageView.backgroundColor = UIColor.clear
        mScrollView.addSubview(imageView)
    }
    func setupConfiguration(configuration: String,seatSize: CGFloat,configurationHeader : String){
        var header = ModelHeader()
        header.height = height
        header.name = configurationHeader
        header.configuration = configuration
        header.seatSize = seatSize
        headerValue.append(header)
        for abcd in 0..<configuration.count{
            let index = String.Index(encodedOffset: abcd)
            button = UIButton()
            button.backgroundColor = UIColor.clear
            if configuration[index] != "-" {
                button.setTitle("\(configuration[index])", for: .normal)
                button.titleLabel?.font = UIFont(name: "OpenSans-ExtraBold", size: 16)
                button.setTitleColor(UIColor.colorPinkRed, for: .normal)
            }
            
            button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: seatSize, height: seatSize)
            xnewOffset = xnewOffset  + CGFloat(8) + seatSize
            mScrollView.addSubview(button)
            //}
            if abcd  == (configuration.count ) - 1{
                height = ynewOffset + seatSize + 8 + 10 //yaxis padding
            }
        }
    }
    func setupISExit(seat: [Seats],index: Int,seatSize : CGFloat) {
        if seat[index].exit == true {
            button = UIButton()
            button.backgroundColor = UIColor.red
            button.frame = CGRect(x: 4, y: CGFloat(ynewOffset), width: 5, height: seatSize)
            mScrollView.addSubview(button)
            if index  == (seat.count ) - 1{
                button = UIButton()
                button.backgroundColor = UIColor.red
                button.frame = CGRect(x: xnewOffset + seatSize + 10 , y: CGFloat(ynewOffset), width: 5, height: seatSize)
                mScrollView.addSubview(button)
            }
        }
    }
    func setupSeatColor(seatValue : String) {
        button = UIButton()
       // button.tag = 0
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        if ((seatValue == "X")){
            //Occuiped
            button.backgroundColor = SeatsColor.occuipedSeats.backgroundColor
            button.layer.borderColor = SeatsColor.occuipedSeats.borderColor.cgColor
        } else if ((seatValue == "O")) {
            //Open Seats
            button.backgroundColor = SeatsColor.OpenSeats.backgroundColor
            button.layer.borderColor = SeatsColor.OpenSeats.borderColor.cgColor
        } else if ((seatValue == "S")) {
            //Open Economy Plus Seats
            button.backgroundColor = SeatsColor.OpenEconomyPlusSeats.backgroundColor
            button.layer.borderColor = SeatsColor.OpenEconomyPlusSeats.borderColor.cgColor
        }
    }
    
    func setupSeatRowNumber(seat: Seats, rowNumber: String,seatSize: CGFloat,index: Int,cabinindex: Int) {
        //Button Tag Kishore
        var imageView = UIImageView()
        //0 0 6
        button.tag = index
        if seat.seatvalue == "-"  {
            button = UIButton()
            button.backgroundColor = UIColor.clear
            button.titleLabel?.font = UIFont(name: "OpenSans-ExtraBold", size: 16)//UIFont.boldSystemFont(ofSize: 16)//fontGiven//fontStyle?.mediumFont
            button.setTitle(rowNumber, for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: seatSize, height: seatSize)
            xnewOffset = xnewOffset  + CGFloat(8) + seatSize
            mScrollView.addSubview(button)
        }else{
            let imageSize:CGSize = CGSize(width: 20, height: 20)
            setupSeatColor(seatValue: seat.seatvalue!)
            let tappy = MyTapGesture(target: self, action: #selector(tapped(sender:)))
                    button.addGestureRecognizer(tappy)
                    tappy.data = seat
            //button.addTarget(self, action: #selector(pressedd), for: .touchUpInside)
            button.imageView?.contentMode = .scaleAspectFit
            button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: seatSize, height: seatSize)
            xnewOffset = xnewOffset  + CGFloat(8) + seatSize
            var iconbutton = UIButton()
            iconbutton.setImage(UIImage(named: "action"), for: .normal)
            iconbutton.backgroundColor = UIColor.colorPinkRed//fontStyle?.colorBlue//UIColor.green
            iconbutton.imageView?.contentMode = .scaleAspectFill
            iconbutton.frame = CGRect(x: xnewOffset - 18, y: CGFloat(ynewOffset - 8), width: 16, height: 16)
            iconbutton.layer.cornerRadius = 0.5 * iconbutton.bounds.size.width
            iconbutton.clipsToBounds = true
            var testvalue = CGFloat(seatSize * 0.6)
            imageView.frame = CGRect(x:button.center.x - (testvalue / 2) , y: button.center.y - (testvalue / 2), width: testvalue, height: testvalue)
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named:"Icons_24px_Travel_")
            imageView.backgroundColor = UIColor.clear
            
            mScrollView.addSubview(button)
            mScrollView.addSubview(imageView)
            mScrollView.addSubview(iconbutton)
        }
    }
    func setupSeat(seatSize: CGFloat,row :Rows,rowindex: Int,cabinindex:Int){
        for seattry in 0..<(row.seats?.count ?? -1){
            if let seats = row.seats {
                setupISExit(seat: seats, index: seattry, seatSize: seatSize)
            }
            if let seatsNumber = row.seats?[seattry] {
                setupSeatRowNumber(seat: seatsNumber, rowNumber: row.number ?? "", seatSize: seatSize,index : seattry, cabinindex: cabinindex )
            }
            if seattry  == (row.seats?.count ?? 0) - 1{
                height = ynewOffset + seatSize + 8//yaxis padding
            }
        }
    }
    func setupRows(row : [Rows],cabinIndex: Int,configuration:String,configutationHeader : String)
    {
        let rowCount = (row.count) + 1
        var headerBool = 0
        for rowIndex in 0..<rowCount{
            if cabinIndex == 0 && headerBool == 0{
                ynewOffset = height
                xnewOffset = 16
            } else {
                xnewOffset = 16
                ynewOffset = height
            }
            
            let seatSize  = setupSeatSize(index: row[0].seats?.count ?? 0) - CGFloat(8)
            if headerBool == 0 {
                headerBool += 1
                setupConfiguration(configuration: configuration, seatSize: seatSize, configurationHeader: configutationHeader)
            }
            else {
                headerBool += 1
                setupSeat(seatSize: seatSize, row: row[rowIndex - 1], rowindex: rowIndex, cabinindex: cabinIndex)
                
            }
        }
    }
    func setupSeat(){
        
        mScrollView.translatesAutoresizingMaskIntoConstraints = false
        if let cabinValue = self.modelSeat?.crmSeatMapResponse?.seatMap?.cabins {
            button = UIButton()
            
            //print(value.count)
            for cabinIndex in 0..<cabinValue.count {
                setupHeader(title: "\(cabinValue[cabinIndex].cos ?? "")", configuration: cabinValue[cabinIndex].configuration ?? "")
                if let rowValue = cabinValue[cabinIndex].rows {
                setupRows(row: rowValue, cabinIndex: cabinIndex, configuration: cabinValue[cabinIndex].configuration ?? "", configutationHeader: "\(cabinValue[cabinIndex].cos ?? "")")
                }
                
                
            }
        }
        mScrollView.contentSize = CGSize(width: 0, height: height)
    }
    func setupSeatSize(index: Int) -> CGFloat{
        return (view.frame.width - 40) / CGFloat(index)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

    
}

import UIKit

extension UIColor {

    func aspectRatioImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        let ctx = UIGraphicsGetCurrentContext()
        self.setFill()
        ctx!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }

    open class var colorDarkblue: UIColor {
        return "#0c2340".hexStringToUIColor()
    }
    open class var colorGray: UIColor {
        return "#666666".hexStringToUIColor()
    }
    
    open class var colorGhostWhite: UIColor {
        return "#f9f9f9".hexStringToUIColor()
    }

    open class var colorPinkRed: UIColor {
        return "#D50032".hexStringToUIColor()
    }

    open class var textFieldBorderColor: UIColor {
        return "#333333".hexStringToUIColor()
    }

    open class var buttonEnabledColor: UIColor {
        return "#6244BB".hexStringToUIColor()
    }

    open class var buttonDisabledColor: UIColor {
        return "#E6E6E6".hexStringToUIColor()
    }

    

    open class var shadowBottomColor: UIColor {
        return self.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
    }

    open class var shadowColor: UIColor {
        return self.init(red: 0.05, green: 0.2, blue: 0.13, alpha: 0.4)
    }
}

extension String {
    func hexStringToUIColor() -> UIColor {
        var cString: String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if (cString.count) != 6 {
            return UIColor.gray
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
