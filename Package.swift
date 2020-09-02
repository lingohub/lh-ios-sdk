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
            checksum: "148b9f871195cac2c40628486d8fca648cb83d566fafca6e119b3e7d449d7a25"
        )
    ]
)
