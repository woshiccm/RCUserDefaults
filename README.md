
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Overview
UserDefaults access via properties, deeply inspired by GVUserDefaults.

## Usage

Extension RCUserDefaults, add some properties and make them @NSManaged.


```swift
extension RCUserDefaults {

    @NSManaged var string: String
    @NSManaged var stringOptional: String?

    @NSManaged var bool: Bool

    @NSManaged var int: Int

    @NSManaged var double: Double

    @NSManaged var float: Float

    @NSManaged var data: Data
    @NSManaged var dataOptional: Data?

    @NSManaged var any: Any
    @NSManaged var anyOptional: Any?

    @NSManaged var array: [Int]
    @NSManaged var arrayOptional: [Int]?

    @NSManaged var dictionary: [String: Int]
    @NSManaged var dictionaryOptional: [String: Int]?

}

```
You can save defaults by setting the property:

```swift

RCUserDefaults.standard.string = "string"

RCUserDefaults.standard.bool = true

RCUserDefaults.standard.int = 1

RCUserDefaults.standard.double = 1

RCUserDefaults.standard.float = 1.0

RCUserDefaults.standard.array = [1]

RCUserDefaults.standard.dictionary = ["test": 1]

```

You can get defaults by getting the property:

```swift
let string = RCUserDefaults.standard.string // "string"
let bool = RCUserDefaults.standard.bool // true
let int = RCUserDefaults.standard.int // 1
let double = RCUserDefaults.standard.double // 1
let float = RCUserDefaults.standard.float // 1.0
let array = RCUserDefaults.standard.array // [1]
let dictionary = RCUserDefaults.standard.dictionary // ["test": 1]

```


## Installation

#### Carthage
Add the following line to your [Cartfile](https://github.com/carthage/carthage)

```
git "https://github.com/woshiccm/RCUserDefaults.git" "master"
```


##License
All this code is released under the MIT license.

