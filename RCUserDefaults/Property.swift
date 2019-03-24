//
//  Property.swift
//  RCUserDefaults
//
//  Created by roy.cao on 2019/3/24.
//  Copyright © 2019 roy. All rights reserved.
//

import Foundation
import ObjectiveC

struct Property: CustomStringConvertible {

    let name: String

    private(set) var typeEncoding: ObjCTypeEncoding = .unknown("?")

    private(set) var type: NSObject.Type?

    /// The property defines a custom getter selector name. The name follows the G (for example, GcustomGetter,).
    private(set) var customGetter: String?

    /// The property defines a custom setter selector name. The name follows the S (for example, ScustomSetter:,).
    private(set) var customSetter: String?

    init(_ property: objc_property_t) {
        self.name = String(cString: property_getName(property))

        var count: UInt32 = 0
        let attributeList = property_copyAttributeList(property, &count)!

        for i in 0..<Int(count) {
            let attribute = attributeList[i]

            let name = String(cString: attribute.name)
            let value = String(cString: attribute.value)

            switch name {
            case "T":
                var value = value
                if value.hasPrefix("@\"") && value.hasSuffix("\"") { // id
                    value = value
                        .replacingOccurrences(of: "@\"", with: "")
                        .replacingOccurrences(of: "\"", with: "")
                } else if value.hasPrefix("r") { // const
                    value = value.replacingOccurrences(of: "r", with: "")
                }
                if classExists(value) {
                    self.typeEncoding = ObjCTypeEncoding("@")
                    self.type = getClass(value)
                } else {
                    self.typeEncoding = ObjCTypeEncoding(value)
                }
            case "G":
                self.customGetter = value
            case "S":
                self.customSetter = value
            default: break
            }
        }

        free(attributeList)
    }

    public var description: String {
        return "[objc_property name: \(self.name)]"
    }
}

extension NSObject {

    static var properties: [Property] {
        var count: UInt32 = 0
        guard let propertyList = class_copyPropertyList(self, &count) else { return [] }

        var properties = [Property]()

        for i in 0..<count {
            properties.append(Property(propertyList[Int(i)]))
        }

        free(propertyList)
        return properties
    }
}

func classExists(_ name: String) -> Bool {
    return objc_getClass(name.cString(using: .utf8)!) != nil
}

func getClass(_ name: String) -> NSObject.Type? {
    return objc_getClass(name.cString(using: .utf8)!) as? NSObject.Type
}
