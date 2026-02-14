import 'package:flutter/material.dart';

/// Breadcrumb Configuration Options
/// Contains styling and sizing options for breadcrumb navigation
class BreadcrumbOptions {
  // ==================== SIZE OPTIONS ====================

  /// Separator icon size
  final double separatorIconSize;

  /// Horizontal spacing around separator
  final double separatorSpacing;

  /// Padding horizontal
  final double paddingHorizontal;

  /// Padding vertical
  final double paddingVertical;

  // ==================== COLOR OPTIONS ====================

  /// Background color of breadcrumb bar
  final Color? backgroundColor;

  /// Active/current item color
  final Color? activeColor;

  /// Inactive items color
  final Color? inactiveColor;

  /// Inactive items opacity
  final double? inactiveOpacity;

  /// Divider/separator color
  final Color? dividerColor;

  /// Divider opacity
  final double? dividerOpacity;

  // ==================== STYLE OPTIONS ====================

  /// Separator icon
  final IconData separatorIcon;

  /// Custom padding (overrides paddingHorizontal/Vertical if provided)
  final EdgeInsets? padding;

  const BreadcrumbOptions({
    // Size options
    this.separatorIconSize = 16,
    this.separatorSpacing = 8,
    this.paddingHorizontal = 24,
    this.paddingVertical = 12,

    // Colors
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.inactiveOpacity = 0.6,
    this.dividerColor,
    this.dividerOpacity = 0.4,

    // Style
    this.separatorIcon = Icons.chevron_right,
    this.padding,
  });

  /// Get effective padding
  EdgeInsets getEffectivePadding() {
    return padding ?? EdgeInsets.symmetric(
      horizontal: paddingHorizontal,
      vertical: paddingVertical,
    );
  }

  /// Create a copy with modified properties
  BreadcrumbOptions copyWith({
    double? separatorIconSize,
    double? separatorSpacing,
    double? paddingHorizontal,
    double? paddingVertical,
    Color? backgroundColor,
    Color? activeColor,
    Color? inactiveColor,
    double? inactiveOpacity,
    Color? dividerColor,
    double? dividerOpacity,
    IconData? separatorIcon,
    EdgeInsets? padding,
  }) {
    return BreadcrumbOptions(
      separatorIconSize: separatorIconSize ?? this.separatorIconSize,
      separatorSpacing: separatorSpacing ?? this.separatorSpacing,
      paddingHorizontal: paddingHorizontal ?? this.paddingHorizontal,
      paddingVertical: paddingVertical ?? this.paddingVertical,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      inactiveOpacity: inactiveOpacity ?? this.inactiveOpacity,
      dividerColor: dividerColor ?? this.dividerColor,
      dividerOpacity: dividerOpacity ?? this.dividerOpacity,
      separatorIcon: separatorIcon ?? this.separatorIcon,
      padding: padding ?? this.padding,
    );
  }
}