//
//  ScrollViewController.swift
//  Projectseatmap1
//
//  Created by 2257848 on 26/07/22.
//

import UIKit
public struct fontDetails {
   public var mediumFont : UIFont?
    public var colorBlue : UIColor?
}
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
public struct  TestDataForHeight{
    var height: CGFloat?
    var name: String?
    var configuration : String?
    var seatSize : CGFloat?
}
class TestDataArray: NSObject {
    var testDataForHeight: [TestDataForHeight]?
}

class MyButton: UIButton{
    
    var myParam1: Seats?
    var myParam2: String?
    
}
public class SampleViewController: UIViewController, UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView){
        setupScrollHeader(scrollYPosition: scrollView.contentOffset.y)
    }
    func setupScrollHeader(scrollYPosition: CGFloat)
    {
        var newValue: CGFloat = 10
        //viewHeader.isHidden =  scrollView.contentOffset.y > 0 ? false : true
        viewTest.isHidden =  scrollYPosition > 0 ? false : true
        viewTest.subviews.forEach { temp in
            temp.removeFromSuperview()
        }
        viewTest.layoutSubviews()
        for (index,i) in header.enumerated() {
            //label = UILabel()
            //label.frame = CGRect(x: 10, y: 20, width: 200, height: 40)
            if index != header.count - 1 {
                if scrollYPosition < header[index + 1].height!  {
                    setupScrollHeaderValue(Index: index, value: i, xAxis: newValue)
                    break
                }
            }else{
                setupScrollHeaderValue(Index: index, value: i, xAxis: newValue)
            }
        }
        
    }
    func setupScrollHeaderValue(Index : Int, value:TestDataForHeight ,xAxis: CGFloat){
            // self.viewTest.isHidden = false
            // button.removeFromSuperview()
        label.textColor = UIColor.black
        var xAxisNew = xAxis
            print("\(value.name) Kishore \(index)")
            label.text = value.name
            label.frame = CGRect(x: 0, y: 0, width: viewTest.frame.width, height: 20)
            label.textAlignment = .center
           // button.frame = CGRect(x: 10, y: 50, width: viewTest.frame.width, height: 40)
       // setupWingHeader(LeftWing: true)
        //setupWingHeader(LeftWing: false)
        /*imageView1.frame = CGRect(x:0 , y: 0, width: 104, height: 40)
        imageView1.contentMode = .scaleAspectFit
        imageView1.image = UIImage(named:"leftUE")
        imageView1.backgroundColor = UIColor.clear
        viewTest.addSubview(imageView)
        viewTest.addSubview(imageView1)*/
            viewTest.addSubview(label)
            for abcd in 0..<(value.configuration?.count ?? -1){
                //button.setTitle(" ", for: .normal)
                let index1 = String.Index(encodedOffset: abcd)
                button = UIButton()
                button.backgroundColor = UIColor.clear
                if value.configuration![index1] != "-" {
                    button.setTitle("\(value.configuration![index1])", for: .normal)
                    button.setTitleColor(UIColor.gray, for: .normal)
                }
                
                button.frame = CGRect(x: xAxisNew, y: CGFloat(20), width: value.seatSize ?? 0, height: 40)
                
                xAxisNew = xAxisNew  + CGFloat(8) + (value.seatSize ?? 0)
                viewTest.addSubview(button)
            }
    }
    
    
    //SE 13 13 pro max  ipad  8 plus
   public var delegate : scrollviewDelegete?
    var viewTest = UIView()
    var label: UILabel = UILabel()
    
    @IBOutlet weak var mScrollView: UIScrollView!
    var seatsVMData : NSMutableDictionary?
    var yPosition : CGFloat = 0
    // let label = UILabel()
    var test : ModelSeatMap?
    var header = [TestDataForHeight]()
    var seatIconBtnsIndex: Int = 0
    var cabinAvgSeatHeightData : NSMutableArray?
    var testArray: [CGFloat] = []
    var imgSeat = UIButton()
    var isFirstRowInCabin: Bool?
    var height:CGFloat = 16
    var button = UIButton()
    public var fontStyle : fontDetails?
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var labelHeader: UILabel!
    
    var ynewOffset:CGFloat = 8
    var xnewOffset:CGFloat = 16
    var seatSize: CGFloat = 0
    var imageView = UIImageView()
    var imageView1 = UIImageView()
    @objc func tapped(sender : MyTapGesture) {
            print(sender.data)
        if let seats = sender.data {
            delegate?.deatilsSeats(seats: seats)
        }
           // label1.text = sender.title
        }
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        viewTest.frame = CGRect(x: 16, y: 60, width: view.frame.width - 16, height: 60)
        viewTest.backgroundColor = .lightText
        
        
        
        self.view.addSubview(viewTest)
        self.view.bringSubviewToFront(viewTest)
        self.viewTest.isHidden = true
        testJson()
        // UALSeatVMCRM.buildDataObjects((self.test?.crmSeatMapResponse?.seatMap)!)
        // seatsVMData = UALSeatVMCRM.getSeatsData()
        //LabelUI()
        //newFuncRowWise()
        //newFuncEqualSpacing()
        newFunc()
        //newFuncWorkingFine()
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
    @objc func pressedd(sender: UIButton) {
        print("\(sender.tag)")
        print("Kishore")
        if let value = self.test?.crmSeatMapResponse?.seatMap?.cabins {
            print(value[0].rows?[0].seats?[sender.tag])
        }
        //delegate?.lastIndex(flightInfo: "Kishore", selecetdIndexDate: "Kishore")
    }
    
    func setupHeader(tilte: String,configuration: String) {
        var imageView = UIImageView()
        var header1 = TestDataForHeight()
        let button = UIButton()
        button.frame = CGRect(x: 100, y: CGFloat(height), width: 200, height: 40)
        //mScrollView.addSubview(button)
        button.titleLabel?.font = fontStyle?.mediumFont
        button.setTitle(tilte, for: .normal)
        button.setTitleColor(fontStyle?.colorBlue, for: .normal)
        setupWingHeader(LeftWing: true)
        setupWingHeader(LeftWing: false)
        height += 50
        mScrollView.addSubview(button)
       // mScrollView.addSubview(imageView)
    }
    func setupWingHeader(LeftWing : Bool){
        var imageView = UIImageView()
        imageView.frame = CGRect(x:LeftWing ? viewTest.frame.width - 120 : 8, y: height + 5, width: 100, height: 40)
        imageView.contentMode = .scaleAspectFit
        imageView.image = LeftWing ? UIImage(named:"leftUE") : UIImage(named:"RightUE")
        imageView.backgroundColor = UIColor.clear
        mScrollView.addSubview(imageView)
    }
    func setupConfiguration(configuration: String,SeatWidthHeight: CGFloat,configurationHeader : String){
        var header1 = TestDataForHeight()
        header1.height = height
        header1.name = configurationHeader
        header1.configuration = configuration
        header1.seatSize = SeatWidthHeight
        header.append(header1)
        for abcd in 0..<configuration.count{
            let index = String.Index(encodedOffset: abcd)
            button = UIButton()
            button.backgroundColor = UIColor.clear
            if configuration[index] != "-" {
                button.setTitle("\(configuration[index])", for: .normal)
                button.setTitleColor(UIColor.gray, for: .normal)
            }
            
            button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: SeatWidthHeight, height: SeatWidthHeight)
            xnewOffset = xnewOffset  + CGFloat(8) + SeatWidthHeight
            mScrollView.addSubview(button)
            //}
            if abcd  == (configuration.count ) - 1{
                height = ynewOffset + SeatWidthHeight + 8 + 10 //yaxis padding
            }
        }
    }
    func setupISExit(seat: [Seats],index: Int,SeatWidthHeight : CGFloat) {
        if seat[index].exit == true {
            button = UIButton()
            button.backgroundColor = UIColor.red
            button.frame = CGRect(x: 4, y: CGFloat(ynewOffset), width: 5, height: SeatWidthHeight)
            mScrollView.addSubview(button)
            if index  == (seat.count ?? 0) - 1{
                button = UIButton()
                button.backgroundColor = UIColor.red
                button.frame = CGRect(x: xnewOffset + SeatWidthHeight + 10 , y: CGFloat(ynewOffset), width: 5, height: SeatWidthHeight)
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
    
    func setupSeatRowNumber(seat: Seats, rowNumber: String,SeatWidthHeight: CGFloat,index: Int,cabinindex: Int) {
        //Button Tag Kishore
        var imageView = UIImageView()
        //0 0 6
        button.tag = index
        if seat.seatvalue == "-"  {
            button = UIButton()
            button.backgroundColor = UIColor.clear
            button.titleLabel?.font = fontStyle?.mediumFont
            button.setTitle(rowNumber, for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: SeatWidthHeight, height: SeatWidthHeight)
            xnewOffset = xnewOffset  + CGFloat(8) + SeatWidthHeight
            mScrollView.addSubview(button)
        }else{
            let imageSize:CGSize = CGSize(width: 20, height: 20)
            setupSeatColor(seatValue: seat.seatvalue!)
            let tappy = MyTapGesture(target: self, action: #selector(tapped(sender:)))
                    button.addGestureRecognizer(tappy)
                    tappy.data = seat
            //button.addTarget(self, action: #selector(pressedd), for: .touchUpInside)
            button.imageView?.contentMode = .scaleAspectFit
            button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: SeatWidthHeight, height: SeatWidthHeight)
            xnewOffset = xnewOffset  + CGFloat(8) + SeatWidthHeight
            var iconbutton = UIButton()
            iconbutton.setImage(UIImage(named: "action"), for: .normal)
            iconbutton.backgroundColor = UIColor.green
            iconbutton.imageView?.contentMode = .scaleAspectFill
            iconbutton.frame = CGRect(x: xnewOffset - 18, y: CGFloat(ynewOffset - 8), width: 16, height: 16)
            iconbutton.layer.cornerRadius = 0.5 * iconbutton.bounds.size.width
            iconbutton.clipsToBounds = true
            var testvalue = CGFloat(SeatWidthHeight * 0.6)
            imageView.frame = CGRect(x:button.center.x - (testvalue / 2) , y: button.center.y - (testvalue / 2), width: testvalue, height: testvalue)
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named:"Icons_24px_Travel_")
            imageView.backgroundColor = UIColor.clear
            
            mScrollView.addSubview(button)
            mScrollView.addSubview(imageView)
            mScrollView.addSubview(iconbutton)
        }
    }
    func setupSeat(SeatWidthHeight: CGFloat,row :Rows,rowindex: Int,Cabinindex:Int){
        for seattry in 0..<(row.seats?.count ?? -1){
            if let seats = row.seats {
                setupISExit(seat: seats, index: seattry, SeatWidthHeight: SeatWidthHeight)
            }
            if let seatsNumber = row.seats?[seattry] {
                setupSeatRowNumber(seat: seatsNumber, rowNumber: row.number ?? "", SeatWidthHeight: SeatWidthHeight,index : seattry, cabinindex: Cabinindex )
            }
            if seattry  == (row.seats?.count ?? 0) - 1{
                height = ynewOffset + SeatWidthHeight + 8//yaxis padding
            }
        }
    }
    func setupRows(row : [Rows],j: Int,configuration:String,configutationHeader : String)
    {
        //  var ynewOffset:CGFloat = 8
        // var xnewOffset:CGFloat = 16
        button = UIButton()
        let rowIndexAddABCD = (row.count) + 1
        var headerBool = 0
        for rowtry in 0..<rowIndexAddABCD{
            if j == 0 && headerBool == 0{
                ynewOffset = height
                xnewOffset = 16
            } else {
                xnewOffset = 16
                ynewOffset = height //yaxis padding
            }
            
            let widthHeightButton  = buttonWidthrowWise(index: row[0].seats?.count ?? 0) - CGFloat(8)
            seatSize = buttonWidthrowWise(index: row[0].seats?.count ?? 0) - CGFloat(8)
            if headerBool == 0 {
                headerBool += 1
                setupConfiguration(configuration: configuration, SeatWidthHeight: widthHeightButton, configurationHeader: configutationHeader)
            }
            else {
                headerBool += 1
                setupSeat(SeatWidthHeight: widthHeightButton, row: row[rowtry - 1], rowindex: rowtry, Cabinindex: j)
                
            }
        }
    }
    func newFunc(){
        
        // var height:CGFloat = 0
        
        // var ynewOffset:CGFloat = 8
        //  var xnewOffset:CGFloat = 16
        //mScrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: view.bounds.width, height: 50))
        
        
        //mScrollView.backgroundColor = UIColor.blue
        mScrollView.translatesAutoresizingMaskIntoConstraints = false
        if let value = self.test?.crmSeatMapResponse?.seatMap?.cabins {
            button = UIButton()
            var imageView = UIImageView()
            
            //print(value.count)
            for j in 0..<value.count {
                setupHeader( tilte: "\(value[j].cos!)", configuration: value[j].configuration ?? "")
                /* var header1 = TestDataForHeight()
                 let button = UIButton()
                 button.frame = CGRect(x: 100, y: CGFloat(height), width: 200, height: 40)
                 //mScrollView.addSubview(button)
                 button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                 button.setTitle("\(value[j].cos!)", for: .normal)
                 button.setTitleColor(UIColor.gray, for: .normal)
                 // button.translatesAutoresizingMaskIntoConstraints = false
                 testArray.append(height)
                 header1.height = height
                 header1.name = "\(value[j].cos!)"
                 header1.configuration = value[j].configuration ?? ""
                 header.append(header1)
                 height += 50
                 mScrollView.addSubview(button)*/
                
                setupRows(row: value[j].rows!, j: j, configuration: value[j].configuration ?? "", configutationHeader: "\(value[j].cos!)")
                
                
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
        
        print(height)
        mScrollView.contentSize = CGSize(width: 0, height: height)
    }
    func buttonWidthrowWise(index: Int) -> CGFloat{
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
