// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "vapor-apns",
    platforms: [
       .macOS(.v13),
       .iOS(.v16)
    ],
    products: [
        .library(name: "VaporAPNS", targets: ["VaporAPNS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/rggsix/APNSwift.git", from: "5.0.4"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.77.2"),
    ],
    targets: [
        .target(name: "VaporAPNS", dependencies: [
            .product(name: "APNS", package: "apnswift"),
            .product(name: "Vapor", package: "vapor"),
        ]),
        .testTarget(name: "VaporAPNSTests", dependencies: [
            .target(name: "VaporAPNS"),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
    ]
)
