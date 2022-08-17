
import UIKit
public struct TestMyLibrary {
    static public func createViewController() -> SampleViewController {
        let storyboard = UIStoryboard(name: "SampleViewController", bundle: Bundle.module)
        return storyboard.instantiateInitialViewController() as! SampleViewController
    }
}
