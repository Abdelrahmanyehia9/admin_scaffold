import 'dart:ui';

extension ColorExt on Color{
  Color withAppOpacity(double opacity){
    opacity= opacity.clamp(0, 1) ;
    return withValues(alpha: opacity) ;
  }
  }