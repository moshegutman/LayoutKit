// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "LayoutKit",
    products: [
            .library(name: "LayoutKit", targets: ["LayoutKit"])
        ],
    dependencies: [],
        targets: [
            .target(name: "LayoutKit",
                    path: "Sources")
        ]
)
