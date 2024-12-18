// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.3.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

// Static analysis wrongly picks the IO variant, thus ignore this
// ignore_for_file: argument_type_not_assignable

import 'api/simple.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_web.dart';
import 'third_party/motion_profiling/path.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  BigInt dco_decode_U128(dynamic raw);

  @protected
  bool dco_decode_bool(dynamic raw);

  @protected
  Path dco_decode_box_autoadd_path(dynamic raw);

  @protected
  Command dco_decode_command(dynamic raw);

  @protected
  Constraints dco_decode_constraints(dynamic raw);

  @protected
  double dco_decode_f_64(dynamic raw);

  @protected
  List<Command> dco_decode_list_command(dynamic raw);

  @protected
  List<PathSegment> dco_decode_list_path_segment(dynamic raw);

  @protected
  List<Point> dco_decode_list_point(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  Path dco_decode_path(dynamic raw);

  @protected
  PathSegment dco_decode_path_segment(dynamic raw);

  @protected
  Point dco_decode_point(dynamic raw);

  @protected
  Pose dco_decode_pose(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  BigInt sse_decode_U128(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  Path sse_decode_box_autoadd_path(SseDeserializer deserializer);

  @protected
  Command sse_decode_command(SseDeserializer deserializer);

  @protected
  Constraints sse_decode_constraints(SseDeserializer deserializer);

  @protected
  double sse_decode_f_64(SseDeserializer deserializer);

  @protected
  List<Command> sse_decode_list_command(SseDeserializer deserializer);

  @protected
  List<PathSegment> sse_decode_list_path_segment(SseDeserializer deserializer);

  @protected
  List<Point> sse_decode_list_point(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  Path sse_decode_path(SseDeserializer deserializer);

  @protected
  PathSegment sse_decode_path_segment(SseDeserializer deserializer);

  @protected
  Point sse_decode_point(SseDeserializer deserializer);

  @protected
  Pose sse_decode_pose(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_U128(BigInt self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_path(Path self, SseSerializer serializer);

  @protected
  void sse_encode_command(Command self, SseSerializer serializer);

  @protected
  void sse_encode_constraints(Constraints self, SseSerializer serializer);

  @protected
  void sse_encode_f_64(double self, SseSerializer serializer);

  @protected
  void sse_encode_list_command(List<Command> self, SseSerializer serializer);

  @protected
  void sse_encode_list_path_segment(
      List<PathSegment> self, SseSerializer serializer);

  @protected
  void sse_encode_list_point(List<Point> self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_path(Path self, SseSerializer serializer);

  @protected
  void sse_encode_path_segment(PathSegment self, SseSerializer serializer);

  @protected
  void sse_encode_point(Point self, SseSerializer serializer);

  @protected
  void sse_encode_pose(Pose self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire implements BaseWire {
  RustLibWire.fromExternalLibrary(ExternalLibrary lib);
}

@JS('wasm_bindgen')
external RustLibWasmModule get wasmModule;

@JS() 
@anonymous
extension type RustLibWasmModule._(JSObject _) implements JSObject {}
