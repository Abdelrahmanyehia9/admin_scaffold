import 'package:flutter/material.dart';

/// Notification Configuration Options
/// Contains styling and sizing options for notification button and badge
class NotificationOptions {
  // ==================== SIZE OPTIONS ====================

  /// Icon size
  final double iconSize;

  /// Badge minimum width
  final double badgeMinWidth;

  /// Badge minimum height
  final double badgeMinHeight;

  /// Badge padding
  final double badgePadding;

  /// Badge font size
  final double badgeFontSize;

  /// Badge position from right
  final double badgePositionRight;

  /// Badge position from top
  final double badgePositionTop;

  // ==================== COLOR OPTIONS ====================

  /// Badge color for notification count
  final Color? badgeColor;

  /// Text color for badge count
  final Color? badgeTextColor;

  // ==================== OTHER OPTIONS ====================

  /// Icon for notification button
  final IconData icon;

  /// Tooltip text
  final String? tooltipText;

  const NotificationOptions({
    // Size options
    this.iconSize = 24,
    this.badgeMinWidth = 16,
    this.badgeMinHeight = 16,
    this.badgePadding = 4,
    this.badgeFontSize = 10,
    this.badgePositionRight = 8,
    this.badgePositionTop = 8,

    // Colors
    this.badgeColor,
    this.badgeTextColor,

    // Other
    this.icon = Icons.notifications_outlined,
    this.tooltipText = 'Notifications',
  });

  /// Create a copy with modified properties
  NotificationOptions copyWith({
    double? iconSize,
    double? badgeMinWidth,
    double? badgeMinHeight,
    double? badgePadding,
    double? badgeFontSize,
    double? badgePositionRight,
    double? badgePositionTop,
    Color? badgeColor,
    Color? badgeTextColor,
    IconData? icon,
    String? tooltipText,
  }) {
    return NotificationOptions(
      iconSize: iconSize ?? this.iconSize,
      badgeMinWidth: badgeMinWidth ?? this.badgeMinWidth,
      badgeMinHeight: badgeMinHeight ?? this.badgeMinHeight,
      badgePadding: badgePadding ?? this.badgePadding,
      badgeFontSize: badgeFontSize ?? this.badgeFontSize,
      badgePositionRight: badgePositionRight ?? this.badgePositionRight,
      badgePositionTop: badgePositionTop ?? this.badgePositionTop,
      badgeColor: badgeColor ?? this.badgeColor,
      badgeTextColor: badgeTextColor ?? this.badgeTextColor,
      icon: icon ?? this.icon,
      tooltipText: tooltipText ?? this.tooltipText,
    );
  }
}