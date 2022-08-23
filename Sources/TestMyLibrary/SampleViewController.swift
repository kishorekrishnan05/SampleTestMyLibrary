//
//  ScrollViewController.swift
//  Projectseatmap1
//
//  Created by 2257848 on 26/07/22.
//

import UIKit
import Foundation


public protocol scrollviewDelegete: AnyObject {
    func deatilsSeats(seats :Seats)
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
    
    @IBOutlet weak var seatScrollView: UIScrollView!
    // let label = UILabel()
    public var modelSeat : ModelSeatMap?
    var headerValue = [ModelHeader]()
    var height:CGFloat = 0
    var button = UIButton()
    
    var ynewOffset:CGFloat = 8
    var xnewOffset:CGFloat = 16
    var imageView = UIImageView()
    @objc func setupSeatValue(sender : seatDetails) {
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
        seatScrollView.delegate = self
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
    
    func setupHeader(title: String,configuration: String,headerIndex:Int) {
        height = headerIndex == 0 ? height : height + 27
        let labelView = UILabel()
        labelView.textColor = UIColor.colorDarkblue
        labelView.font = UIFont(name: "OpenSans-SemiBold", size: 16)
        labelView.text = title
        labelView.frame = CGRect(x: 0, y: height, width: view.frame.width, height: 24)
        labelView.textAlignment = .center
        setupWingHeader(LeftWing: true)
        setupWingHeader(LeftWing: false)
        height += 30
        seatScrollView.addSubview(labelView)
    }
    func setupWingHeader(LeftWing : Bool){
        let imageView = UIImageView()
        imageView.frame = CGRect(x:LeftWing ? view.frame.width - 120 : 8, y: height + 5, width: 100, height: 24)
        imageView.contentMode = .scaleAspectFit
        imageView.image = LeftWing ? UIImage(named:"leftUE") : UIImage(named:"RightUE")
        imageView.backgroundColor = UIColor.clear
        seatScrollView.addSubview(imageView)
    }
    func setupConfiguration(configuration: String,seatSize: CGFloat,configurationHeader : String){
        var header = ModelHeader()
        header.height = height
        header.name = configurationHeader
        header.configuration = configuration
        header.seatSize = seatSize
        headerValue.append(header)
        for configurationIndex in 0..<configuration.count{
            let index = String.Index(encodedOffset: configurationIndex)
            button = UIButton()
            button.backgroundColor = UIColor.clear
            if configuration[index] != "-" {
                button.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 12)
                button.setTitleColor(UIColor.colorGray, for: .normal)
                button.setTitle("\(configuration[index])", for: .normal)
            }
            
            button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: seatSize, height: seatSize)
            xnewOffset = xnewOffset  + CGFloat(8) + seatSize
            seatScrollView.addSubview(button)
            //}
            if configurationIndex  == (configuration.count ) - 1{
                height = ynewOffset + seatSize + 8  + 10//yaxis padding
            }
        }
    }
    func setupISExit(seat: [Seats],index: Int,seatSize : CGFloat) {
        if seat[index].exit == true {
            button = UIButton()
            button.backgroundColor = .colorPinkRed
            button.frame = CGRect(x: 4, y: CGFloat(ynewOffset), width: 5, height: seatSize)
            seatScrollView.addSubview(button)
            if index  == (seat.count ) - 1{
                button = UIButton()
                button.backgroundColor = .colorPinkRed
                button.frame = CGRect(x: xnewOffset + seatSize + 10 , y: CGFloat(ynewOffset), width: 5, height: seatSize)
                seatScrollView.addSubview(button)
            }
        }
    }
    func setupSeatColor(seatValue : String) {
        button = UIButton()
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
        let imageView = UIImageView()
        if seat.seatvalue == "-"  {
            button = UIButton()
            button.backgroundColor = UIColor.clear
            button.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 12)
            button.setTitle(rowNumber, for: .normal)
            button.setTitleColor(.colorGray, for: .normal)
            button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: seatSize, height: seatSize)
            xnewOffset = xnewOffset  + CGFloat(8) + seatSize
            seatScrollView.addSubview(button)
        }else{
            setupSeatColor(seatValue: seat.seatvalue!)
            let seatValue = seatDetails(target: self, action: #selector(setupSeatValue(sender:)))
                button.addGestureRecognizer(seatValue)
            seatValue.data = seat
            button.imageView?.contentMode = .scaleAspectFit
            button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: seatSize, height: seatSize)
            xnewOffset = xnewOffset  + CGFloat(8) + seatSize
            seatScrollView.addSubview(button)
            seatScrollView.addSubview(setupImage(seatSize: seatSize, imageNameString: "Icons_24px_Travel_"))
            seatScrollView.addSubview(setupbadge(imageNameString: "action", backgroundColor: .colorPinkRed))
            
        }
    }
    func setupbadge(imageNameString: String, backgroundColor: UIColor) -> UIButton{
        let iconbutton = UIButton()
        iconbutton.setImage(UIImage(named: imageNameString), for: .normal)
        iconbutton.backgroundColor = backgroundColor//fontStyle?.colorBlue//UIColor.green
        iconbutton.imageView?.contentMode = .scaleAspectFill
        iconbutton.frame = CGRect(x: xnewOffset - 18, y: CGFloat(ynewOffset - 8), width: 16, height: 16)
        iconbutton.layer.cornerRadius = 0.5 * iconbutton.bounds.size.width
        iconbutton.clipsToBounds = true
        return iconbutton
    }
    func setupImage(seatSize : CGFloat,imageNameString : String) -> UIImageView{
        let imageView = UIImageView()
        let imageValue = CGFloat(seatSize * 0.6)
        imageView.frame = CGRect(x:button.center.x - (imageValue / 2) , y: button.center.y - (imageValue / 2), width: imageValue, height: imageValue)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named:imageNameString)
        imageView.backgroundColor = UIColor.clear
        return imageView
    }
    func setupSeat(seatSize: CGFloat,row :Rows,rowindex: Int,cabinindex:Int){
        for seatIndex in 0..<(row.seats?.count ?? -1){
            if let seats = row.seats {
                setupISExit(seat: seats, index: seatIndex, seatSize: seatSize)
            }
            if let seatsNumber = row.seats?[seatIndex] {
                setupSeatRowNumber(seat: seatsNumber, rowNumber: row.number ?? "", seatSize: seatSize,index : seatIndex, cabinindex: cabinindex )
            }
            if seatIndex  == (row.seats?.count ?? 0) - 1{
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
        
        seatScrollView.translatesAutoresizingMaskIntoConstraints = false
        if let cabinValue = self.modelSeat?.crmSeatMapResponse?.seatMap?.cabins {
            button = UIButton()
            
            //print(value.count)
            for cabinIndex in 0..<cabinValue.count {
                setupHeader(title: "\(cabinValue[cabinIndex].cos ?? "")", configuration: cabinValue[cabinIndex].configuration ?? "", headerIndex: cabinIndex)
                if let rowValue = cabinValue[cabinIndex].rows {
                setupRows(row: rowValue, cabinIndex: cabinIndex, configuration: cabinValue[cabinIndex].configuration ?? "", configutationHeader: "\(cabinValue[cabinIndex].cos ?? "")")
                }
                
                
            }
        }
        seatScrollView.contentSize = CGSize(width: 0, height: height)
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


