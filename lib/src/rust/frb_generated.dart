// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.3.0.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/simple.dart';
import 'dart:async';
import 'dart:convert';
import 'frb_generated.dart';
import 'frb_generated.io.dart'
    if (dart.library.js_interop) 'frb_generated.web.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'third_party/motion_profiling/path.dart';

/// Main entrypoint of the Rust API
class RustLib extends BaseEntrypoint<RustLibApi, RustLibApiImpl, RustLibWire> {
  @internal
  static final instance = RustLib._();

  RustLib._();

  /// Initialize flutter_rust_bridge
  static Future<void> init({
    RustLibApi? api,
    BaseHandler? handler,
    ExternalLibrary? externalLibrary,
  }) async {
    await instance.initImpl(
      api: api,
      handler: handler,
      externalLibrary: externalLibrary,
    );
  }

  /// Initialize flutter_rust_bridge in mock mode.
  /// No libraries for FFI are loaded.
  static void initMock({
    required RustLibApi api,
  }) {
    instance.initMockImpl(
      api: api,
    );
  }

  /// Dispose flutter_rust_bridge
  ///
  /// The call to this function is optional, since flutter_rust_bridge (and everything else)
  /// is automatically disposed when the app stops.
  static void dispose() => instance.disposeImpl();

  @override
  ApiImplConstructor<RustLibApiImpl, RustLibWire> get apiImplConstructor =>
      RustLibApiImpl.new;

  @override
  WireConstructor<RustLibWire> get wireConstructor =>
      RustLibWire.fromExternalLibrary;

  @override
  Future<void> executeRustInitializers() async {
    await api.crateApiSimpleInitApp();
  }

  @override
  ExternalLibraryLoaderConfig get defaultExternalLibraryLoaderConfig =>
      kDefaultExternalLibraryLoaderConfig;

  @override
  String get codegenVersion => '2.3.0';

  @override
  int get rustContentHash => 1867646436;

  static const kDefaultExternalLibraryLoaderConfig =
      ExternalLibraryLoaderConfig(
    stem: 'rust_lib_al_planner',
    ioDirectory: 'rust/target/release/',
    webPrefix: 'pkg/',
  );
}

abstract class RustLibApi extends BaseApi {
  BigInt crateApiSimpleGetDuration({required Path path});

  Pose crateApiSimpleGetPose({required Path path, required double t});

  Future<void> crateApiSimpleInitApp();
}

