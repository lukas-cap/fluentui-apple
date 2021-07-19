//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import UIKit

class BottomSheetExpansionInteractionController: NSObject {
    private var transitionContext: UIViewControllerContextTransitioning?
    private let isPresentation: Bool
    private let collapsedOffset: CGFloat

    init(isPresentation: Bool, collapsedOffset: CGFloat) {
        self.isPresentation = isPresentation
        self.collapsedOffset = collapsedOffset
        super.init()
    }

    private struct Constants {
        struct Spring {
            // Spring used in slow swipes - no oscillation
            static let defaultDampingRatio: CGFloat = 1.0

            // Spring used in fast swipes - slight oscillation
            static let oscillatingDampingRatio: CGFloat = 0.8

            // Swipes over this velocity get slight spring oscillation
            static let flickVelocityThreshold: CGFloat = 800

            static let maxInitialVelocity: CGFloat = 40.0
            static let animationDuration: TimeInterval = 0.4

            // Off-screen overflow that can be partially revealed during spring oscillation or rubber banding (dragging the sheet beyond limits)
            static let overflowHeight: CGFloat = 50.0
        }
    }
}

extension BottomSheetExpansionInteractionController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Constants.Spring.animationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let key: UITransitionContextViewControllerKey = isPresentation ? .to : .from

        guard let controller = transitionContext.viewController(forKey: key) else {
            return
        }

        if isPresentation {
            transitionContext.containerView.addSubview(controller.view)
        }

        let presentedFrame = transitionContext.finalFrame(for: controller)
        print(transitionContext.initialFrame(for: controller))

        var collapsedFrame = presentedFrame
        collapsedFrame.origin.y = transitionContext.containerView.frame.height - collapsedOffset

        let initialFrame = isPresentation ? collapsedFrame : presentedFrame
        let targetFrame = isPresentation ? presentedFrame : collapsedFrame

        controller.view.frame = initialFrame
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration) {
            controller.view.frame = targetFrame
        } completion: { finished in
            if !self.isPresentation {
                // Todo: Re-add sheet to BottomSheetController
            }
            transitionContext.completeTransition(finished)
        }
    }
}
