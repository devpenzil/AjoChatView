// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatViewPOC",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "ChatViewPOC",
            targets: ["ChatViewPOC"]
        ),
    ],
    targets: [
        .target(
            name: "ChatViewPOC"
//            resources: [
//                .process("Resources") // 👈 This is what add images to the package bundle!
//            ]
        )
    ]
)

