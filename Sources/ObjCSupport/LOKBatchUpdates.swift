// Copyright 2018 LinkedIn Corp.
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

import Foundation

/**
 A set of updates to apply to a `ReloadableView`.

 Inherits from `NSObject` in order to be exposable to Objective-C.
 Objective-C exposability is needed in order to override methods from extensions that use `BatchUpdates` as parameter.
 */
  open class LOKBatchUpdates: NSObject {
      public var insertItems = [IndexPath]()
      public var deleteItems = [IndexPath]()
      public var reloadItems = [IndexPath]()
      public var moveItems = [LOKBatchUpdateItemMove]()

      public var insertSections = IndexSet()
      public var deleteSections = IndexSet()
      public var reloadSections = IndexSet()
      public var moveSections = [LOKBatchUpdateSectionMove]()

      public override init() {
        super.init()
    }

    var unwrapped: BatchUpdates {
        let updates = BatchUpdates()
        updates.insertItems = insertItems
        updates.deleteItems = deleteItems
        updates.reloadItems = reloadItems
        updates.moveItems = moveItems.map { $0.unwrapped }
        updates.insertSections = insertSections
        updates.deleteSections = deleteSections
        updates.reloadSections = reloadSections
        updates.moveSections = moveSections.map { $0.unwrapped }
        return updates
    }
}

/**
 Instruction to move an item from one index path to another.
 */
  open class LOKBatchUpdateItemMove: NSObject {
      public let from: IndexPath
      public let to: IndexPath

      public init(from: IndexPath, to: IndexPath) {
        self.from = from
        self.to = to
    }

    var unwrapped: ItemMove {
        return ItemMove(from: from, to: to)
    }
}

/**
 Instruction to move a section from one index to another.
 */
  open class LOKBatchUpdateSectionMove: NSObject {
      public let from: Int
      public let to: Int

      public init(from: Int, to: Int) {
        self.from = from
        self.to = to
    }

    var unwrapped: SectionMove {
        return SectionMove(from: from, to: to)
    }
}

