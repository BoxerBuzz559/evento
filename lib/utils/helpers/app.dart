import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class AppHelper {
  static void getFutureSizeFromGlobalKey(
      GlobalKey key, Function(Size size) callback) {
    Future.microtask(() {
      Size? size = getSizeFromContext(key.currentContext);
      if (size != null) {
        callback(size);
      }
    });
  }

  static Size? getSizeFromContext(BuildContext? context) {
    RenderBox rb = context?.findRenderObject() as RenderBox;
    return rb.size;
  }

  static Offset getOffsetFromContext(BuildContext? context, [Offset? offset]) {
    RenderBox rb = context?.findRenderObject() as RenderBox;
    return rb.localToGlobal(offset ?? Offset.zero);
  }

  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static bool get isMouseConnected =>
      RendererBinding.instance!.mouseTracker.mouseIsConnected;

  static void unFocus() {
    WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus();
  }

  static void changeStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }
}