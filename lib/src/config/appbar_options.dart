import 'package:flutter/material.dart';

/// AppBar Configuration Options
/// Contains all styling, sizing, and behavior options for the app bar
class AppBarOptions {
  // ==================== SIZE OPTIONS ====================

  /// Height of the app bar
  final double height;

  /// Horizontal padding
  final double paddingHorizontal;

  /// Icon size
  final double iconSize;

  /// Spacing between menu toggle and title
  final double menuToggleTitleSpacing;

  /// Spacing before actions section
  final double actionsSpacing;

  /// Search bar width
  final double searchBarWidth;

  /// Search bar height
  final double searchBarHeight;

  /// Search bar border radius
  final double searchBarBorderRadius;

  /// Search icon size
  final double searchIconSize;

  /// Search bar padding (horizontal)
  final double searchBarPaddingHorizontal;

  /// Search bar padding (vertical)
  final double searchBarPaddingVertical;

  // ==================== COLOR OPTIONS ====================

  /// Background color of the app bar
  final Color? backgroundColor;

  /// Text color for title
  final Color? textColor;

  /// Icon color
  final Color? iconColor;

  /// Shadow styling
  final Color? shadowColor;
  final double? shadowOpacity;
  final double shadowBlurRadius;
  final Offset shadowOffset;

  // ==================== SEARCH OPTIONS ====================

  /// Search bar enabled
  final bool showSearch;

  /// Search bar styling
  final Color? searchBackgroundColor;
  final Color? searchTextColor;
  final Color? searchHintColor;
  final Color? searchIconColor;
  final double? searchHintOpacity;
  final double? searchIconOpacity;
  final String? searchHintText;

  // ==================== MENU TOGGLE OPTIONS ====================

  /// Menu toggle button
  final bool showMenuToggle;
  final IconData? menuToggleIcon;
  final IconData? menuToggleIconCollapsed;

  const AppBarOptions({
    // Size options
    this.height = 70,
    this.paddingHorizontal = 24,
    this.iconSize = 24,
    this.menuToggleTitleSpacing = 8,
    this.actionsSpacing = 16,
    this.searchBarWidth = 300,
    this.searchBarHeight = 40,
    this.searchBarBorderRadius = 20,
    this.searchIconSize = 20,
    this.searchBarPaddingHorizontal = 16,
    this.searchBarPaddingVertical = 10,

    // Colors
    this.backgroundColor,
    this.textColor,
    this.iconColor,

    // Shadow options
    this.shadowColor,
    this.shadowOpacity = 0.05,
    this.shadowBlurRadius = 8,
    this.shadowOffset = const Offset(0, 2),

    // Search options
    this.showSearch = true,
    this.searchBackgroundColor,
    this.searchTextColor,
    this.searchHintColor,
    this.searchIconColor,
    this.searchHintOpacity = 0.5,
    this.searchIconOpacity = 0.5,
    this.searchHintText = 'Search...',

    // Menu toggle options
    this.showMenuToggle = true,
    this.menuToggleIcon,
    this.menuToggleIconCollapsed,
  });

  /// Create a copy with modified properties
  AppBarOptions copyWith({
    double? height,
    double? paddingHorizontal,
    double? iconSize,
    double? menuToggleTitleSpacing,
    double? actionsSpacing,
    double? searchBarWidth,
    double? searchBarHeight,
    double? searchBarBorderRadius,
    double? searchIconSize,
    double? searchBarPaddingHorizontal,
    double? searchBarPaddingVertical,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    Color? shadowColor,
    double? shadowOpacity,
    double? shadowBlurRadius,
    Offset? shadowOffset,
    bool? showSearch,
    Color? searchBackgroundColor,
    Color? searchTextColor,
    Color? searchHintColor,
    Color? searchIconColor,
    double? searchHintOpacity,
    double? searchIconOpacity,
    String? searchHintText,
    bool? showMenuToggle,
    IconData? menuToggleIcon,
    IconData? menuToggleIconCollapsed,
  }) {
    return AppBarOptions(
      height: height ?? this.height,
      paddingHorizontal: paddingHorizontal ?? this.paddingHorizontal,
      iconSize: iconSize ?? this.iconSize,
      menuToggleTitleSpacing: menuToggleTitleSpacing ?? this.menuToggleTitleSpacing,
      actionsSpacing: actionsSpacing ?? this.actionsSpacing,
      searchBarWidth: searchBarWidth ?? this.searchBarWidth,
      searchBarHeight: searchBarHeight ?? this.searchBarHeight,
      searchBarBorderRadius: searchBarBorderRadius ?? this.searchBarBorderRadius,
      searchIconSize: searchIconSize ?? this.searchIconSize,
      searchBarPaddingHorizontal: searchBarPaddingHorizontal ?? this.searchBarPaddingHorizontal,
      searchBarPaddingVertical: searchBarPaddingVertical ?? this.searchBarPaddingVertical,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      iconColor: iconColor ?? this.iconColor,
      shadowColor: shadowColor ?? this.shadowColor,
      shadowOpacity: shadowOpacity ?? this.shadowOpacity,
      shadowBlurRadius: shadowBlurRadius ?? this.shadowBlurRadius,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      showSearch: showSearch ?? this.showSearch,
      searchBackgroundColor: searchBackgroundColor ?? this.searchBackgroundColor,
      searchTextColor: searchTextColor ?? this.searchTextColor,
      searchHintColor: searchHintColor ?? this.searchHintColor,
      searchIconColor: searchIconColor ?? this.searchIconColor,
      searchHintOpacity: searchHintOpacity ?? this.searchHintOpacity,
      searchIconOpacity: searchIconOpacity ?? this.searchIconOpacity,
      searchHintText: searchHintText ?? this.searchHintText,
      showMenuToggle: showMenuToggle ?? this.showMenuToggle,
      menuToggleIcon: menuToggleIcon ?? this.menuToggleIcon,
      menuToggleIconCollapsed: menuToggleIconCollapsed ?? this.menuToggleIconCollapsed,
    );
  }
}