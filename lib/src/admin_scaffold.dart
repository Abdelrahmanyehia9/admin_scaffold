import 'package:admin_scaffold/admin_scaffold_package.dart';
import 'package:flutter/material.dart';
/// Professional Custom Scaffold for Flutter Admin Web Application
///
/// A comprehensive, reusable admin panel scaffold with:
/// - Collapsible sidebar with multi-level menus
/// - Customizable app bar with search
/// - Breadcrumb navigation
/// - Notification system
/// - User profile menu
///
/// All styling and sizing is configurable through dedicated Options classes
/// No external dependencies - fully reusable across projects
class AdminScaffold extends StatefulWidget {
  /// Main content body
  final Widget body;

  /// Page title displayed in app bar
  final String title;

  /// Menu items for the sidebar
  final List<SidebarMenuItem> menuItems;

  /// Breadcrumb trail (optional)
  final List<BreadcrumbItem>? breadcrumbs;

  /// Floating action button (optional)
  final Widget? floatingActionButton;

  /// Leading widget in app bar (optional)
  final Widget? leadingAppBar;

  /// Additional action widgets in app bar (optional)
  final List<Widget>? appBarActions;

  /// Search callback
  final Function(String)? onSearch;

  /// Notification tap callback
  final VoidCallback? onNotificationTap;

  /// Notification count
  final int notificationCount;

  /// User information
  final String? userEmail;
  final String? userName;
  final String? userAvatar;

  /// User profile callbacks
  final VoidCallback? onProfileTap;
  final VoidCallback? onLogout;

  /// Sidebar configuration
  final SidebarOptions sidebarOptions;

  /// AppBar configuration
  final AppBarOptions appBarOptions;

  /// Notification configuration
  final NotificationOptions notificationOptions;

  /// Profile menu configuration
  final ProfileOptions profileOptions;

  /// Breadcrumb configuration
  final BreadcrumbOptions breadcrumbOptions;

  const AdminScaffold({
    super.key,
    required this.body,
    required this.title,
    required this.menuItems,
    this.breadcrumbs,
    this.floatingActionButton,
    this.leadingAppBar,
    this.appBarActions,
    this.onSearch,
    this.onNotificationTap,
    this.notificationCount = 0,
    this.userEmail,
    this.userName,
    this.userAvatar,
    this.onProfileTap,
    this.onLogout,
    this.sidebarOptions = const SidebarOptions(),
    this.appBarOptions = const AppBarOptions(),
    this.notificationOptions = const NotificationOptions(),
    this.profileOptions = const ProfileOptions(),
    this.breadcrumbOptions = const BreadcrumbOptions(),
  });

  @override
  State<AdminScaffold> createState() => _AdminScaffoldState();
}

class _AdminScaffoldState extends State<AdminScaffold> {
  late bool _isSidebarCollapsed;
  final TextEditingController _searchController = TextEditingController();
  String? _expandedMenuId;

