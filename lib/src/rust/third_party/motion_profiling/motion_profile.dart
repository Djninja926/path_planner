// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.3.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<AngularVelocity>>
abstract class AngularVelocity implements RustOpaqueInterface {}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<MotionCommand>>
abstract class MotionCommand implements RustOpaqueInterface {
  AngularVelocity get desiredAngular;

  Vector3F64 get desiredPose;

  Velocity get desiredVelocity;

  set desiredAngular(AngularVelocity desiredAngular);

  set desiredPose(Vector3F64 desiredPose);

  set desiredVelocity(Velocity desiredVelocity);
}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<Vector3 < f64 >>>
abstract class Vector3F64 implements RustOpaqueInterface {}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<Velocity>>
abstract class Velocity implements RustOpaqueInterface {}

abstract class MotionProfile {
  Future<MotionCommand?> get_({required Duration t});

  Future<Duration> getDuration();
}
