// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
      targets: ["FirebaseABTestingTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAnalyticsOnDeviceConversion",
      targets: ["FirebaseAnalyticsOnDeviceConversionTarget"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheckTarget"]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: ["FirebaseAppDistributionTarget"]
    ),
    .library(
      name: "FirebaseAuth",
      targets: ["FirebaseAuthTarget"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlyticsTarget"]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: ["FirebaseDatabaseTarget"]
    ),
    .library(
      name: "FirebaseDynamicLinks",
      targets: ["FirebaseDynamicLinksTarget"]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: ["FirebaseFirestoreTarget"]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: ["FirebaseFunctionsTarget"]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: ["FirebaseInAppMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformanceTarget"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfigTarget"]
    ),
    .library(
      name: "FirebaseStorage",
      targets: ["FirebaseStorageTarget"]
    ),
    .library(
      name: "Google-Mobile-Ads-SDK",
      targets: ["Google-Mobile-Ads-SDKTarget"]
    ),
    .library(
      name: "GoogleSignIn",
      targets: ["GoogleSignInTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./"
    ),
    .target(
      name: "FirebaseABTestingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuth",
        "_GTMSessionFetcher",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseCrashlytics",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebaseCrashlytics",
      exclude: [
        "run",
        "upload-symbols"
      ]
    ),
    .target(
      name: "FirebaseDatabaseTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseDatabase",
        "_FirebaseSharedSwift",
        "_leveldb"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_absl",
        "_grpc",
        "_grpcpp",
        "_leveldb",
        "_openssl_grpc"
      ],
      path: "Sources/FirebaseFirestore",
      exclude: [
        "Resources"
      ]
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFunctions",
        "_FirebaseMessagingInterop",
        "_FirebaseSharedSwift",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging",
      exclude: [
        "Resources"
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseCoreExtension",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport",
        "_Promises"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseStorage",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "_UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      exclude: [
        "Resources"
      ]
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_AppAuth.xcframework.zip",
      checksum: "a38c0b39970ec82c0cea0ba1d409df662d537cd5afe54c27a69d8fb3fd6645e0"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_AppCheckCore.xcframework.zip",
      checksum: "81a3189aa97ea39800a936edf4395bc32186a49dda44cd2b2000cd1b9b2c51ba"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FBLPromises.xcframework.zip",
      checksum: "21b5e29ce5e2fb2a193763dd831d3b777858d4e8ae9137bb7f26f97255fe61e0"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseABTesting.xcframework.zip",
      checksum: "a4b4f5ffb21d077aeb83ec790cf9039bf27b9f35e8bba5aa3a2bc5fcf2295bf6"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "f805a39c024931f1ab863e8932adb1b7d7da9b6093da06b1ac88eba7e3546a24"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "182f308cb7e7ab2429723e09f392a0271032a8952618854bc63c68fcfe1e576f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "25426cd9acf824692a0d2b9a4d3e4e1bacb7ec4ad677433f9478d714fe83bbaa"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e01ea44f99a833f743a55e79f3a50d8b1e7a0f5cba5b18f6429999695b8e65a2"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "0eca56ebd89cceeff397a9c2230c42e7fb5eee3fcea75d11847c1135713e6a78"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseAuth.xcframework.zip",
      checksum: "0fd3087910dbb634a958d001214ba66e153b189d826f0836421db1bcfcc6190e"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "d8a99e207fe495ba2a28aff8564d100f867f279efe78f6f8f5439bc6f7d13f13"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseCore.xcframework.zip",
      checksum: "6b75a4619cf6048d70507f8de3ef2a473053049d84b92bfcc08d408b8d6e2ba2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "37c93e5c3ad6ea3f90d69897d70ccf5a99b6a1b31fee8d59dd9830a4e534d3d2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "08e47fa3fdb2cb068378ece69dabe2ee411276f887fdd7c5078f7d18fabd9163"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "08882b635dee04d56133f6d2ff79a9856118a037d7e226535accfba77d231051"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseDatabase.xcframework.zip",
      checksum: "0a3332e35aa091c7480e0a13354623ee7745c1590310576a21cd1b305db0048a"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "b37868e2bea734cf05912692df54d80a2d89e5c1b15987bf34333200956149bb"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseFirestore.xcframework.zip",
      checksum: "27f74252c53686465b6614250b750cf565314328fbe81e8e76a6f6917071d92a"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "919ef687f7628e2dcdf7186c26d5ccae6f29ca4221bb6a3cb30ca94332492852"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseFunctions.xcframework.zip",
      checksum: "715fae6c4e691b3cbef308d44bd18408fa89fd894954f9fca13c7e8fe70ab812"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "5008224452e70fdaeb6e8c42b6bf77093050aa217a3c4e16e67be04cf43f06e9"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseInstallations.xcframework.zip",
      checksum: "5b98334fe00ace0e102a3a8afb23d33008e5b015fad5e397811b6094579b9000"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "d69618176d15a5c1f11011f8da5a0be1e76aacba42366df167a51c5ce6d09fe6"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseMessaging.xcframework.zip",
      checksum: "72bd1c6ed0ca605d9ba534cab5a33ec4aa6e6e568d6a38f11fae3dd2f685caf9"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e2c1e199a957b109a09cce0fb1157d0fd6b7f96d275701f05547f0990fb00e63"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebasePerformance.xcframework.zip",
      checksum: "ca17275a83a44bd3f830ef7af6269c1926a807cc6690817ec3089b80a2112ae6"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "3d7076c47e4e9b4ca35210fec33d274cbbe747f0ffede4e1081f5a7043341e51"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "f836e2451ec1ca62eb1e4d60b0babe226c6bb38c5f26c37d5b24ed06e6d7915a"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseSessions.xcframework.zip",
      checksum: "c9f93a7d322b6a71fa09fcf8027588123c81b115b1219e5e2640e8655de8dae2"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "f0f348578757dc22e3d12c5cd360dfa5eb3b7d33e30a5b52ba5843e5b0395a54"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_FirebaseStorage.xcframework.zip",
      checksum: "d8de04e9d86b0f47ada9f3d01beac6eacd79c87870b8d2b0bcd72c51a8138b2a"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_GTMAppAuth.xcframework.zip",
      checksum: "18221cef666f896442f335370941886897041b81b4f76a672e2969639e121a37"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "122763d6b94d4b3ddab83bb78b0fc57588794d484f6945f1bbb3917af869fed1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "14ef105ffcf815ade8169516eca61b5bdaa53163211f0f7794ae5b21ed4571cd"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "be5ad74f9db96031a712aa43c433b97e1f405f8b786d13c33f50b0fe13b6985a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "016f69280d2c8b159c3b40136a9b051a1580cb99cda57955ec03b539aaeab6c4"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_GoogleDataTransport.xcframework.zip",
      checksum: "088d45daeec7d014febb4fb0309fed43a07877a42631faf9bd46714ce1b665ba"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_GoogleMobileAds.xcframework.zip",
      checksum: "91d1ffc9bd99764fdfc0a93242c0ba9857762feb45988130c2b3d0bbde1a37da"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_GoogleSignIn.xcframework.zip",
      checksum: "85679e550fb76fef324c9c82fb84c5395d3fb0e8bfb879498150253bea20dab9"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_GoogleUtilities.xcframework.zip",
      checksum: "4b42096171d5193000438d8a75c83e1f4ee1759b05c9c7d68f5594de3b73c110"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_Promises.xcframework.zip",
      checksum: "3e603f73518531c275f015c97f7e0c38c222ddaa494918b2e71525fd351b799c"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_RecaptchaInterop.xcframework.zip",
      checksum: "13597a476924c1aca001dba66cb224dcf4a9c1d46ba3cc3c1bd06a1cf4eef378"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_SwiftProtobuf.xcframework.zip",
      checksum: "0f62ca6470e2a64d147b80156b4d693a84fe94641ed4a435f2affe9c7c4a39b3"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "9c4d991abd19ba897722180a23b7095a86d757a2711f50655af881716fb84bdd"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_absl.xcframework.zip",
      checksum: "cf6df3e009857843bfe5c5af0c961b4ec305d6520170206d63c8a6a914f098a5"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_grpc.xcframework.zip",
      checksum: "e60566fdca5d8662959e897a2cae25b9a4c771a8b23b7ba29cbaa60821322128"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_grpcpp.xcframework.zip",
      checksum: "d6d82111eeea46722e0b18b03603237245f35a36cfe2116738f324965562e276"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_leveldb.xcframework.zip",
      checksum: "e5d1ab5fc3a785814a26189dd4c7148077999b7a48f38972f457f36d73881bf6"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_nanopb.xcframework.zip",
      checksum: "09879c77edee0290578bd4db64375fb4ab17613f4ed10c3141cc5168cb941f93"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/yigegongjiang/firebasetest.git/releases/download/10.23.0/_openssl_grpc.xcframework.zip",
      checksum: "e82f661ce25871cbc8471a326c03c087c7a861b82ac19848298f92a25daee044"
    )
  ]
)
    