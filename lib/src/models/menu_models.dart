import 'package:flutter/material.dart';

/// Sidebar Menu Item Model
/// Represents a single menu item in the sidebar
class SidebarMenuItem {
  /// Unique identifier for this menu item
  final String id;

  /// Display title
  final String title;

  /// Icon to display
  final IconData icon;

  /// Callback when item is tapped
  final VoidCallback? onTap;

  /// Submenu items (if any)
  final List<SidebarSubItem>? subItems;

  /// Whether this item is currently selected
  final bool isSelected;

  /// Badge text to display (e.g., notification count)
  final String? badge;

  const SidebarMenuItem({
    required this.id,
    required this.title,
    required this.icon,
    this.onTap,
    this.subItems,
    this.isSelected = false,
    this.badge,
  });

  /// Create a copy with modified properties
  SidebarMenuItem copyWith({
    String? id,
    String? title,
    IconData? icon,
    VoidCallback? onTap,
    List<SidebarSubItem>? subItems,
    bool? isSelected,
    String? badge,
  }) {
    return SidebarMenuItem(
      id: id ?? this.id,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      onTap: onTap ?? this.onTap,
      subItems: subItems ?? this.subItems,
      isSelected: isSelected ?? this.isSelected,
      badge: badge ?? this.badge,
    );
  }
}

/// Sidebar Submenu Item Model
/// Represents a submenu item under a parent menu item
class SidebarSubItem {
  /// Display title
  final String title;

  /// Optional icon to display
  final IconData? icon;

  /// Callback when item is tapped
  final VoidCallback? onTap;

  /// Whether this item is currently selected
  final bool isSelected;

  const SidebarSubItem({
    required this.title,
    this.icon,
    this.onTap,
    this.isSelected = false,
  });

  /// Create a copy with modified properties
  SidebarSubItem copyWith({
    String? title,
    IconData? icon,
    VoidCallback? onTap,
    bool? isSelected,
  }) {
    return SidebarSubItem(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      onTap: onTap ?? this.onTap,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

/// Breadcrumb Item Model
/// Represents a single item in the breadcrumb trail
class BreadcrumbItem {
  /// Display label
  final String label;

  /// Callback when item is tapped
  final VoidCallback? onTap;

  const BreadcrumbItem({
    required this.label,
    this.onTap,
  });

  /// Create a copy with modified properties
  BreadcrumbItem copyWith({
    String? label,
    VoidCallback? onTap,
  }) {
    return BreadcrumbItem(
      label: label ?? this.label,
      onTap: onTap ?? this.onTap,
    );
  }
}