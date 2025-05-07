//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

//import UIKit
//
//extension BottomSheetController {
//    public struct Configuration {
//        public static func standard(content: Content,
//                                    detents: [Detent] = [.collapsed, .expanded],
//                                    largestUndimmedDetent: Detent = .collapsed) -> Configuration {}
//
//        public static func panel(content: Content,
//                                 detents: [Detent] = [.collapsed, .expanded],
//                                 anchor: BottomSheetAnchorEdge,
//                                 preferredWidth: CGFloat? = nil) -> Configuration {}
//
//        public indirect enum Content {
//            case split(header: Content, main: Content)
//            case view(UIView)
//            case viewController(UIViewController)
//        }
//
//        public enum Detent {
//            case collapsed(SizingMethod? = nil)
//            case partial(SizingMethod? = nil)
//            case expanded(SizingMethod? = nil)
//
//            public enum SizingMethod {
//                case fixed(CGFloat)
//                case heightResolver(HeightResolver)
//            }
//        }
//
//        public typealias HeightResolver = (ContentHeightResolutionContext) -> CGFloat
//    }
//
//}
