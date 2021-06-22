import 'package:flutter/material.dart';
import 'bloc.dart';

/// Generic BLoC provider to share the bloc only to his child widget
class BlocProvider<T extends Bloc> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends Bloc>(BuildContext context) {
    BlocProvider<T> provider =
    context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider?.bloc;
  }
}

class _BlocProviderState<T> extends State<BlocProvider<Bloc>> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