  @override
  void initState() {
    super.initState();
    _isSidebarCollapsed = widget.sidebarOptions.initiallyCollapsed;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarCollapsed = !_isSidebarCollapsed;
    });
  }

  void _toggleSubmenu(String menuId) {
    setState(() {
      _expandedMenuId = _expandedMenuId == menuId ? null : menuId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sidebarWidth = _isSidebarCollapsed
        ? widget.sidebarOptions.collapsedWidth
        : widget.sidebarOptions.width;

    return Scaffold(
      body: Row(
        children: [
          _buildSidebar(theme, sidebarWidth),
          Expanded(
            child: Column(
              children: [
                _buildAppBar(theme),
                if (widget.breadcrumbs != null && widget.breadcrumbs!.isNotEmpty)
                  _buildBreadcrumbs(theme),
                Expanded(
                  child: Container(
                    color: theme.colorScheme.surface,
                    child: widget.body,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }

  // ==================== SIDEBAR ====================

  Widget _buildSidebar(ThemeData theme, double width) {
    final options = widget.sidebarOptions;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: width,
      decoration: BoxDecoration(
        color: options.backgroundColor ?? theme.colorScheme.surfaceContainerHighest,
      ),
      child: Column(
        children: [
          options.customHeader ??  _buildSidebarHeader(theme),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: options.listPaddingVertical),
              children: widget.menuItems.map((item) {
                return _buildMenuItem(item, theme);
              }).toList(),
            ),
          ),
          _buildCollapseButton(theme),
        ],
      ),
    );
  }

  Widget _buildSidebarHeader(ThemeData theme) {
    final options = widget.sidebarOptions;
    final dividerColor = options.dividerColor ?? theme.dividerColor;
    final iconColor = options.headerIconColor ?? theme.colorScheme.primary;

    return Container(
      height: options.headerHeight,
      padding: EdgeInsets.symmetric(horizontal: options.headerPaddingHorizontal),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: dividerColor.withAppOpacity(options.dividerOpacity ?? 0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          if (options.headerIcon != null)
            Icon(
              options.headerIcon,
              color: iconColor,
              size: _isSidebarCollapsed
                  ? options.headerIconSizeCollapsed
                  : options.headerIconSize,
            ),
          if (!_isSidebarCollapsed && options.headerTitle != null) ...[
            SizedBox(width: options.headerIconTitleSpacing),
            Expanded(
              child: Text(
                options.headerTitle!,
                style: options.headerTextStyle ??
                    theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: iconColor,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMenuItem(SidebarMenuItem item, ThemeData theme) {
    final options = widget.sidebarOptions;
    final hasSubmenu = item.subItems != null && item.subItems!.isNotEmpty;
    final isExpanded = _expandedMenuId == item.id;
    final isSelected = item.isSelected;

    final iconColor = isSelected
        ? (options.iconSelectedColor ?? theme.colorScheme.primary)
        : (options.iconColor ?? theme.colorScheme.onSurface);

    final textColor = isSelected
        ? (options.textSelectedColor ?? theme.colorScheme.primary)
        : (options.textColor ?? theme.colorScheme.onSurface);

    final bgColor = isSelected
        ? (options.selectedBackgroundColor ?? theme.colorScheme.primaryContainer)
        : Colors.transparent;

    final badgeColor = options.badgeColor ?? theme.colorScheme.error;
    final badgeTextColor = options.badgeTextColor ?? theme.colorScheme.onError;

    final submenuArrowColor = options.submenuIconColor ??
        theme.colorScheme.onSurface.withAppOpacity(options.submenuIconOpacity ?? 0.5);

    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (hasSubmenu) {
                _toggleSubmenu(item.id);
              } else {
                item.onTap?.call();
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: options.menuItemMarginHorizontal,
                vertical: options.menuItemMarginVertical,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: options.menuItemPaddingHorizontal,
                vertical: options.menuItemPaddingVertical,
              ),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(options.menuItemBorderRadius),
              ),
              child: Row(
                children: [
                  Icon(
                    item.icon,
                    color: iconColor,
                    size: options.iconSize,
                  ),
                  if (!_isSidebarCollapsed) ...[
                    SizedBox(width: options.iconTextSpacing),
                    Expanded(
                      child: Text(
                        item.title,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: textColor,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                    if (item.badge != null)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: options.badgePaddingHorizontal,
                          vertical: options.badgePaddingVertical,
                        ),
                        decoration: BoxDecoration(
                          color: badgeColor,
                          borderRadius: BorderRadius.circular(options.badgeBorderRadius),
                        ),
                        child: Text(
                          item.badge!,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: badgeTextColor,
                          ),
                        ),
                      ),
                    if (hasSubmenu)
                      Icon(
                        isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                        color: submenuArrowColor,
                        size: options.arrowIconSize,
                      ),
                  ],
                ],
              ),
            ),
          ),
        ),
        if (hasSubmenu && isExpanded && !_isSidebarCollapsed)
          ...item.subItems!.map((subItem) {
            return _buildSubMenuItem(subItem, theme);
          }),
      ],
    );
  }

  Widget _buildSubMenuItem(SidebarSubItem subItem, ThemeData theme) {
    final options = widget.sidebarOptions;

    final iconColor = subItem.isSelected
        ? (options.iconSelectedColor ?? theme.colorScheme.primary)
        : (options.submenuIconColor ??
        theme.colorScheme.onSurface.withAppOpacity(options.submenuIconOpacity ?? 0.5));

    final textColor = subItem.isSelected
        ? (options.textSelectedColor ?? theme.colorScheme.primary)
        : (options.submenuTextColor ??
        theme.colorScheme.onSurface.withAppOpacity(options.submenuTextOpacity ?? 0.8));

    final bgColor = subItem.isSelected
        ? (options.selectedBackgroundColor ??
        theme.colorScheme.primaryContainer.withAppOpacity(0.5))
        : Colors.transparent;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: subItem.onTap,
        child: Container(
          margin: EdgeInsets.only(
            left: options.submenuItemLeftMargin,
            right: options.menuItemMarginHorizontal,
            top: options.menuItemMarginVertical,
            bottom: options.menuItemMarginVertical,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: options.submenuItemPaddingHorizontal,
            vertical: options.submenuItemPaddingVertical,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(options.menuItemBorderRadius),
          ),
          child: Row(
            children: [
              Icon(
                subItem.icon ?? Icons.circle,
                color: iconColor,
                size: options.submenuIconSize,
              ),
              SizedBox(width: options.iconTextSpacing),
              Expanded(
                child: Text(
                  subItem.title,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: textColor,
                    fontWeight: subItem.isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCollapseButton(ThemeData theme) {
    final options = widget.sidebarOptions;
    final dividerColor = options.dividerColor ?? theme.dividerColor;
    final iconColor = options.iconColor ??
        theme.colorScheme.onSurface.withAppOpacity(options.iconOpacity ?? 0.7);

    return Container(
      padding: EdgeInsets.all(options.collapseButtonPadding),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: dividerColor.withAppOpacity(options.dividerOpacity ?? 0.1),
          ),
        ),
      ),
      child: IconButton(
        icon: Icon(
          _isSidebarCollapsed ? Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
          color: iconColor,
        ),
        onPressed: _toggleSidebar,
        tooltip: _isSidebarCollapsed ? 'Expand' : 'Collapse',
      ),
    );
  }

  // ==================== APP BAR ====================

  Widget _buildAppBar(ThemeData theme) {
    final options = widget.appBarOptions;
    final appBarBgColor = options.backgroundColor ?? theme.colorScheme.surface;
    final shadowColor = options.shadowColor ?? Colors.black;

    return Container(
      height: options.height,
      decoration: BoxDecoration(
        color: appBarBgColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor.withAppOpacity(options.shadowOpacity ?? 0.05),
            blurRadius: options.shadowBlurRadius,
            offset: options.shadowOffset,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: options.paddingHorizontal),
        child: Row(
          children: [
            if (options.showMenuToggle) ...[
              IconButton(
                icon: Icon(
                  _isSidebarCollapsed
                      ? (options.menuToggleIconCollapsed ?? options.menuToggleIcon ?? Icons.menu)
                      : (options.menuToggleIcon ?? Icons.menu_open),
                  color: options.iconColor ?? theme.colorScheme.onSurface,
                  size: options.iconSize,
                ),
                onPressed: _toggleSidebar,
                tooltip: _isSidebarCollapsed ? 'Open Menu' : 'Close Menu',
              ),
              SizedBox(width: options.menuToggleTitleSpacing),
            ],
            if (widget.leadingAppBar != null) widget.leadingAppBar!,
            Text(
              widget.title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: options.textColor ?? theme.colorScheme.onSurface,
              ),
            ),
            const Spacer(),
            if (options.showSearch) _buildSearchBar(theme),
            SizedBox(width: options.actionsSpacing),
            if (widget.appBarActions != null) ...widget.appBarActions!,
            _buildNotificationButton(theme),
            SizedBox(width: options.actionsSpacing),
            _buildProfileMenu(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    final options = widget.appBarOptions;
    final searchBgColor = options.searchBackgroundColor ??
        theme.colorScheme.surfaceContainerHighest;
    final searchTextColor = options.searchTextColor ?? theme.textTheme.bodyMedium?.color;
    final searchHintColor = options.searchHintColor ??
        theme.colorScheme.onSurface.withAppOpacity(options.searchHintOpacity ?? 0.5);
    final searchIconColor = options.searchIconColor ??
        theme.colorScheme.onSurface.withAppOpacity(options.searchIconOpacity ?? 0.5);

    return Container(
      width: options.searchBarWidth,
      height: options.searchBarHeight,
      decoration: BoxDecoration(
        color: searchBgColor,
        borderRadius: BorderRadius.circular(options.searchBarBorderRadius),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: widget.onSearch,
        decoration: InputDecoration(
          hintText: options.searchHintText,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: searchHintColor,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: searchIconColor,
            size: options.searchIconSize,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: options.searchBarPaddingHorizontal,
            vertical: options.searchBarPaddingVertical,
          ),
        ),
        style: theme.textTheme.bodyMedium?.copyWith(
          color: searchTextColor,
        ),
      ),
    );
  }

  // ==================== NOTIFICATION ====================

  Widget _buildNotificationButton(ThemeData theme) {
    final options = widget.notificationOptions;
    final appBarOptions = widget.appBarOptions;
    final iconColor = appBarOptions.iconColor ?? theme.colorScheme.onSurface;
    final badgeColor = options.badgeColor ?? theme.colorScheme.error;
    final badgeTextColor = options.badgeTextColor ?? theme.colorScheme.onError;

    return Stack(
      children: [
        IconButton(
          icon: Icon(
            options.icon,
            color: iconColor,
            size: options.iconSize,
          ),
          onPressed: widget.onNotificationTap,
          tooltip: options.tooltipText,
        ),
        if (widget.notificationCount > 0)
          Positioned(
            right: options.badgePositionRight,
            top: options.badgePositionTop,
            child: Container(
              padding: EdgeInsets.all(options.badgePadding),
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(
                minWidth: options.badgeMinWidth,
                minHeight: options.badgeMinHeight,
              ),
              child: Text(
                widget.notificationCount > 99 ? '99+' : widget.notificationCount.toString(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: badgeTextColor,
                  fontSize: options.badgeFontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  // ==================== PROFILE MENU ====================

  Widget _buildProfileMenu(ThemeData theme) {
    final options = widget.profileOptions;
    final textColor = options.textColor ?? theme.textTheme.bodyMedium?.color;
    final emailColor = options.emailColor ??
        theme.colorScheme.onSurface.withAppOpacity(options.emailOpacity ?? 0.6);
    final arrowColor = options.arrowColor ??
        theme.colorScheme.onSurface.withAppOpacity(options.arrowOpacity ?? 0.5);

    return PopupMenuButton<String>(
      offset: Offset(0, options.menuOffsetVertical),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(options.menuBorderRadius),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: options.avatarRadius,
            backgroundColor: options.avatarBackgroundColor,
            backgroundImage: widget.userAvatar != null
                ? NetworkImage(widget.userAvatar!)
                : null,
            child: widget.userAvatar == null
                ? Icon(
              Icons.person,
              size: options.avatarIconSize,
              color: theme.colorScheme.onPrimaryContainer,
            )
                : null,
          ),
          SizedBox(width: options.avatarTextSpacing),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.userName ?? 'User',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              if (widget.userEmail != null)
                Text(
                  widget.userEmail!,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: emailColor,
                  ),
                ),
            ],
          ),
          SizedBox(width: options.textArrowSpacing),
          Icon(
            Icons.keyboard_arrow_down,
            color: arrowColor,
            size: options.arrowIconSize,
          ),
        ],
      ),
      itemBuilder: (context) => _buildProfileMenuItems(theme),
    );
  }

  List<PopupMenuEntry<String>> _buildProfileMenuItems(ThemeData theme) {
    final customItems = widget.profileOptions.customMenuItems;
    final options = widget.profileOptions;

    if (customItems != null && customItems.isNotEmpty) {
      return customItems.map<PopupMenuEntry<String>>((item) {
        if (item.isDivider) {
          return const PopupMenuDivider();
        }
        return PopupMenuItem<String>(
          onTap: item.onTap,
          child: Row(
            children: [
              Icon(item.icon, color: item.textColor, size: options.menuItemIconSize),
              SizedBox(width: options.menuItemSpacing),
              Text(
                item.label,
                style: theme.textTheme.bodyMedium?.copyWith(color: item.textColor),
              ),
            ],
          ),
        );
      }).toList();
    }

    // Default menu items
    return [
      PopupMenuItem(
        value: 'profile',
        onTap: widget.onProfileTap,
        child: Row(
          children: [
            Icon(Icons.person_outline, size: options.menuItemIconSize),
            SizedBox(width: options.menuItemSpacing),
            Text('Profile', style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
      PopupMenuItem(
        value: 'settings',
        child: Row(
          children: [
            Icon(Icons.settings_outlined, size: options.menuItemIconSize),
            SizedBox(width: options.menuItemSpacing),
            Text('Settings', style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
      const PopupMenuDivider(),
      PopupMenuItem(
        value: 'logout',
        onTap: widget.onLogout,
        child: Row(
          children: [
            Icon(Icons.logout, color: theme.colorScheme.error, size: options.menuItemIconSize),
            SizedBox(width: options.menuItemSpacing),
            Text(
              'Logout',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    ];
  }
  // ==================== BREADCRUMBS ====================

  Widget _buildBreadcrumbs(ThemeData theme) {
    final options = widget.breadcrumbOptions;
    final bgColor = options.backgroundColor ?? theme.colorScheme.surface;
    final dividerColor = options.dividerColor ?? theme.dividerColor;
    final activeColor = options.activeColor ?? theme.colorScheme.primary;
    final inactiveColor = options.inactiveColor ??
        theme.colorScheme.onSurface.withAppOpacity(options.inactiveOpacity ?? 0.6);
    final separatorColor =
    theme.colorScheme.onSurface.withAppOpacity(options.dividerOpacity ?? 0.4);

    return Container(
      padding: options.getEffectivePadding(),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(
          bottom: BorderSide(
            color: dividerColor.withAppOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          for (int i = 0; i < widget.breadcrumbs!.length; i++) ...[
            if (i > 0)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: options.separatorSpacing),
                child: Icon(
                  options.separatorIcon,
                  size: options.separatorIconSize,
                  color: separatorColor,
                ),
              ),
            InkWell(
              onTap: widget.breadcrumbs![i].onTap,
              child: Text(
                widget.breadcrumbs![i].label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: i == widget.breadcrumbs!.length - 1 ? activeColor : inactiveColor,
                  fontWeight:
                  i == widget.breadcrumbs!.length - 1 ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}