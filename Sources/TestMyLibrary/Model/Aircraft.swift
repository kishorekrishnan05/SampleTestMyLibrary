/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
public struct Aircraft : Codable {
    public let code : String?
    public let shortName : String?
    public let longName : String?
    public let crmCode : String?
    public let ownerAirlineCode : String?
    public let crewLine : Int?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case shortName = "shortName"
		case longName = "longName"
		case crmCode = "crmCode"
		case ownerAirlineCode = "ownerAirlineCode"
		case crewLine = "crewLine"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(String.self, forKey: .code)
		shortName = try values.decodeIfPresent(String.self, forKey: .shortName)
		longName = try values.decodeIfPresent(String.self, forKey: .longName)
		crmCode = try values.decodeIfPresent(String.self, forKey: .crmCode)
		ownerAirlineCode = try values.decodeIfPresent(String.self, forKey: .ownerAirlineCode)
		crewLine = try values.decodeIfPresent(Int.self, forKey: .crewLine)
	}

}
