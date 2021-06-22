import 'package:bloc_clean_framework/bloc/bloc_inherited_provider.dart';
import 'package:bloc_clean_framework/ui/presenter.dart';
import 'package:cryptocurrency/features/cryptodetails/bloc/crypto_details_bloc.dart';
import 'package:cryptocurrency/features/cryptodetails/models/crypto_details_view_model.dart';
import 'package:cryptocurrency/features/cryptodetails/ui/crypto_details_screen.dart';
import 'package:cryptocurrency/features/dashboard/ui/crypto_dashboard_shimmer.dart';
import 'package:cryptocurrency/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CryptoDetailsPresenter extends Presenter<CryptoDetailsBloc, CryptoDetailsViewModel> {
  CryptoDetailsPresenter();
  @override
  Widget buildScreen(
      BuildContext context,
      CryptoDetailsBloc bloc,
      CryptoDetailsViewModel viewModel,
      ) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      UIHelperWidgets.hideLoader(context: context);

    });
    return CryptoDetailsScreen(
      viewModel: viewModel,
    );
  }
  @override
  void sendViewModelRequest(BuildContext context, CryptoDetailsBloc bloc) {
    bloc.getCryptoInfo.launch();
  }
  Widget buildLoadingScreen(BuildContext context) {
    return EventShimmerWidget();
  }
  @override
  Stream<CryptoDetailsViewModel> getViewModelStream(
      BuildContext context, CryptoDetailsBloc bloc) {
    return bloc.cryptoCurrencyResponsePipe.receive;
  }

  @override
  Widget buildErrorScreen(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      UIHelperWidgets.hideLoader(context: context);
    });
    var bloc = BlocInheritedProvider.of<CryptoDetailsBloc>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text("No Data Available"),
          ),
          Container(
            child: InkWell(
                onTap: () {
                  bloc.getCryptoInfo.launch();
                },
                child: Text("Please Try Again")),
          ),
        ],
      ),
    );
  }
}
