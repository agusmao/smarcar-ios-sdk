// swift-tools-version:5.3
import PackageDescription

let version = "v6.3.0"
let checksum = "sha256:41c0342bb1ea1b9233bdee1844850ccb2b726ca61e09b493e9ca6f955a56813c"

let package = Package(
    name: "SmartcarAuth",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SmartcarAuth",
            targets: ["SmartcarAuth"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble.git", from: "13.7.1")
    ],
    targets: [
        .binaryTarget(
            name: "SmartcarAuthBinary",
            url: "https://github.com/smartcar/ios-sdk/releases/download/\(version)/framework.zip",
            checksum: checksum
        ),
        .target(
            name: "SmartcarAuth",
            dependencies: ["SmartcarAuthBinary"],
            path: "SmartcarAuth"
        ),
        .testTarget(
            name: "SmartcarAuthTests",
            dependencies: [
                "SmartcarAuth",
                .product(name: "Nimble", package: "Nimble")
            ],
            path: "SmartcarAuthTests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
