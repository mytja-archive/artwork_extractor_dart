A simple library to extract & save artwork of a 🎵 music/audio file.

This library is using a [artwork-extractor](https://github.com/alexmercerind/artwork-extractor) library by [alexmercerind](https://github.com/alexmercerind). It is super simple to use, but requires a dll file, that needs to be built from artwork-extractor library. It uses Dart FFI, which means, that it can run in plain dart applications aswell as in Flutter applications.

## Usage

A simple usage example:

```dart
import 'package:artwork_extractor_dart/artwork_extractor_dart.dart'
    as artworkextractor;

void main() {
  artworkextractor.write('test.ogg', 'test.png');
}
```
