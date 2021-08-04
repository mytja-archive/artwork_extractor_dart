library artwork_extractor_dart;

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'dart:io' show Platform, Process;
import 'src/artwork_extractor_dart.dart';

void write(String mediaPath, String outputPath) {
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

Future<String> writeExecutable(String mediaPath, String outputPath,
    {bool folowMime = false}) async {
  List<String> args = [mediaPath, outputPath];
  if (folowMime) {
    args.add('--folow-mime');
  }
  var result;
  try {
    result = await Process.run('artwork_extractor', args);
  } catch (_) {
    result = await Process.run('artwork_extractor-bin', args);
  }
  return result.stdout;
}
