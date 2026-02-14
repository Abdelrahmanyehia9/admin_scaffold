import 'package:flutter/material.dart';

/// Sidebar Configuration Options
/// Contains all styling, sizing, and behavior options for the sidebar
class SidebarOptions {
  // ==================== SIZE OPTIONS ====================

  /// Width of the sidebar when expanded
  final double width;

  /// Width of the sidebar when collapsed (icons only)
  final double collapsedWidth;

  /// Header height
  final double headerHeight;

  /// Icon size for menu items
  final double iconSize;

  /// Icon size when collapsed
  final double iconSizeCollapsed;

  /// Icon size for submenu items
  final double submenuIconSize;

  /// Arrow icon size for expandable menus
  final double arrowIconSize;

  /// Menu item padding (horizontal)
  final double menuItemPaddingHorizontal;

  /// Menu item padding (vertical)
  final double menuItemPaddingVertical;

  /// Menu item margin (horizontal)
  final double menuItemMarginHorizontal;

  /// Menu item margin (vertical)
  final double menuItemMarginVertical;

  /// Submenu item padding (horizontal)
  final double submenuItemPaddingHorizontal;

  /// Submenu item padding (vertical)
  final double submenuItemPaddingVertical;

  /// Submenu item left margin
  final double submenuItemLeftMargin;

  /// Menu item border radius
  final double menuItemBorderRadius;

  /// Spacing between icon and text
  final double iconTextSpacing;

  /// Badge padding (horizontal)
  final double badgePaddingHorizontal;

  /// Badge padding (vertical)
  final double badgePaddingVertical;

  /// Badge border radius
  final double badgeBorderRadius;

  /// Collapse button padding
  final double collapseButtonPadding;

  /// ListView padding (vertical)
  final double listPaddingVertical;

  /// Header padding (horizontal)
  final double headerPaddingHorizontal;

  /// Header icon and title spacing
  final double headerIconTitleSpacing;

  // ==================== BEHAVIOR OPTIONS ====================

  /// Initial collapsed state
  final bool initiallyCollapsed;

  // ==================== COLOR OPTIONS ====================

  /// Background color of the sidebar
  final Color? backgroundColor;

  /// Icon colors
  final Color? iconColor;
  final Color? iconSelectedColor;
  final double? iconOpacity;

  /// Text colors
  final Color? textColor;
  final Color? textSelectedColor;
  final double? textOpacity;

  /// Selection styling
  final Color? selectedBackgroundColor;

  /// Divider styling
  final Color? dividerColor;
  final double? dividerOpacity;

  /// Badge styling
  final Color? badgeColor;
  final Color? badgeTextColor;

  /// Submenu styling
  final Color? submenuIconColor;
  final Color? submenuTextColor;
  final double? submenuIconOpacity;
  final double? submenuTextOpacity;

  // ==================== HEADER OPTIONS ====================

  /// Header (logo/brand area) styling
  final String? headerTitle;
  final IconData? headerIcon;
  final Color? headerIconColor;
  final TextStyle? headerTextStyle;
  final double? headerIconSize;
  final double? headerIconSizeCollapsed;

  const SidebarOptions({
    // Size options
    this.width = 250,
    this.collapsedWidth = 70,
    this.headerHeight = 70,
    this.iconSize = 22,
    this.iconSizeCollapsed = 28,
    this.submenuIconSize = 16,
    this.arrowIconSize = 20,
    this.menuItemPaddingHorizontal = 12,
    this.menuItemPaddingVertical = 12,
    this.menuItemMarginHorizontal = 8,
    this.menuItemMarginVertical = 2,
    this.submenuItemPaddingHorizontal = 12,
    this.submenuItemPaddingVertical = 10,
    this.submenuItemLeftMargin = 24,
    this.menuItemBorderRadius = 8,
    this.iconTextSpacing = 12,
    this.badgePaddingHorizontal = 8,
    this.badgePaddingVertical = 2,
    this.badgeBorderRadius = 12,
    this.collapseButtonPadding = 8,
    this.listPaddingVertical = 8,
    this.headerPaddingHorizontal = 16,
    this.headerIconTitleSpacing = 12,
    this.headerIconSize = 32,
    this.headerIconSizeCollapsed = 28,

    // Behavior
    this.initiallyCollapsed = false,

    // Icon options
    this.iconColor,
    this.iconSelectedColor,
    this.iconOpacity = 0.7,

    // Text options
    this.textColor,
    this.textSelectedColor,
    this.textOpacity = 1.0,

    // Selection options
    this.selectedBackgroundColor,

    // Background
    this.backgroundColor,

    // Divider options
    this.dividerColor,
    this.dividerOpacity = 0.1,

    // Badge options
    this.badgeColor,
    this.badgeTextColor,

    // Submenu options
    this.submenuIconColor,
    this.submenuTextColor,
    this.submenuIconOpacity = 0.5,
    this.submenuTextOpacity = 0.8,

    // Header options
    this.headerTitle = 'Admin Panel',
    this.headerIcon = Icons.admin_panel_settings,
    this.headerIconColor,
    this.headerTextStyle,
  });

