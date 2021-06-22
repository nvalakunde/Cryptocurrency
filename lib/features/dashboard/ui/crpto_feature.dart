import 'package:bloc_clean_framework/bloc/bloc.dart';
import 'package:cryptocurrency/features/dashboard/bloc/crypto_bloc.dart';
import 'package:cryptocurrency/features/dashboard/ui/crypto_presenter.dart';
import 'package:flutter/material.dart';

class CryptoDashBoardFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocInheritedProvider(
      bloc: CryptoBloc(
      ),
      child: CryptoDashBoardPresenter(),
    );
  }
}
