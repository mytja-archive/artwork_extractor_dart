library artwork_extractor_dart;

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io' show Platform;
import 'bin/artwork_extractor_dart.dart';

void exportPicture(String mediaPath, String outputPath) {
  // Open the dynamic library
  var libraryPath = 'artwork_extractor.so';
  if (Platform.isWindows) {
    libraryPath = 'artwork_extractor.dll';
  } else {
    throw Exception("There aren't ports for this library on this platform yet");
  }

  final dylib = DynamicLibrary.open(libraryPath);

  // Look up the C function 'hello_world'
  final hello = dylib
      .lookupFunction<ArtworkExtractorNative, ArtworkExtractor>('writeToFile');
  final path = mediaPath.toNativeUtf8();
  final out = outputPath.toNativeUtf8();
  hello(path, out);
}
