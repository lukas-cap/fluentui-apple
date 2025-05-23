//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

#if canImport(FluentUI_common)
import FluentUI_common
#endif
import SwiftUI
import UIKit

public extension Avatar {

    /// Sets the accessibility label for the Avatar.
    /// - Parameter accessibilityLabel: Accessibility label string.
    /// - Returns: The modified Avatar with the property set.
    func accessibilityLabel(_ accessibilityLabel: String?) -> Avatar {
        state.accessibilityLabel = accessibilityLabel
        return self
    }

    /// Sets a custom background color for the Avatar.
    /// The ring color inherit this color if not set explicitly to a different color.
    /// - Parameter backgroundColor: Background color.
    /// - Returns: The modified Avatar with the property set.
    func backgroundColor(_ backgroundColor: UIColor?) -> Avatar {
        state.backgroundColor = backgroundColor
        return self
    }

    /// The custom foreground color.
    /// This modifier allows customizing the initials text color or the default image tint color.
    /// - Parameter foregroundColor: Foreground color.
    /// - Returns: The modified Avatar with the property set.
    func foregroundColor(_ foregroundColor: UIColor?) -> Avatar {
        state.foregroundColor = foregroundColor
        return self
    }

    /// Turns iPad Pointer interaction on/off.
    /// - Parameter hasPointerInteraction: Boolean value to set the property.
    /// - Returns: The modified Avatar with the property set.
    func hasPointerInteraction(_ hasPointerInteraction: Bool) -> Avatar {
        state.hasPointerInteraction = hasPointerInteraction
        return self
    }

    /// Whether the gap between the ring and the avatar content exists.
    /// - Parameter hasRingInnerGap: Boolean value to set the property.
    /// - Returns: The modified Avatar with the property set.
    func hasRingInnerGap(_ hasRingInnerGap: Bool) -> Avatar {
        state.hasRingInnerGap = hasRingInnerGap
        return self
    }

    /// Whether the avatar should draw an outline using a background color.
    /// - Parameter hasBackgroundOutline: Boolean value to set the property.
    /// - Returns: The modified Avatar with the property set.
    func hasBackgroundOutline(_ hasBackgroundOutline: Bool) -> Avatar {
        state.hasBackgroundOutline = hasBackgroundOutline
        return self
    }

    /// An override for the template icon to use when there is no set image or name.
    /// - Parameter defaultImage: Image to be used as the Avatar's default image.
    /// - Returns: The modified Avatar with the property set.
    func defaultImage(_ defaultImage: UIImage?) -> Avatar {
        state.defaultImage = defaultImage
        return self
    }

    /// The image used to fill the ring as a custom color.
    /// - Parameter imageBasedRingColor: Image to be used as the ring fill pattern.
    /// - Returns: The modified Avatar with the property set.
    func imageBasedRingColor(_ imageBasedRingColor: UIImage?) -> Avatar {
        state.imageBasedRingColor = imageBasedRingColor
        return self
    }

    /// Defines whether the avatar state transitions are animated or not. Animations are enabled by default.
    /// - Parameter isAnimated: Boolean value to set the property.
    /// - Returns: The modified Avatar with the property set.
    func isAnimated(_ isAnimated: Bool) -> Avatar {
        state.isAnimated = isAnimated
        return self
    }

    /// Whether the presence status displays its "Out of office" or standard image.
    /// - Parameter isOutOfOffice: Boolean value to set the property.
    /// - Returns: The modified Avatar with the property set.
    func isOutOfOffice(_ isOutOfOffice: Bool) -> Avatar {
        state.isOutOfOffice = isOutOfOffice
        return self
    }

    /// Displays an outer ring for the avatar if set to true.
    /// The group style does not support rings.
    /// - Parameter isRingVisible: Boolean value to set the property.
    /// - Returns: The modified Avatar with the property set.
    func isRingVisible(_ isRingVisible: Bool) -> Avatar {
        state.isRingVisible = isRingVisible
        return self
    }

    /// Sets the transparency of the avatar elements (inner and outer ring gaps, presence, activity icon outline).
    /// Uses the solid default background color if set to false.
    /// - Parameter isTransparent: Boolean value to set the property.
    /// - Returns: The modified Avatar with the property set.
    func isTransparent(_ isTransparent: Bool) -> Avatar {
        state.isTransparent = isTransparent
        return self
    }

    /// Defines the presence displayed by the Avatar.
    /// Image displayed depends on the value of the isOutOfOffice property.
    /// Presence is not displayed in the xsmall size.
    /// - Parameter presence: The MSFAvatarPresence enum value.
    /// - Returns: The modified Avatar with the property set.
    func presence(_ presence: MSFAvatarPresence) -> Avatar {
        state.presence = presence
        return self
    }

    /// Defines the activity style and image displayed by the Avatar.
    /// Activity is only displayed in `size56` and `size40`.
    /// If the Avatar style is not `.default` style, and if uses the default image, the activity will not be displayed.
    /// - Parameter activityStyle: The `MSFAvatarActivityStyle` enum value.
    /// - Parameter activityImage: The optional image to use for activity.
    /// - Returns: The modified Avatar with the property set.
    func activity(_ activityStyle: MSFAvatarActivityStyle, _ activityImage: UIImage?) -> Avatar {
        state.activityStyle = activityStyle
        state.activityImage = activityImage
        return self
    }

    /// Overrides the default ring color.
    /// - Parameter ringColor: The color used to set the ring color.
    /// - Returns: The modified Avatar with the property set.
    func ringColor(_ ringColor: UIColor?) -> Avatar {
        state.ringColor = ringColor
        return self
    }
}
