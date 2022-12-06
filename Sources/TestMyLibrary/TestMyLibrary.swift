
import UIKit
public struct TestMyLibrary {
    static public func createViewController() -> SampleViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.module)
        return storyboard.instantiateInitialViewController() as! SampleViewController
    }
}
