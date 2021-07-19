//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import UIKit

class BottomSheetPresentationController: UIPresentationController {

    init(presentedViewController: UIViewController, presenting: UIViewController?, preferredSheetHeight: CGFloat) {
        self.preferredSheetHeight = preferredSheetHeight
        super.init(presentedViewController: presentedViewController, presenting: presenting)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else {
            return .zero
        }

        var frame: CGRect = .zero
        frame.size.width = containerView.frame.width
        frame.size.height = min(preferredSheetHeight, containerView.frame.size.height - 40)
        frame.origin.y = containerView.frame.height - frame.height
        return frame
    }

    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else {
            return
        }

        containerView.insertSubview(dimmingView, at: 0)

        NSLayoutConstraint.activate([
            dimmingView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            dimmingView.topAnchor.constraint(equalTo: containerView.topAnchor),
            dimmingView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])

        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 1.0
            })
        } else {
            dimmingView.alpha = 1.0
        }
    }

    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 0.0
            return
        }

        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        })
    }

    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }

    @objc func handleDimmingViewTap(recognizer: UITapGestureRecognizer) {
      presentingViewController.dismiss(animated: true)
    }

    private lazy var dimmingView: DimmingView = {
        var dimmingView = DimmingView(type: .black)
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.alpha = 0.0

        let tapGestureRecognizer = UITapGestureRecognizer(
          target: self,
          action: #selector(handleDimmingViewTap(recognizer:)))
        dimmingView.addGestureRecognizer(tapGestureRecognizer)
        return dimmingView
    }()

    private let preferredSheetHeight: CGFloat
}
