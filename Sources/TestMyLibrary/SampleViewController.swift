//
//  SampleViewController.swift
//  
//
//  Created by Kishore on 17/08/22.
//

import UIKit
public protocol scrollviewDelegete: AnyObject {
    func lastIndex(
        seat: Seats
    )
}
struct  TestDataForHeight{
    var height: CGFloat?
    var name: String?
    var configuration : String?
    var seatSize : CGFloat?
}
class MyTapGesture:UITapGestureRecognizer{
    var data : Seats?
}


public class SampleViewController: UIViewController,UIScrollViewDelegate {
    
    @objc func tapped( sender : MyTapGesture){
        print("set")
        if let seats = sender.data{
        delegate?.lastIndex(seat: seats)
        }
    }
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setupScrollHeader(scrollYPosition: scrollView.contentOffset.y)
        
    }
    func setupScrollHeader(scrollYPosition: CGFloat)
        {
            var newValue: CGFloat = 10
            //viewHeader.isHidden =  scrollView.contentOffset.y > 0 ? false : true
            viewTest.isHidden =  scrollYPosition > 0 ? false : true
            for (index,i) in header.enumerated() {
           //label = UILabel()
                //label.frame = CGRect(x: 10, y: 20, width: 200, height: 40)
                if index != header.count - 1 {
                if scrollYPosition < header[index + 1].height! {
                   // self.viewTest.isHidden = false
                   // button.removeFromSuperview()
                    print("\(i.seatSize) Kishore ")
                    label.text = i.name
                    for abcd in 0..<(i.configuration?.count ?? -1){
                        
                        let index1 = String.Index(encodedOffset: abcd)
                           button = UIButton()
                            button.backgroundColor = UIColor.clear
                        if i.configuration![index1] != "-" {
                            if  "United Premium Plus" == i.configuration! {
                            //print("\(i.configuration![index1]) Kishore \(index) \(i.name)")
                            button.setTitle("\(i.configuration![index1])", for: .normal)
                                button.setTitleColor(UIColor.gray, for: .normal)
                            }else{
                                button.setTitle("\(i.configuration![index1])", for: .normal)
                                    button.setTitleColor(UIColor.gray, for: .normal)
                            }
                            }
                            
                        button.frame = CGRect(x: newValue, y: CGFloat(50), width: i.seatSize ?? 0, height: i.seatSize ?? 0)
                        
                        newValue = newValue  + CGFloat(8) + (i.seatSize ?? 0)
                        viewTest.addSubview(button)
                           // mScrollView.addSubview(button)
                    }
                   // labelHeader.text = i.name
                   
                        /*self.view.addSubview(viewTest)
                    viewTest.backgroundColor = UIColor.green
                    self.view.bringSubviewToFront(viewTest)
                   // view.insertSubview(viewTest, aboveSubview: mScrollView)
                    print(i.name)
                    print(i.height)*/
                    break
                 //   print(<#T##items: Any...##Any#>)
                }
                }else{
                   // self.viewTest.isHidden = false
                    label.text = i.name
                    //print("\(i.name) Kishore ")
                    for abcd in 0..<(i.configuration?.count ?? -1){
                        print("\(i.name) Kishore2 \(index) ")
                        let index1 = String.Index(encodedOffset: abcd)
                           button = UIButton()
                            button.backgroundColor = UIColor.clear
                        if i.configuration![index1] != "-" {
                            
                                button.setTitle("\(i.configuration![index1])", for: .normal)
                                    button.setTitleColor(UIColor.gray, for: .normal)

                            }
                            
                            button.frame = CGRect(x: newValue, y: CGFloat(50), width: i.seatSize ?? 0, height: i.seatSize ?? 0)
                        
                        newValue = newValue  + CGFloat(8) + (i.seatSize ?? 0)
                        viewTest.addSubview(button)
                           // mScrollView.addSubview(button)
                    }
                  /*  viewTest.backgroundColor = UIColor.green
                  //  viewTest.addSubview(label)
                  //  labelHeader.text = i.name
                    self.view.addSubview(viewTest)
                    /*label.text = i.name
                    viewHeader.addSubview(label)*/
                    self.view.bringSubviewToFront(viewTest)
                   // view.insertSubview(viewTest, aboveSubview: mScrollView)
                    print(i.name)
                    print(i.height)*/
                }
            }
            
        }
    
    //SE 13 13 pro max  ipad  8 plus

    @IBOutlet public weak var mScrollView: UIScrollView!
    let label = UILabel()
    var test : ModelSeatMap?
    var header = [TestDataForHeight]()
    var height:CGFloat = 16
    var button = UIButton()
   public var delegate : scrollviewDelegete?
    var viewTest = UIView()
    var ynewOffset:CGFloat = 8
    var xnewOffset:CGFloat = 16
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollHeader()
        testJson()
        newFunc()
        mScrollView.delegate = self
        // Do any additional setup after loading the view.
        
    }
    func setupScrollHeader() {
        viewTest.frame = CGRect(x: 10, y: 20, width: view.frame.width - 40, height: 40)
        
       
        label.frame = CGRect(x: 10, y: 20, width: viewTest.frame.width, height: 40)
        label.textAlignment = .center
        button.frame = CGRect(x: 10, y: 50, width: viewTest.frame.width, height: 40)
        viewTest.addSubview(button)
        viewTest.addSubview(label)
        self.view.addSubview(viewTest)
        self.view.bringSubviewToFront(viewTest)
        self.viewTest.isHidden = true
    }
    func setupHeader(tilte: String,configuration: String) {
        var header1 = TestDataForHeight()
        let button = UIButton()
        button.frame = CGRect(x: 100, y: CGFloat(height), width: 200, height: 40)
        //mScrollView.addSubview(button)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle(tilte, for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
       // button.translatesAutoresizingMaskIntoConstraints = false
        header1.height = height
        header1.name = tilte
        header1.configuration = configuration
        header.append(header1)
        height += 50
        mScrollView.addSubview(button)
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
            height = ynewOffset + SeatWidthHeight + 8 //yaxis padding
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
    func setupSeatRowNumber(seat: Seats, rowNumber: String,SeatWidthHeight: CGFloat,index: Int,cabinindex: Int) {
        var imageView = UIImageView()
        button.tag = index
        if seat.seatvalue == "-"  {
            button = UIButton()
            button.backgroundColor = UIColor.clear
            button.titleLabel?.font = .systemFont(ofSize: 12)
            button.setTitle(rowNumber, for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: SeatWidthHeight, height: SeatWidthHeight)
            xnewOffset = xnewOffset  + CGFloat(8) + SeatWidthHeight
            mScrollView.addSubview(button)
        }else{
                let imageSize:CGSize = CGSize(width: 20, height: 20)
                button = UIButton()
                button.layer.cornerRadius = 5
                button.layer.borderWidth = 1
                if ((seat.seatvalue == "X")){
                    //Occuiped
                    button.backgroundColor = UIColor.gray
                    button.layer.borderColor = UIColor.gray.cgColor
                } else if ((seat.seatvalue == "O")) {
                    //Open Economy Plus Seats
                    button.backgroundColor = UIColor.white
                    button.layer.borderColor = UIColor.gray.cgColor
                } else if ((seat.seatvalue == "O")) {
                    //Open Economy Plus Seats
                    button.backgroundColor = UIColor.white
                    button.layer.borderColor = UIColor.gray.cgColor
                }
            button.addTarget(self, action: #selector(pressedd), for: .touchUpInside)
                button.imageView?.contentMode = .scaleAspectFit
                button.frame = CGRect(x: xnewOffset, y: CGFloat(ynewOffset), width: SeatWidthHeight, height: SeatWidthHeight)
                xnewOffset = xnewOffset  + CGFloat(8) + SeatWidthHeight
            let iconbutton = UIButton()
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
        
        let responseModel = try? jsonDecoder.decode(ModelSeatMap.self, from: readLocalFile(forName: "2325Flight")!)
        self.test = responseModel
       // dynamicButtonCreationNew()
    }
    @objc func pressedd(sender: UIButton) {
        print("\(sender.tag)")
        print("Kishore")
        //delegate?.lastIndex(flightInfo: "Kishore", selecetdIndexDate: "Kishore")
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
