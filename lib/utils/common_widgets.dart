import 'dart:async';

import 'package:cryptocurrency/utils/themes.dart';
import 'package:flutter/material.dart';

class UIHelperWidgets {
  static bool _isLoaderVisible = false;
  static void showLoader({@required BuildContext context}) {
    if (_isLoaderVisible) return;
    _isLoaderVisible = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: COLOR_BLACK.withOpacity(.45),
            child: Center(
              child: Container(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(CYAN_500),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void hideLoader({@required BuildContext context}) {
    if (_isLoaderVisible) Navigator.of(context, rootNavigator: true).pop();
    _isLoaderVisible = false;
  }

  static void showAndHideLoader({@required BuildContext context}) async {
    showLoader(context: context);
    await Future.delayed(Duration(seconds: 5));
    hideLoader(context: context);
  }
}