  /// Create a copy with modified properties
  SidebarOptions copyWith({
    double? width,
    double? collapsedWidth,
    double? headerHeight,
    double? iconSize,
    double? iconSizeCollapsed,
    double? submenuIconSize,
    double? arrowIconSize,
    double? menuItemPaddingHorizontal,
    double? menuItemPaddingVertical,
    double? menuItemMarginHorizontal,
    double? menuItemMarginVertical,
    double? submenuItemPaddingHorizontal,
    double? submenuItemPaddingVertical,
    double? submenuItemLeftMargin,
    double? menuItemBorderRadius,
    double? iconTextSpacing,
    double? badgePaddingHorizontal,
    double? badgePaddingVertical,
    double? badgeBorderRadius,
    double? collapseButtonPadding,
    double? listPaddingVertical,
    double? headerPaddingHorizontal,
    double? headerIconTitleSpacing,
    double? headerIconSize,
    double? headerIconSizeCollapsed,
    bool? initiallyCollapsed,
    Color? backgroundColor,
    Color? iconColor,
    Color? iconSelectedColor,
    double? iconOpacity,
    Color? textColor,
    Color? textSelectedColor,
    double? textOpacity,
    Color? selectedBackgroundColor,
    Color? dividerColor,
    double? dividerOpacity,
    Color? badgeColor,
    Color? badgeTextColor,
    Color? submenuIconColor,
    Color? submenuTextColor,
    double? submenuIconOpacity,
    double? submenuTextOpacity,
    String? headerTitle,
    IconData? headerIcon,
    Color? headerIconColor,
    TextStyle? headerTextStyle,
  }) {
    return SidebarOptions(
      width: width ?? this.width,
      collapsedWidth: collapsedWidth ?? this.collapsedWidth,
      headerHeight: headerHeight ?? this.headerHeight,
      iconSize: iconSize ?? this.iconSize,
      iconSizeCollapsed: iconSizeCollapsed ?? this.iconSizeCollapsed,
      submenuIconSize: submenuIconSize ?? this.submenuIconSize,
      arrowIconSize: arrowIconSize ?? this.arrowIconSize,
      menuItemPaddingHorizontal: menuItemPaddingHorizontal ?? this.menuItemPaddingHorizontal,
      menuItemPaddingVertical: menuItemPaddingVertical ?? this.menuItemPaddingVertical,
      menuItemMarginHorizontal: menuItemMarginHorizontal ?? this.menuItemMarginHorizontal,
      menuItemMarginVertical: menuItemMarginVertical ?? this.menuItemMarginVertical,
      submenuItemPaddingHorizontal: submenuItemPaddingHorizontal ?? this.submenuItemPaddingHorizontal,
      submenuItemPaddingVertical: submenuItemPaddingVertical ?? this.submenuItemPaddingVertical,
      submenuItemLeftMargin: submenuItemLeftMargin ?? this.submenuItemLeftMargin,
      menuItemBorderRadius: menuItemBorderRadius ?? this.menuItemBorderRadius,
      iconTextSpacing: iconTextSpacing ?? this.iconTextSpacing,
      badgePaddingHorizontal: badgePaddingHorizontal ?? this.badgePaddingHorizontal,
      badgePaddingVertical: badgePaddingVertical ?? this.badgePaddingVertical,
      badgeBorderRadius: badgeBorderRadius ?? this.badgeBorderRadius,
      collapseButtonPadding: collapseButtonPadding ?? this.collapseButtonPadding,
      listPaddingVertical: listPaddingVertical ?? this.listPaddingVertical,
      headerPaddingHorizontal: headerPaddingHorizontal ?? this.headerPaddingHorizontal,
      headerIconTitleSpacing: headerIconTitleSpacing ?? this.headerIconTitleSpacing,
      headerIconSize: headerIconSize ?? this.headerIconSize,
      headerIconSizeCollapsed: headerIconSizeCollapsed ?? this.headerIconSizeCollapsed,
      initiallyCollapsed: initiallyCollapsed ?? this.initiallyCollapsed,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconColor: iconColor ?? this.iconColor,
      iconSelectedColor: iconSelectedColor ?? this.iconSelectedColor,
      iconOpacity: iconOpacity ?? this.iconOpacity,
      textColor: textColor ?? this.textColor,
      textSelectedColor: textSelectedColor ?? this.textSelectedColor,
      textOpacity: textOpacity ?? this.textOpacity,
      selectedBackgroundColor: selectedBackgroundColor ?? this.selectedBackgroundColor,
      dividerColor: dividerColor ?? this.dividerColor,
      dividerOpacity: dividerOpacity ?? this.dividerOpacity,
      badgeColor: badgeColor ?? this.badgeColor,
      badgeTextColor: badgeTextColor ?? this.badgeTextColor,
      submenuIconColor: submenuIconColor ?? this.submenuIconColor,
      submenuTextColor: submenuTextColor ?? this.submenuTextColor,
      submenuIconOpacity: submenuIconOpacity ?? this.submenuIconOpacity,
      submenuTextOpacity: submenuTextOpacity ?? this.submenuTextOpacity,
      headerTitle: headerTitle ?? this.headerTitle,
      headerIcon: headerIcon ?? this.headerIcon,
      headerIconColor: headerIconColor ?? this.headerIconColor,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
    );
  }
}