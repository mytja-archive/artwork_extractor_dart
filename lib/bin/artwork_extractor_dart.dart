import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'dart:io' show Platform;

// FFI signature of the hello_world C function
typedef ArtworkExtractorNative = ffi.Void Function(
    ffi.Pointer<Utf8>, ffi.Pointer<Utf8>);
// Dart type definition for calling the C foreign function
typedef ArtworkExtractor = void Function(ffi.Pointer<Utf8>, ffi.Pointer<Utf8>);
