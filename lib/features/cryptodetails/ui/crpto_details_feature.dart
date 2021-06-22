import 'package:bloc_clean_framework/bloc/bloc.dart';
import 'package:cryptocurrency/features/cryptodetails/bloc/crypto_details_bloc.dart';
import 'package:cryptocurrency/features/cryptodetails/ui/crypto_details_presenter.dart';
import 'package:flutter/material.dart';

class CryptoDetailsFeature extends StatelessWidget {
  final String cryptoId;

  const CryptoDetailsFeature({Key key, this.cryptoId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocInheritedProvider(
      bloc: CryptoDetailsBloc(
          cryptoId:cryptoId,
      ),
      child: CryptoDetailsPresenter(),
    );
  }
}