class RustLibApiImpl extends RustLibApiImplPlatform implements RustLibApi {
  RustLibApiImpl({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @override
  BigInt crateApiSimpleGetDuration({required Path path}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_box_autoadd_path(path, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 1)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_U128,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleGetDurationConstMeta,
      argValues: [path],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleGetDurationConstMeta => const TaskConstMeta(
        debugName: "get_duration",
        argNames: ["path"],
      );

  @override
  Pose crateApiSimpleGetPose({required Path path, required double t}) {
    return handler.executeSync(SyncTask(
      callFfi: () {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        sse_encode_box_autoadd_path(path, serializer);
        sse_encode_f_64(t, serializer);
        return pdeCallFfi(generalizedFrbRustBinding, serializer, funcId: 2)!;
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_pose,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleGetPoseConstMeta,
      argValues: [path, t],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleGetPoseConstMeta => const TaskConstMeta(
        debugName: "get_pose",
        argNames: ["path", "t"],
      );

  @override
  Future<void> crateApiSimpleInitApp() {
    return handler.executeNormal(NormalTask(
      callFfi: (port_) {
        final serializer = SseSerializer(generalizedFrbRustBinding);
        pdeCallFfi(generalizedFrbRustBinding, serializer,
            funcId: 3, port: port_);
      },
      codec: SseCodec(
        decodeSuccessData: sse_decode_unit,
        decodeErrorData: null,
      ),
      constMeta: kCrateApiSimpleInitAppConstMeta,
      argValues: [],
      apiImpl: this,
    ));
  }

  TaskConstMeta get kCrateApiSimpleInitAppConstMeta => const TaskConstMeta(
        debugName: "init_app",
        argNames: [],
      );

  @protected
  String dco_decode_String(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as String;
  }

  @protected
  BigInt dco_decode_U128(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return BigInt.parse(raw);
  }

  @protected
  bool dco_decode_bool(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as bool;
  }

  @protected
  Path dco_decode_box_autoadd_path(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return dco_decode_path(raw);
  }

  @protected
  Command dco_decode_command(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Command(
      t: dco_decode_f_64(arr[0]),
      name: dco_decode_String(arr[1]),
    );
  }

  @protected
  Constraints dco_decode_constraints(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Constraints(
      velocity: dco_decode_f_64(arr[0]),
      accel: dco_decode_f_64(arr[1]),
    );
  }

  @protected
  double dco_decode_f_64(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as double;
  }

  @protected
  List<Command> dco_decode_list_command(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return (raw as List<dynamic>).map(dco_decode_command).toList();
  }

  @protected
  List<PathSegment> dco_decode_list_path_segment(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return (raw as List<dynamic>).map(dco_decode_path_segment).toList();
  }

  @protected
  List<Point> dco_decode_list_point(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return (raw as List<dynamic>).map(dco_decode_point).toList();
  }

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as Uint8List;
  }

  @protected
  Path dco_decode_path(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 4)
      throw Exception('unexpected arr length: expect 4 but see ${arr.length}');
    return Path(
      startSpeed: dco_decode_f_64(arr[0]),
      endSpeed: dco_decode_f_64(arr[1]),
      segments: dco_decode_list_path_segment(arr[2]),
      commands: dco_decode_list_command(arr[3]),
    );
  }

  @protected
  PathSegment dco_decode_path_segment(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 4)
      throw Exception('unexpected arr length: expect 4 but see ${arr.length}');
    return PathSegment(
      inverted: dco_decode_bool(arr[0]),
      stopEnd: dco_decode_bool(arr[1]),
      path: dco_decode_list_point(arr[2]),
      constraints: dco_decode_constraints(arr[3]),
    );
  }

  @protected
  Point dco_decode_point(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Point(
      x: dco_decode_f_64(arr[0]),
      y: dco_decode_f_64(arr[1]),
    );
  }

  @protected
  Pose dco_decode_pose(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    final arr = raw as List<dynamic>;
    if (arr.length != 3)
      throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return Pose(
      x: dco_decode_f_64(arr[0]),
      y: dco_decode_f_64(arr[1]),
      theta: dco_decode_f_64(arr[2]),
    );
  }

  @protected
  int dco_decode_u_8(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return raw as int;
  }

  @protected
  void dco_decode_unit(dynamic raw) {
    // Codec=Dco (DartCObject based), see doc to use other codecs
    return;
  }

  @protected
  String sse_decode_String(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_list_prim_u_8_strict(deserializer);
    return utf8.decoder.convert(inner);
  }

  @protected
  BigInt sse_decode_U128(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var inner = sse_decode_String(deserializer);
    return BigInt.parse(inner);
  }

  @protected
  bool sse_decode_bool(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8() != 0;
  }

  @protected
  Path sse_decode_box_autoadd_path(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return (sse_decode_path(deserializer));
  }

  @protected
  Command sse_decode_command(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_t = sse_decode_f_64(deserializer);
    var var_name = sse_decode_String(deserializer);
    return Command(t: var_t, name: var_name);
  }

  @protected
  Constraints sse_decode_constraints(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_velocity = sse_decode_f_64(deserializer);
    var var_accel = sse_decode_f_64(deserializer);
    return Constraints(velocity: var_velocity, accel: var_accel);
  }

  @protected
  double sse_decode_f_64(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getFloat64();
  }

  @protected
  List<Command> sse_decode_list_command(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var len_ = sse_decode_i_32(deserializer);
    var ans_ = <Command>[];
    for (var idx_ = 0; idx_ < len_; ++idx_) {
      ans_.add(sse_decode_command(deserializer));
    }
    return ans_;
  }

  @protected
  List<PathSegment> sse_decode_list_path_segment(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var len_ = sse_decode_i_32(deserializer);
    var ans_ = <PathSegment>[];
    for (var idx_ = 0; idx_ < len_; ++idx_) {
      ans_.add(sse_decode_path_segment(deserializer));
    }
    return ans_;
  }

  @protected
  List<Point> sse_decode_list_point(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs

    var len_ = sse_decode_i_32(deserializer);
    var ans_ = <Point>[];
    for (var idx_ = 0; idx_ < len_; ++idx_) {
      ans_.add(sse_decode_point(deserializer));
    }
    return ans_;
  }

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var len_ = sse_decode_i_32(deserializer);
    return deserializer.buffer.getUint8List(len_);
  }

  @protected
  Path sse_decode_path(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_startSpeed = sse_decode_f_64(deserializer);
    var var_endSpeed = sse_decode_f_64(deserializer);
    var var_segments = sse_decode_list_path_segment(deserializer);
    var var_commands = sse_decode_list_command(deserializer);
    return Path(
        startSpeed: var_startSpeed,
        endSpeed: var_endSpeed,
        segments: var_segments,
        commands: var_commands);
  }

  @protected
  PathSegment sse_decode_path_segment(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_inverted = sse_decode_bool(deserializer);
    var var_stopEnd = sse_decode_bool(deserializer);
    var var_path = sse_decode_list_point(deserializer);
    var var_constraints = sse_decode_constraints(deserializer);
    return PathSegment(
        inverted: var_inverted,
        stopEnd: var_stopEnd,
        path: var_path,
        constraints: var_constraints);
  }

  @protected
  Point sse_decode_point(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_x = sse_decode_f_64(deserializer);
    var var_y = sse_decode_f_64(deserializer);
    return Point(x: var_x, y: var_y);
  }

  @protected
  Pose sse_decode_pose(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    var var_x = sse_decode_f_64(deserializer);
    var var_y = sse_decode_f_64(deserializer);
    var var_theta = sse_decode_f_64(deserializer);
    return Pose(x: var_x, y: var_y, theta: var_theta);
  }

  @protected
  int sse_decode_u_8(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getUint8();
  }

  @protected
  void sse_decode_unit(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  int sse_decode_i_32(SseDeserializer deserializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    return deserializer.buffer.getInt32();
  }

  @protected
  void sse_encode_String(String self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_list_prim_u_8_strict(utf8.encoder.convert(self), serializer);
  }

  @protected
  void sse_encode_U128(BigInt self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_String(self.toString(), serializer);
  }

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self ? 1 : 0);
  }

  @protected
  void sse_encode_box_autoadd_path(Path self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_path(self, serializer);
  }

  @protected
  void sse_encode_command(Command self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_f_64(self.t, serializer);
    sse_encode_String(self.name, serializer);
  }

  @protected
  void sse_encode_constraints(Constraints self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_f_64(self.velocity, serializer);
    sse_encode_f_64(self.accel, serializer);
  }

  @protected
  void sse_encode_f_64(double self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putFloat64(self);
  }

  @protected
  void sse_encode_list_command(List<Command> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    for (final item in self) {
      sse_encode_command(item, serializer);
    }
  }

  @protected
  void sse_encode_list_path_segment(
      List<PathSegment> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    for (final item in self) {
      sse_encode_path_segment(item, serializer);
    }
  }

  @protected
  void sse_encode_list_point(List<Point> self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    for (final item in self) {
      sse_encode_point(item, serializer);
    }
  }

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_i_32(self.length, serializer);
    serializer.buffer.putUint8List(self);
  }

  @protected
  void sse_encode_path(Path self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_f_64(self.startSpeed, serializer);
    sse_encode_f_64(self.endSpeed, serializer);
    sse_encode_list_path_segment(self.segments, serializer);
    sse_encode_list_command(self.commands, serializer);
  }

  @protected
  void sse_encode_path_segment(PathSegment self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_bool(self.inverted, serializer);
    sse_encode_bool(self.stopEnd, serializer);
    sse_encode_list_point(self.path, serializer);
    sse_encode_constraints(self.constraints, serializer);
  }

  @protected
  void sse_encode_point(Point self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_f_64(self.x, serializer);
    sse_encode_f_64(self.y, serializer);
  }

  @protected
  void sse_encode_pose(Pose self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    sse_encode_f_64(self.x, serializer);
    sse_encode_f_64(self.y, serializer);
    sse_encode_f_64(self.theta, serializer);
  }

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putUint8(self);
  }

  @protected
  void sse_encode_unit(void self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
  }

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer) {
    // Codec=Sse (Serialization based), see doc to use other codecs
    serializer.buffer.putInt32(self);
  }
}
