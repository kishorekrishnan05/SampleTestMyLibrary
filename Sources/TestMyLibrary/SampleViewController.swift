//
//  ScrollViewController.swift
//  Projectseatmap1
//
//  Created by 2257848 on 26/07/22.
//

import UIKit
import Foundation

public struct  ModelHeader{
    var height: CGFloat?
    var name: String?
    var configuration : String?
    var seatSize : CGFloat?
    var xyPositon : [ModelxyPosition]?
}

public struct  ModelxyPosition {
    var configuationChar : String?
    var xValue : CGFloat?
    var yValue : CGFloat?
}

public protocol seatDetailsDelegete: AnyObject {
    func deatilsSeats(seats :Seats)
}



public class SampleViewController: UIViewController{
    
    public var delegate : seatDetailsDelegete?
    
    public var seatScrollView = UIScrollView()
    
    
   // @IBOutlet weak var seatScrollView: UIScrollView!
    
    var booltest = false
    var viewContent = UIView()
    
    public var modelSeat : ModelSeatMap?
    var headerValue = [ModelHeader]()
    var viewHeader = UIView()
    var label = UILabel()
    var imageView = UIImageView()
    var button = UIButton()
    var height:CGFloat = 0
    public var quickViewType : QuickViewOptionSelected = .none
    
    var yOffset:CGFloat = 8
    var xOffset:CGFloat = 16
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.seatScrollView.panGestureRecognizer.delaysTouchesBegan = self.seatScrollView.delaysContentTouches;

        //seatScrollView.canCancelContentTouches = true
        //seatScrollView.delaysContentTouches = true;
        seatScrollView.maximumZoomScale = 2
        seatScrollView.minimumZoomScale = 1
        setupScrollheaderView()
        for family in UIFont.familyNames {
            print("family:", family)
            for font in UIFont.fontNames(forFamilyName: family) {
                print("font:", font)
            }
        }
        
