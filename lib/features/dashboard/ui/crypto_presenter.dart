import 'package:bloc_clean_framework/bloc/bloc_inherited_provider.dart';
import 'package:bloc_clean_framework/ui/presenter.dart';
import 'package:cryptocurrency/features/cryptodetails/ui/crpto_details_feature.dart';
import 'package:cryptocurrency/features/dashboard/bloc/crypto_bloc.dart';
import 'package:cryptocurrency/features/dashboard/models/crypto_view_model.dart';
import 'package:cryptocurrency/features/dashboard/ui/crypto_dashboard_screen.dart';
import 'package:cryptocurrency/features/dashboard/ui/crypto_dashboard_shimmer.dart';
import 'package:cryptocurrency/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CryptoDashBoardPresenter
    extends Presenter<CryptoBloc, CryptoListViewModel> {
  CryptoDashBoardPresenter();
  @override
  Widget buildScreen(
    BuildContext context,
    CryptoBloc bloc,
    CryptoListViewModel viewModel,
  ) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      UIHelperWidgets.hideLoader(context: context);
    });
    return CryptoDashboardScreen(
      viewModel: viewModel,
      onTapItem: (CryptoViewModel cryptoViewModelViewModel) =>
          _onTapItem(context, cryptoViewModelViewModel),
    );
  }

  _onTapItem(
    BuildContext context,
    CryptoViewModel cryptoViewModelViewModel,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CryptoDetailsFeature(
          cryptoId: cryptoViewModelViewModel.cryptoId.toString(),
        ),
      ),
    );
  }

  @override
  void sendViewModelRequest(BuildContext context, CryptoBloc bloc) {
    bloc.getCryptos.launch();
  }

  Widget buildLoadingScreen(BuildContext context) {
    return EventShimmerWidget();
  }

  @override
  Stream<CryptoListViewModel> getViewModelStream(
      BuildContext context, CryptoBloc bloc) {
    return bloc.cryptoCurrencyResponsePipe.receive;
  }

  @override
  Widget buildErrorScreen(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      UIHelperWidgets.hideLoader(context: context);
    });
    var bloc = BlocInheritedProvider.of<CryptoBloc>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text("No Data Available"),
          ),
          Container(
            child: InkWell(
                onTap: () {
                  bloc.getCryptos.launch();
                },
                child: Text("Please Try Again")),
          ),
        ],
      ),
    );
  }
}
