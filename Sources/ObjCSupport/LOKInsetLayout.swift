// Copyright 2018 LinkedIn Corp.
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import CoreGraphics

/**
 A layout that insets another layout.
 */
  open class LOKInsetLayout: LOKBaseLayout {

    /**
     `EdgeInsets` for layout.
     */
      public let insets: EdgeInsets

    /**
     Specifies how a layout positions itself inside of its parent view.
     */
      public let alignment: LOKAlignment

    /**
     Class object for the view class to be created.
     */
      public let viewClass: View.Type

    /**
     Sublayout for `LOKInsetLayout`.
     */
      public let sublayout: LOKLayout

    /**
     LayoutKit configuration block called with created View.
     */
      public let configure: ((View) -> Void)?

      public init(insets: EdgeInsets,
                      alignment: LOKAlignment? = nil,
                      flexibility: LOKFlexibility? = nil,
                      viewReuseId: String? = nil,
                      viewClass: View.Type? = nil,
                      sublayout: LOKLayout,
                      configure: ((View) -> Void)? = nil) {
        self.insets = insets
        self.sublayout = sublayout
        self.alignment = alignment ?? .fill
        self.viewClass = viewClass ?? View.self
        self.configure = configure
        let layout = InsetLayout(
            insets: self.insets,
            alignment: self.alignment.alignment,
            flexibility: flexibility?.flexibility,
            viewReuseId: viewReuseId,
            sublayout: self.sublayout.unwrapped,
            viewClass: self.viewClass,
            config: self.configure)
        super.init(layout: layout)
    }

      public class func inset(by insets: EdgeInsets, sublayout: LOKLayout) -> LOKInsetLayout {
        return LOKInsetLayout(insets: insets, sublayout: sublayout)
    }
}
