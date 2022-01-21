// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "cardboard",
  platforms: [.iOS(.v12)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "cardboard",
      targets: ["cardboard"]
    ),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "cardboard",
      dependencies: ["protobufcpp"],
      path: "sdk",
      exclude: [
          //
      ],
      cxxSettings: [
        .headerSearchPath("proto"),
        .headerSearchPath("third_party/unity_plugin_api"),

        .unsafeFlags([
          "-std=c++11",
        ]),
      ],
      linkerSettings: [
        .linkedFramework("MetalKit"),
        .linkedFramework("Metal"),

      ]
    ),

    .target(
      name: "protobufcpp",
      dependencies: [],
      path: "third_party/Protobuf-C++",
      exclude: [
          //
      ],
      cxxSettings: [
        .headerSearchPath("src"),

        .define("HAVE_PTHREAD", to: "1"),

        .unsafeFlags([
          "-std=c++11",
        ]),
      ],
      linkerSettings: [
        .linkedLibrary("pthread"),
      ]
    ),
  ]
)
