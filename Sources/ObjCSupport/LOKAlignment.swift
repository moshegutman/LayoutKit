// Copyright 2018 LinkedIn Corp.
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import CoreGraphics

/**
 Specifies how a layout positions itself inside of the rect that it is given to it by its parent during arrangement.
 */
 open class LOKAlignment: NSObject {
    let alignment: Alignment
    init(alignment: Alignment) {
        self.alignment = alignment
    }
     public static let center = LOKAlignment(alignment: .center)
     public static let fill = LOKAlignment(alignment: .fill)
     public static let topCenter = LOKAlignment(alignment: .topCenter)
     public static let topFill = LOKAlignment(alignment: .topFill)
     public static let topLeading = LOKAlignment(alignment: .topLeading)
     public static let topTrailing = LOKAlignment(alignment: .topTrailing)
     public static let bottomCenter = LOKAlignment(alignment: .bottomCenter)
     public static let bottomFill = LOKAlignment(alignment: .bottomFill)
     public static let bottomLeading = LOKAlignment(alignment: .bottomLeading)
     public static let bottomTrailing = LOKAlignment(alignment: .bottomTrailing)
     public static let centerFill = LOKAlignment(alignment: Alignment(vertical: .center, horizontal: .fill))
     public static let centerLeading = LOKAlignment(alignment: .centerLeading)
     public static let centerTrailing = LOKAlignment(alignment: .centerTrailing)
     public static let fillLeading = LOKAlignment(alignment: .fillLeading)
     public static let fillTrailing = LOKAlignment(alignment: .fillTrailing)
     public static let fillCenter = LOKAlignment(alignment: Alignment(vertical: .fill, horizontal: .center))
     public static let aspectFit = LOKAlignment(alignment: .aspectFit)

    /**
     Positions a rect of the given size inside the given rect using the alignment spec.
     */
     public func position(size: CGSize, in rect: CGRect) -> CGRect {
        return alignment.position(size: size, in: rect)
    }
}
