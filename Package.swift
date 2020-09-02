// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "LingoHub",
    platforms: [
        .macOS(.v10_11), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LingoHub",
            targets: ["LingoHub"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "LingoHub",
            url: "https://github.com/lingohub/lh-ios-sdk/releases/download/1.0.0/LingoHub.xcframework.zip",
            checksum: "64586d9e2067a2c38db2fbef92978e8263b6c941b10d9317e3b7a0f87c32f09a"
        )
    ]
)
