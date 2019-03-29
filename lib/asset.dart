import 'dart:async';

import 'package:flutter/services.dart';
import 'package:multi_image_picker/metadata.dart';
import 'package:multi_image_picker/picker.dart';

class Asset {
  /// The resource identifier
  String _identifier;

  /// The resource file name
  String _name;

  /// Original image width
  int _originalWidth;

  /// Original image height
  int _originalHeight;

  /// Holds the thumb binary data after it is requested
  ByteData _thumbData;

  /// Holds the original image data after it is requested
  ByteData _imageData;

  Asset(
    this._identifier,
    this._name,
    this._originalWidth,
    this._originalHeight,
  );

  /// The BinaryChannel name this asset is listening on.
  String get _channel {
    return 'multi_image_picker/image/$_identifier';
  }

  String get _thumbChannel => '$_channel.thumb';

  String get _originalChannel => '$_channel.original';

  /// Returns the thumb data if it was loaded
  ByteData get thumbData {
    return _thumbData;
  }

  /// Returns the original image width
  int get originalWidth {
    return _originalWidth;
  }

  /// Returns the original image height
  int get originalHeight {
    return _originalHeight;
  }

  /// Returns true if the image is landscape
  bool get isLandscape {
    return _originalWidth > _originalHeight;
  }

  /// Returns true if the image is Portrait
  bool get isPortrait {
    return _originalWidth < _originalHeight;
  }

  /// Returns the original image data
  ByteData get imageData {
    return _imageData;
  }

  /// Returns the image identifier
  String get identifier {
    return _identifier;
  }

  /// Returns the image name
  String get name {
    return _name;
  }

  /// Releases the thumb data.
  ///
  /// You should consider cleaning up the thumb data
  /// once you don't need it in order to free some
  /// memory.
  void releaseThumb() {
    _thumbData = null;
  }

  /// Releases the original image data.
  ///
  /// You should consider cleaning up the original data
  /// once you don't need it in order to free some
  /// memory.
  void releaseOriginal() {
    _imageData = null;
  }

  /// Releases both the thumb and original image data.
  ///
  /// You should consider cleaning up the data
  /// once you don't need it in order to free some
  /// memory.
  void release() {
    releaseThumb();
    releaseOriginal();
  }

  /// Requests a thumbnail for the [Asset] with give [width] and [hegiht].
  ///
  /// The method returns a Future with the [ByteData] for the thumb,
  /// as well as storing it in the _thumbData property which can be requested
  /// later again, without need to call this method again.
  ///
  /// You can also pass the optional parameter [quality] to reduce the quality
  /// and the size of the returned image if needed. The value should be between
  /// 0 and 100. By default it set to 100 (max quality).
  ///
  /// Once you don't need this thumb data it is a good practice to release it,
  /// by calling releaseThumb() method.
  Future<dynamic> requestThumbnail(int width, int height,
      {int quality = 100}) async {
    assert(width != null);
    assert(height != null);

    if (width != null && width < 0) {
      throw new ArgumentError.value(width, 'width cannot be negative');
    }

    if (height != null && height < 0) {
      throw new ArgumentError.value(height, 'height cannot be negative');
    }

    if (quality < 0 || quality > 100) {
      throw new ArgumentError.value(
          quality, 'quality should be in range 0-100');
    }

    Completer completer = new Completer();
    BinaryMessages.setMessageHandler(_thumbChannel, (ByteData message) {
      _thumbData = message;
      completer.complete(message);
      BinaryMessages.setMessageHandler(_thumbChannel, null);
    });

    MultiImagePicker.requestThumbnail(_identifier, width, height, quality);
    return completer.future;
  }

  /// Requests the original image for that asset.
  ///
  /// You can also pass the optional parameter [quality] to reduce the quality
  /// and the size of the returned image if needed. The value should be between
  /// 0 and 100. By default it set to 100 (max quality).
  ///
  /// The method returns a Future with the [ByteData] for the image,
  /// as well as storing it in the _imageData property which can be requested
  /// later again, without need to call this method again.
  ///
  /// Once you don't need this data it is a good practice to release it,
  /// by calling releaseOriginal() method.
  Future<dynamic> requestOriginal({int quality = 100}) {
    if (quality < 0 || quality > 100) {
      throw new ArgumentError.value(
          quality, 'quality should be in range 0-100');
    }

    Completer completer = new Completer();
    BinaryMessages.setMessageHandler(_originalChannel, (ByteData message) {
      _imageData = message;
      completer.complete(message);
      BinaryMessages.setMessageHandler(_originalChannel, null);
    });

    MultiImagePicker.requestOriginal(_identifier, quality);
    return completer.future;
  }

  /// Requests the original image meta data
  Future<Metadata> requestMetadata() {
    return MultiImagePicker.requestMetadata(_identifier);
  }
}