        setupSeat()
        seatScrollView.delegate = self
        
    }
    
    
    
    func setupSeat(){
        
        seatScrollView.translatesAutoresizingMaskIntoConstraints = false
        if let cabinValue = self.modelSeat?.crmSeatMapResponse?.seatMap?.cabins {
            for cabinIndex in 0..<cabinValue.count {
                setupHeader(title: "\(cabinValue[cabinIndex].cos ?? "")", configuration: cabinValue[cabinIndex].configuration ?? "", headerIndex: cabinIndex)
                if let rowValue = cabinValue[cabinIndex].rows {
                    setupRows(row: rowValue, cabinIndex: cabinIndex, configuration: cabinValue[cabinIndex].configuration ?? "", configutationHeader: "\(cabinValue[cabinIndex].cos ?? "")")
                }
                
                
            }
        }
        
        viewContent.frame = CGRect(x: 0, y: 0, width: seatScrollView.frame.width, height: height)
        viewContent.layer.masksToBounds = false
        self.seatScrollView.addSubview(viewContent)
        self.seatScrollView.bringSubviewToFront(viewContent)
        seatScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        seatScrollView.contentSize = CGSize(width: 1, height: height)
        self.view.addSubview(seatScrollView)
        self.view.bringSubviewToFront(seatScrollView)
       // seatScrollView.contentSize = CGSize(width: 0, height: height)
        seatScrollView.contentSize = CGSize(width: 1, height: height)
        
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
        height += 24
        viewContent.addSubview(labelView)
    }
    func setupRows(row : [Rows],cabinIndex: Int,configuration:String,configutationHeader : String)
    {
        let rowCount = (row.count) + 1
        var headerBool = 0
        for rowIndex in 0..<rowCount{
            //if cabinIndex == 0 && headerBool == 0{
                yOffset = height
                xOffset = 16
           /* } else {
                xOffset = 16
                yOffset = height
            }*/
            
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
    
    func setupConfiguration(configuration: String,seatSize: CGFloat,configurationHeader : String){
        var header = ModelHeader()
        var leadingValue : CGFloat = 16
        header.height = height
        header.name = configurationHeader
        header.configuration = configuration
        header.seatSize = seatSize
        var xyposition = ModelxyPosition()
        var testData = [ModelxyPosition]()
      //  if let congfiguration3 = configuration  ?? "" {
            for (configurationIndex,configurationValue) in configuration.enumerated() {
                xyposition.configuationChar = "\(configurationValue)"
                xyposition.xValue = leadingValue
                xyposition.yValue = height
               /* header.xyPositon?[configurationIndex].xValue = leadingValue
                header.xyPositon?[configurationIndex].yValue = leadingValue
                header.xyPositon?[configurationIndex].configuationChar = "\(configurationValue)"*/
               /* button = UIButton()
                button.backgroundColor = UIColor.clear
                    if configurationValue != "-" {
                        button.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 12)
                        button.setTitle("\(configurationValue)", for: .normal)
                        button.setTitleColor(UIColor.colorGray, for: .normal)
                    }
                
                button.frame = CGRect(x: leadingValue, y: CGFloat(36), width: seatSize ?? 0, height: 16)*/
                
                leadingValue = leadingValue  + CGFloat(8) + (seatSize )
                testData.append(xyposition)//append(xyposition)//append(xyposition)
            }
        header.xyPositon = testData
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
            
            button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: seatSize, height: seatSize)
            xOffset = xOffset  + CGFloat(8) + seatSize
            viewContent.addSubview(button)
            if configurationIndex  == (configuration.count ) - 1{
                height = yOffset + seatSize + 8  //+ 10//yaxis padding
            }
        }
    }
    func setupWingHeader(LeftWing : Bool){
        let imageView = UIImageView()
        imageView.frame = CGRect(x:LeftWing ? view.frame.width - 120 : 8, y: height + 5, width: 100, height: 24)
        imageView.contentMode = .scaleAspectFit
        imageView.image = LeftWing ? UIImage(named:"leftUE") : UIImage(named:"RightUE")
        imageView.backgroundColor = UIColor.clear
        viewContent.addSubview(imageView)
    }
    func setupSeat(seatSize: CGFloat,row :Rows,rowindex: Int,cabinindex:Int){
        for seatIndex in 0..<(row.seats?.count ?? -1){
            if let seats = row.seats {
                setupISExit(seat: seats, index: seatIndex, seatSize: seatSize)
            }
            if let seatsNumber = row.seats?[seatIndex] {
                setupSeatRowNumber(seat: seatsNumber, rowNumber: row.number ?? "", seatSize: seatSize,index : seatIndex, cabinindex: cabinindex, seatCount: (row.seats?.count ?? -1) )
            }
            if seatIndex  == (row.seats?.count ?? 0) - 1{
                height = yOffset + seatSize + 8//yaxis padding
            }
        }
    }
    
    func setupISExit(seat: [Seats],index: Int,seatSize : CGFloat) {
        if seat[index].exit == true {
            button = UIButton()
            button.backgroundColor = .colorPinkRed
            button.frame = CGRect(x: 4, y: CGFloat(yOffset), width: 5, height: seatSize)
            viewContent.addSubview(button)
            if index  == (seat.count ) - 1{
                button = UIButton()
                button.backgroundColor = .colorPinkRed
                button.frame = CGRect(x: xOffset + seatSize + 10 , y: CGFloat(yOffset), width: 5, height: seatSize)
                viewContent.addSubview(button)
            }
        }
    }
    func setupSeatRowNumber(seat: Seats, rowNumber: String,seatSize: CGFloat,index: Int,cabinindex: Int,seatCount : Int) {
        if seat.seatvalue == "-"  {
            button = UIButton()
            button.backgroundColor = UIColor.clear
            button.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 12)
            if seat.number == ""{
                button.setTitle(rowNumber, for: .normal)
                button.setTitleColor(.colorGray, for: .normal)
            }
            button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: seatSize, height: seatSize)
            xOffset = xOffset  + CGFloat(8) + seatSize
            viewContent.addSubview(button)
        }else{
            setupSeatColor(seatValue: seat.seatvalue ?? "")
            let seatValue = seatDetails(target: self, action: #selector(setupSeatValue(sender:)))
            button.addGestureRecognizer(seatValue)
            seatValue.data = seat
            button.imageView?.contentMode = .scaleAspectFit
            button.frame = CGRect(x: xOffset, y: CGFloat(yOffset), width: seatSize, height: seatSize)
            xOffset = xOffset  + CGFloat(8) + seatSize
            viewContent.addSubview(button)
            switch quickViewType {
            case .sSRs:
                for item in seat.crmInfo?.crmProfile?.ssrs ?? [] {
                    if let ssrType : SSRsType = SSRsType(rawValue: item.code ?? "") {
                        viewContent.addSubview(setupImage(seatSize: seatSize, imageNameString: ssrType.SSRs()))
                    }
                }
            case .Status:
                if seat.crmInfo?.accountSummary?.mileagePlusNumber?.count ?? 0 > 0 {
                    if seat.crmInfo?.accountSummary?.eliteStatus?.starEliteDescription ?? "" == "Gold" || seat.crmInfo?.accountSummary?.eliteStatus?.starEliteDescription ?? "" == "Silver" {
                        if let starAlliance : StatusType =  StatusType(rawValue: seat.crmInfo?.accountSummary?.eliteStatus?.starEliteDescription ?? "") {
                            viewContent.addSubview(setupStatusImage(seatSize: seatSize, imageNameString: starAlliance.Status()))
                        }
                    }else {
                        if let statusType : StatusType = StatusType(rawValue: seat.crmInfo?.accountSummary?.eliteStatus?.description ?? "") {                        viewContent.addSubview(setupStatusImage(seatSize: seatSize, imageNameString: statusType.Status()))
                        }
                    }
                    
                }else{
                    if let statusType : StatusType = StatusType(rawValue:"GM") {
                        viewContent.addSubview(setupStatusImage(seatSize: seatSize, imageNameString: statusType.Status()))
                    }
                }
                break
            case .meals:
               // if seatCount < 8 {
                    if seat.crmInfo?.crmProfile?.specialMeals?.count ?? 0 > 0 && seat.crmInfo?.crmProfile?.preOrderMeals?.count  ?? 0 > 0 {
                        viewContent.addSubview(setupImage(seatSize: seatSize, imageNameString: MealsType(rawValue: "SPML/PREO")?.meals() ?? "" ))
                    }else if seat.crmInfo?.crmProfile?.specialMeals?.count ?? 0 > 0 {
                        viewContent.addSubview(setupImage(seatSize: seatSize, imageNameString: MealsType(rawValue: "SPML")?.meals() ?? "" ))
                    }
                    else if seat.crmInfo?.crmProfile?.preOrderMeals?.count ?? 0 > 0 {
                        viewContent.addSubview(setupImage(seatSize: seatSize, imageNameString: MealsType(rawValue: "PREO")?.meals() ?? "" ))
                    }
                /*}else {
                    if seat.crmInfo?.crmProfile?.specialMeals?.count ?? 0 > 0 || seat.crmInfo?.crmProfile?.preOrderMeals?.count  ?? 0 > 0 {
                        viewContent.addSubview(setupImage(seatSize: seatSize, imageNameString: MealsType(rawValue: "common")?.meals() ?? "" ))
                    }
                }*/
            case.connections:
                if seat.crmInfo?.crmProfile?.connection != ""{
                    if let connectionsType : ConnectionsType = ConnectionsType(rawValue:  seat.crmInfo?.crmProfile?.connection ?? "") {
                        viewContent.addSubview(setupImage(seatSize: seatSize, imageNameString: connectionsType.connections()))
                    }
                }
                break
            case .recognition:
                if seat.crmInfo?.crmProfile?.birthdayIndicator ?? false {
                    viewContent.addSubview(setupImage(seatSize: seatSize, imageNameString: RecognitionType(rawValue: "birthdayRecognition")?.recognition() ?? "" ))
                    
                } else if seat.crmInfo?.crmProfile?.legMillionMilerIndicator ?? false {
                    viewContent.addSubview(setupImage(seatSize: seatSize, imageNameString: RecognitionType(rawValue: "MillerMilestoneRecognition")?.recognition() ?? "" ))                }
            case .none:
                break
            }
        // seatScrollView.addSubview(setupImage(seatSize: seatSize, imageNameString: "Icons_24px_Travel_"))
            //Recognition Function need to confirm the key
            if seat.crmInfo?.crmProfile?.actionIndicator ?? false{
                viewContent.addSubview(setupbadge(imageNameString: "action", backgroundColor: .colorPinkRed))
            }
            
        }
    }
    
    func setupSeatColor(seatValue : String) {
        button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        if (seatValue == "X"){
            //Occuiped
            button.backgroundColor = SeatsColor.occuipedSeats.backgroundColor
            button.layer.borderColor = SeatsColor.occuipedSeats.borderColor.cgColor
        } else if (seatValue == "O") {
            //Open Seats
            button.backgroundColor = SeatsColor.openSeats.backgroundColor
            button.layer.borderColor = SeatsColor.openSeats.borderColor.cgColor
        } else if (seatValue == "S") {
            //Open premium Plus Seats
            button.backgroundColor = SeatsColor.openPremiumPlus.backgroundColor
            button.layer.borderColor = SeatsColor.openPremiumPlus.borderColor.cgColor
        } else if (seatValue == "P") {
            //Open Economy Plus Seats
            button.backgroundColor = SeatsColor.openEconomyPlusSeats.backgroundColor
            button.layer.borderColor = SeatsColor.openEconomyPlusSeats.borderColor.cgColor
        }else{
            button.backgroundColor = .clear
            button.layer.borderColor = .none
        }
    }
    
    //ignore Recognition Function
    func setupbadge(imageNameString: String, backgroundColor: UIColor) -> UIButton{
        let iconbutton = UIButton()
        iconbutton.setImage(UIImage(named: imageNameString), for: .normal)
        iconbutton.backgroundColor = backgroundColor//fontStyle?.colorBlue//UIColor.green
        iconbutton.imageView?.contentMode = .scaleAspectFill
        iconbutton.frame = CGRect(x: xOffset - 18, y: CGFloat(yOffset - 8), width: 16, height: 16)
        iconbutton.layer.cornerRadius = 0.5 * iconbutton.bounds.size.width
        iconbutton.clipsToBounds = true
        return iconbutton
    }
    //ignorne image Like SSR ,SpmL/Preo We will the create enum.code will be update
    func setupImage(seatSize : CGFloat,imageNameString : String) -> UIImageView{
        let imageView = UIImageView()
        let imageValue = CGFloat(seatSize * 0.7)
        imageView.tintColor = .white
        imageView.frame = CGRect(x:button.center.x - (imageValue / 2) , y: button.center.y - (imageValue / 2), width: imageValue, height: imageValue)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named:imageNameString)
        imageView.backgroundColor = UIColor.clear
        return imageView
    }
    func setupStatusImage(seatSize : CGFloat,imageNameString : String) -> UIImageView{
        let imageView = UIImageView()
        let imageValue = CGFloat(seatSize * 0.7)
        imageView.tintColor = .white
        imageView.frame = CGRect(x:button.center.x - (imageValue / 2) , y: yOffset, width: imageValue, height: imageValue)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named:imageNameString)
        imageView.backgroundColor = UIColor.clear
        return imageView
    }
    
    @objc func setupSeatValue(sender : seatDetails) {
        if let seats = sender.data {
            delegate?.deatilsSeats(seats: seats)
        }
    }
    
    func setupSeatSize(index: Int) -> CGFloat{
        return (view.frame.width - 40) / CGFloat(index)
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
extension SampleViewController : UIScrollViewDelegate{
    
    
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView){
        /*if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0)
           {
               print("up")
           }
          else
          {
               print("down")
          }
          if scrollView.panGestureRecognizer.translation(in: scrollView.superview).x > 0 {
             print("left")
          } else {
             print("right")
          }*/
         /* let originVisible = seatScrollView.contentOffset
          let convertedPoint = seatScrollView.convert(originVisible, to: viewContent).scaledBy(scale: seatScrollView.zoomScale)
          let imageViewPoint = CGPoint(x: convertedPoint.x + seatScrollView.center.x,
                                       y: convertedPoint.y + seatScrollView.center.y)*/
         // print(imageViewPoint)
        //print("\(seatScrollView.contentOffset.x) seatScrollView.contentOffset.x ")
       // print(seatScrollView.contentOffset.x )//  * scrollView.zoomScale )
        //print("\(headerValue.first?.xyPositon?.first?.configuationChar) -  \((headerValue.first?.xyPositon?.first?.xValue)! * scrollView.zoomScale) test")
       // print(("\(headerValue.first?.xyPositon?[2].configuationChar) -  \((((headerValue.first?.xyPositon?[2].xValue)! + (headerValue.first?.seatSize)!))) test"))
        //print("\(headerValue.first?.xyPositon?[2].configuationChar) -  \(((((headerValue.first?.xyPositon?[2].xValue)! * scrollView.zoomScale) + (headerValue.first?.seatSize)!)  )) test")
        //print("\(headerValue.first?.xyPositon?[3].configuationChar) -  \((((headerValue.first?.xyPositon?[3].xValue)! * scrollView.zoomScale)   )) test")
        /*viewHeader.isHidden =   false
        viewHeader.subviews.forEach { temp in
            temp.removeFromSuperview()
        }
        viewHeader.layoutSubviews()
        label.textColor = UIColor.colorDarkblue
        label.font = UIFont(name: "OpenSans-SemiBold", size: 16)
        var leadingValue : CGFloat = 0
        label.text = "United Polaris business"
        label.frame = CGRect(x: 0, y: 0, width: viewHeader.frame.width, height: 24)
        label.textAlignment = .center
        viewHeader.addSubview(label)
        for configurationValue in 0..<(headerValue.first?.configuration?.count ?? -1){
            let index = String.Index(encodedOffset: configurationValue)
            button = UIButton()
            button.backgroundColor = UIColor.clear
            for item in (headerValue.first?.xyPositon ?? []) {
               // if Int(seatScrollView.contentOffset.x) == Int(((item.xValue)! * scrollView.zoomScale)   ) {
                if item.configuationChar != "-" {
                    print(item.configuationChar)

                    button.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 12)
                    button.setTitle(item.configuationChar, for: .normal)
                    button.setTitleColor(UIColor.red, for: .normal)
                }
                //((headerValue.first?.xyPositon?[3].xValue)! * scrollView.zoomScale)
                let testheight : CGFloat = item.xValue! * scrollView.zoomScale
                print(testheight)
                button.frame = CGRect(x: testheight, y: CGFloat(36), width: headerValue.first?.seatSize ?? 0, height: 16)
                
                print(button.frame.size.width)
                //leadingValue = leadingValue  + CGFloat(8) + (headerValue.first?.seatSize ?? 0)
                viewHeader.addSubview(button)
                viewHeader.bringSubviewToFront(button)
                view.addSubview(viewHeader)
                
                  //  button.frame = CGRect(x: CGFloat((item.xValue)!), y: CGFloat(36), width: (headerValue.first?.seatSize ?? 0) * scrollView.zoomScale, height: 16)
                    //viewHeader.addSubview(button)
                    /*let index = String.Index(encodedOffset: configurationValue)
                    
                    if let congifuration = (headerValue.first?.xyPositon?[configurationValue].configuationChar){
                        if congifuration != "-" {
                            button.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 12)
                            button.setTitle("\((headerValue.first?.xyPositon?[configurationValue].configuationChar)!)", for: .normal)
                            button.setTitleColor(UIColor.red, for: .normal)
                        }
                    }
                    
                    button.frame = CGRect(x: CGFloat((headerValue.first?.xyPositon?[configurationValue].xValue)!), y: CGFloat(36), width: (headerValue.first?.seatSize ?? 0) * scrollView.zoomScale, height: 16)
                    
                    leadingValue = ((headerValue.first?.xyPositon?[configurationValue].xValue)!)  + 8 + (headerValue.first?.seatSize ?? 0) * scrollView.zoomScale
                    viewHeader.addSubview(button)*/

                                        
                //}
            }
            
            

        }*/
        
       // print("\((headerValue.first?.xValue)! * seatScrollView.zoomScale) headerValue.first?.xValue ")
       // print("\(headerValue.first?.yValue) headerValue.first?.yValue")
        
        if booltest == true {
        setupScrollHeaderZoom(scrollYPosition: scrollView.contentOffset.y)
        }else {
            setupScrollHeader(scrollYPosition: scrollView.contentOffset.y)
        }
    }
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        //viewContent.backgroundColor = .systemPink
        //testView.backgroundColor = .red
            return viewContent
       // return testView//seatScrollView.superview
        return nil
    }
    
    
    public func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        booltest = true
        //viewHeader.isHidden = true
        /*seatScrollView.subviews.forEach { temp in
            temp.removeFromSuperview()
        }
        seatScrollView.layoutSubviews()
        setupSeat()
        seatScrollView.addSubview(contentViewTest)*/
        //setupSeat1()
      /*  testView.isHidden = false
        viewContent.isHidden = true
        
        setupSeat1()
        testView.isHidden = false
        testView.frame = CGRect(x: 0, y: 0, width: 0, height: height)
        testView.backgroundColor = .green
        testView.layer.masksToBounds = false
        self.seatScrollView.addSubview(testView)
        self.seatScrollView.bringSubviewToFront(testView)*/
        print("scrollViewWillBeginZooming")
    }
    public func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("scrollViewDidEndZooming")
        /*seatScrollView.subviews.forEach { temp in
            temp.removeFromSuperview()
        }
        seatScrollView.layoutSubviews()
       setupSeat()*/
        /*testView.isHidden = true
        viewContent.isHidden = false
      //  seatScrollView.layoutIfNeeded()
        seatScrollView.contentSize = CGSize(width: 0, height: height)
        viewContent.frame = CGRect(x: 0, y: 0, width: 0, height: height)*/
        //seatScrollView.contentInset = .zero
        /*seatScrollView.subviews.forEach { temp in
            temp.removeFromSuperview()
        }
        seatScrollView.layoutSubviews()*/
        //contentViewTest.reloadInputViews()
        //self.seatScrollView.setZoomScale(0.0, animated: false)
      //  contentViewTest?.isHidden = true
      //  normalViewTest?.isHidden = false
        
        //normalViewTest.backgroundColor = .colorPinkRed
        //seatScrollView.addSubview(normalViewTest ?? contentViewTest)
        
        
        
    }
    public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if seatScrollView.zoomScale != 1.0 ||  seatScrollView.zoomScale < 0{
            
        }else {
         booltest = false
         viewHeader.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 65)
         seatScrollView.contentSize = CGSize(width: 1.0, height: height)
        }
        /*print(self.seatScrollView.frame.size.height)
         print(self.viewContent.frame.size.height)
         print(height)
         print(self.seatScrollView.contentSize.height)
         print(seatScrollView.zoomScale * viewContent.bounds.size.height)
        print(scrollView.contentSize.height)*/
    
    }
    
    // Kihore zoom
    /*public func scrollViewDidZoom(_ scrollView: UIScrollView) {
        seatScrollView.pinchGestureRecognizer
        //scro
       //print(viewContent.location(in: view).x)
        let pointXY:CGPoint = (button.superview?.convert(button.frame.origin, to: nil))!
        print("button pointXY: \(pointXY.debugDescription)")
        //print(seatScrollView.zoomScale)
        if seatScrollView.zoomScale != 1.0 ||  seatScrollView.zoomScale < 0{
            print("Kishore != 1 < 0")
            
        seatScrollView.layoutIfNeeded()
            seatScrollView.contentSize = CGSize(width: viewContent.frame.width * seatScrollView.zoomScale, height: viewContent.frame.height * seatScrollView.zoomScale)
            print(viewContent.frame.width * seatScrollView.zoomScale)
       // viewContent.frame = CGRect(x: 0, y: 0, width: 0, height: height)
      //  viewContent.frame = CGRect(x: testX, y: testy, width: 100, height: 100)
        //viewContent.backgroundColor = .green
        viewContent.layer.masksToBounds = false
        self.seatScrollView.addSubview(viewContent)
        self.seatScrollView.bringSubviewToFront(viewContent)
        }else{
            print("Kishore kssdfsd")
            seatScrollView.layoutIfNeeded()
            seatScrollView.contentSize = CGSize(width: 0, height: height)
           // viewContent.frame = CGRect(x: 0, y: 0, width: 0, height: height)
           // viewContent.frame = CGRect(x: 0, y: 0, width: 0, height: height)
            //viewContent.backgroundColor = .green
            viewContent.layer.masksToBounds = false
            self.seatScrollView.addSubview(viewContent)
            self.seatScrollView.bringSubviewToFront(viewContent)
        }
       /* if seatScrollView.zoomScale != 1.0 ||  seatScrollView.zoomScale < 0{
            testView.isHidden = false
            viewContent.isHidden = true
            
            
            /*self.seatScrollView.addSubview(testView)
            self.seatScrollView.bringSubviewToFront(testView)*/
           /* seatScrollView.subviews.forEach { temp in
                temp.removeFromSuperview()
            }
            seatScrollView.layoutSubviews()*/
            setupSeat1()
            
            //testView.transform = CATransform3DMakeScale(newScale, newScale, 1.0);
           // self.testView.bounds = CGRect(x: 0, y: 0, width: 100 * 50, height: 100 * 50)//CGRectMake(0, 0, 100 * 5, 100 * 5); // supposing that label's original size is {100, 100}
              //  self.testView.layer.affineTransform = CGAffineTransformMakeScale(1.0/5, 1.0/5);
            testView.isHidden = false
            seatScrollView.contentSize = CGSize(width: 1000000, height: 100000)
            testView.frame = CGRect(x: 0, y: 0, width: 1000000, height: 1000000)
            //testView.backgroundColor = .green
            testView.layer.masksToBounds = false
           // self.CentreScrollViewContents()
            self.seatScrollView.addSubview(testView)
            self.seatScrollView.bringSubviewToFront(testView)
         /*   imageView.image = UIImage(named:"leftUE")
                if let image = imageView.image {

                    let ratioW = imageView.frame.width / image.size.width
                    let ratioH = imageView.frame.height / image.size.height

                    let ratio = ratioW < ratioH ? ratioW:ratioH

                    let newWidth = image.size.width*ratio
                    let newHeight = image.size.height*ratio

                    let left = 0.5 * (newWidth * scrollView.zoomScale > imageView.frame.width ? (newWidth - imageView.frame.width) : (scrollView.frame.width - scrollView.contentSize.width))
                    let top = 0.5 * (newHeight * scrollView.zoomScale > imageView.frame.height ? (newHeight - imageView.frame.height) : (scrollView.frame.height - scrollView.contentSize.height))

                    seatScrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
                }*/
            } else {
                print("Kishore\(testheight)")
                /*seatScrollView.subviews.forEach { temp in
                    temp.removeFromSuperview()
                }
                seatScrollView.layoutSubviews()*/
                //setupSeat()
               // viewContent.backgroundColor = .systemPink
               // testView.backgroundColor = .green
                testView.isHidden = true
                viewContent.isHidden = false
                seatScrollView.layoutIfNeeded()
                seatScrollView.contentSize = CGSize(width: 0, height: testheight)
               // viewContent.frame = CGRect(x: 0, y: 0, width: 0, height: height)
                viewContent.frame = CGRect(x: 0, y: 0, width: 0, height: testheight)
                //viewContent.backgroundColor = .green
                viewContent.layer.masksToBounds = false
                self.seatScrollView.addSubview(viewContent)
                self.seatScrollView.bringSubviewToFront(viewContent)
                //viewContent.backgroundColor = .systemPink
            }*/
    }*/

}
extension SampleViewController{
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
                if scrollYPosition + 30 < headerValue[itemIndex + 1].height ?? 0  {
                    setupScrollHeaderValue(Index: itemIndex, value: itemValue, xAxis: leadingValue)
                    break
                }
            }else{
                setupScrollHeaderValue(Index: itemIndex, value: itemValue, xAxis: leadingValue)
            }
        }
        
    }
    func setupScrollHeaderValue(Index : Int, value:ModelHeader ,xAxis: CGFloat){
        label.textColor = UIColor.colorDarkblue
        label.font = UIFont(name: "OpenSans-SemiBold", size: 16)
        var leadingValue = xAxis
        label.text = value.name
        label.frame = CGRect(x: 0, y: 4, width: viewHeader.frame.width, height: 24)
        label.textAlignment = .center
        viewHeader.addSubview(label)
        for configurationValue in 0..<(value.configuration?.count ?? -1){
            let index = String.Index(encodedOffset: configurationValue)
            button = UIButton()
            button.backgroundColor = UIColor.clear
            if let congifuration = value.configuration?[index]{
                if congifuration != "-" {
                    button.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 12)
                    button.setTitle("\(congifuration)", for: .normal)
                    button.setTitleColor(UIColor.colorGray, for: .normal)
                }
            }
            
            button.frame = CGRect(x: leadingValue, y: CGFloat(36), width: value.seatSize ?? 0, height: 16)
            
            leadingValue = leadingValue  + CGFloat(8) + (value.seatSize ?? 0)
            
            viewHeader.addSubview(button)
        }
    }
    
    func setupScrollHeaderZoom(scrollYPosition: CGFloat)
    {
        let leadingValue: CGFloat = 24
        viewHeader.isHidden =  scrollYPosition > 0 ? false : true
        
        for (itemIndex,itemValue) in headerValue.enumerated() {
           // if itemIndex != headerValue.count - 1 {
            if headerValue[itemIndex].height! * seatScrollView.zoomScale  - 120 < seatScrollView.contentOffset.y {
                viewHeader.subviews.forEach { temp in
                    temp.removeFromSuperview()
                }
                viewHeader.layoutSubviews()
            for i in headerValue[itemIndex].xyPositon ?? [] {
                setupScrollHeaderValueZoom(Index1: itemIndex, value: i.configuationChar!, xAxis: i.xValue! * seatScrollView.zoomScale, headerName: headerValue[itemIndex].name ?? "", seatSize: headerValue[itemIndex].seatSize!)
                
            }
            }
            
        }
        
    }
    func setupScrollHeaderValueZoom(Index1 : Int, value:String ,xAxis: CGFloat ,headerName : String,seatSize : CGFloat){
        label.textColor = UIColor.colorDarkblue
        label.font = UIFont(name: "OpenSans-SemiBold", size: 16)
        var leadingValue = xAxis
        label.text = headerName
        label.frame = CGRect(x: 0, y: 4, width: viewHeader.frame.width, height: 24)
        label.textAlignment = .center
        viewHeader.addSubview(label)
       // print(value.xyPositon?.first?.xValue)
       // for configurationValue in 0..<(value.configuration?.count ?? -1){
           
           // let index = String.Index(encodedOffset: configurationValue)
            button = UIButton()
            button.backgroundColor = UIColor.clear
       // if let congifuration = value {
                if value != "-" {
                    button.titleLabel?.font = UIFont(name: "OpenSans-Regular", size: 12)
                    button.setTitle("\(value)", for: .normal)
                    button.setTitleColor(UIColor.colorGray, for: .normal)
                    /*button.titleLabel?.text = value
                    button.titleLabel!.textAlignment = .center*/
                }
           // }
        let test : CGFloat = 56.66666666666667
            button.frame = CGRect(x: xAxis + 10, y: CGFloat(36), width: seatSize, height: 16)
            
            //leadingValue = leadingValue  + CGFloat(8) + (value.seatSize ?? 0)
            
        viewHeader.frame = CGRect(x: -seatScrollView.contentOffset.x, y: 0, width: seatScrollView.contentSize.width + 10, height: 65)
        viewHeader.addSubview(button)
        view.addSubview(viewHeader)
       // }
    }
}

