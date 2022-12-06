
import UIKit
public struct TestMyLibrary {
    static public func createViewController() -> SampleViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateInitialViewController() as! SampleViewController
    }
}
