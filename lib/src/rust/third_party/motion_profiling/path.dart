// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.3.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These function are ignored because they are on traits that is not defined in current crate (put an empty `#[frb]` on it to unignore): `fmt`, `fmt`, `fmt`, `fmt`, `into`

class Command {
  final double t;
  final String name;

  const Command({
    required this.t,
    required this.name,
  });

  @override
  int get hashCode => t.hashCode ^ name.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Command &&
          runtimeType == other.runtimeType &&
          t == other.t &&
          name == other.name;
}

class Path {
  final double startSpeed;
  final double endSpeed;
  final List<PathSegment> segments;
  final List<Command> commands;

  const Path({
    required this.startSpeed,
    required this.endSpeed,
    required this.segments,
    required this.commands,
  });

  @override
  int get hashCode =>
      startSpeed.hashCode ^
      endSpeed.hashCode ^
      segments.hashCode ^
      commands.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Path &&
          runtimeType == other.runtimeType &&
          startSpeed == other.startSpeed &&
          endSpeed == other.endSpeed &&
          segments == other.segments &&
          commands == other.commands;
}

class PathSegment {
  final bool inverted;
  final bool stopEnd;
  final List<Point> path;

  const PathSegment({
    required this.inverted,
    required this.stopEnd,
    required this.path,
  });

  @override
  int get hashCode => inverted.hashCode ^ stopEnd.hashCode ^ path.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PathSegment &&
          runtimeType == other.runtimeType &&
          inverted == other.inverted &&
          stopEnd == other.stopEnd &&
          path == other.path;
}

class Point {
  final double x;
  final double y;

  const Point({
    required this.x,
    required this.y,
  });

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;
}
