import 'package:flutter/material.dart';

class CustomSliverScrollPhysics extends ScrollPhysics {
  final int autoScrollOffset;

  CustomSliverScrollPhysics({ScrollPhysics? parent, required this.autoScrollOffset})
      : super(parent: parent);

  double? _previousPosition;

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (value < position.pixels && position.pixels <= position.minScrollExtent) {
      return value - position.pixels;
    } else if (position.maxScrollExtent <= position.pixels && position.pixels < value) {
      return value - position.pixels;
    } else if (value < position.minScrollExtent && position.minScrollExtent < position.pixels) {
      return value - position.minScrollExtent;
    } else if (position.pixels < position.maxScrollExtent && position.maxScrollExtent < value) {
      return value - position.maxScrollExtent;
    }
    return 0.0;
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    _previousPosition ??= position.pixels;

    if (offset < 0) {
      if (position.pixels - offset <= autoScrollOffset) {
        _previousPosition = position.pixels;
        return -position.pixels + autoScrollOffset;
      }
    } else {
      if (position.maxScrollExtent - position.pixels <= autoScrollOffset) {
        _previousPosition = position.pixels;
        return position.maxScrollExtent - position.pixels + autoScrollOffset;
      }
    }

    if (_previousPosition != null) {
      double distance = (_previousPosition! - position.pixels).abs();
      if (distance < autoScrollOffset) {
        return _previousPosition! - position.pixels;
      }
      _previousPosition = null;
    }

    return super.applyPhysicsToUserOffset(position, offset);
  }
}
