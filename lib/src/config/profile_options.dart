import 'package:flutter/material.dart';

/// Profile Menu Configuration Options
/// Contains styling and sizing options for user profile display and menu
class ProfileOptions {
  // ==================== SIZE OPTIONS ====================

  /// Avatar radius
  final double avatarRadius;

  /// Avatar icon size (when no image)
  final double avatarIconSize;

  /// Spacing between avatar and text
  final double avatarTextSpacing;

  /// Spacing between text and arrow
  final double textArrowSpacing;

  /// Arrow icon size
  final double arrowIconSize;

  /// Menu offset from profile (vertical)
  final double menuOffsetVertical;

  /// Menu border radius
  final double menuBorderRadius;

  /// Menu item icon size
  final double menuItemIconSize;

  /// Menu item icon-text spacing
  final double menuItemSpacing;

  // ==================== COLOR OPTIONS ====================

  /// Background color for avatar when no image provided
  final Color? avatarBackgroundColor;

  /// Text color for user name
  final Color? textColor;

  /// Email text color
  final Color? emailColor;

  /// Email opacity
  final double? emailOpacity;

  /// Arrow/dropdown icon color
  final Color? arrowColor;

  /// Arrow opacity
  final double? arrowOpacity;

  // ==================== MENU OPTIONS ====================

  /// Menu items
  final List<ProfileMenuItem>? customMenuItems;

  const ProfileOptions({
    // Size options
    this.avatarRadius = 18,
    this.avatarIconSize = 20,
    this.avatarTextSpacing = 8,
    this.textArrowSpacing = 4,
    this.arrowIconSize = 20,
    this.menuOffsetVertical = 50,
    this.menuBorderRadius = 12,
    this.menuItemIconSize = 20,
    this.menuItemSpacing = 12,

    // Colors
    this.avatarBackgroundColor,
    this.textColor,
    this.emailColor,
    this.emailOpacity = 0.6,
    this.arrowColor,
    this.arrowOpacity = 0.5,

    // Menu
    this.customMenuItems,
  });

  /// Create a copy with modified properties
  ProfileOptions copyWith({
    double? avatarRadius,
    double? avatarIconSize,
    double? avatarTextSpacing,
    double? textArrowSpacing,
    double? arrowIconSize,
    double? menuOffsetVertical,
    double? menuBorderRadius,
    double? menuItemIconSize,
    double? menuItemSpacing,
    Color? avatarBackgroundColor,
    Color? textColor,
    Color? emailColor,
    double? emailOpacity,
    Color? arrowColor,
    double? arrowOpacity,
    List<ProfileMenuItem>? customMenuItems,
  }) {
    return ProfileOptions(
      avatarRadius: avatarRadius ?? this.avatarRadius,
      avatarIconSize: avatarIconSize ?? this.avatarIconSize,
      avatarTextSpacing: avatarTextSpacing ?? this.avatarTextSpacing,
      textArrowSpacing: textArrowSpacing ?? this.textArrowSpacing,
      arrowIconSize: arrowIconSize ?? this.arrowIconSize,
      menuOffsetVertical: menuOffsetVertical ?? this.menuOffsetVertical,
      menuBorderRadius: menuBorderRadius ?? this.menuBorderRadius,
      menuItemIconSize: menuItemIconSize ?? this.menuItemIconSize,
      menuItemSpacing: menuItemSpacing ?? this.menuItemSpacing,
      avatarBackgroundColor: avatarBackgroundColor ?? this.avatarBackgroundColor,
      textColor: textColor ?? this.textColor,
      emailColor: emailColor ?? this.emailColor,
      emailOpacity: emailOpacity ?? this.emailOpacity,
      arrowColor: arrowColor ?? this.arrowColor,
      arrowOpacity: arrowOpacity ?? this.arrowOpacity,
      customMenuItems: customMenuItems ?? this.customMenuItems,
    );
  }
}

/// Profile Menu Item
class ProfileMenuItem {
  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? textColor;
  final bool isDivider;

  const ProfileMenuItem({
    required this.label,
    required this.icon,
    this.onTap,
    this.textColor,
    this.isDivider = false,
  });

  const ProfileMenuItem.divider()
      : label = '',
        icon = Icons.remove,
        onTap = null,
        textColor = null,
        isDivider = true;
}