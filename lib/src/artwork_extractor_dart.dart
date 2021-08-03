import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io' show Platform;

// FFI signature of the hello_world C function
typedef ArtworkExtractorNative = Void Function(Pointer<Utf8>, Pointer<Utf8>);
// Dart type definition for calling the C foreign function
typedef ArtworkExtractor = void Function(Pointer<Utf8>, Pointer<Utf8>);
