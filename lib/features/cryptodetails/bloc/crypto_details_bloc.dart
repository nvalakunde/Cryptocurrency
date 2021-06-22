import 'package:bloc_clean_framework/bloc/bloc.dart';
import 'package:bloc_clean_framework/bloc/response_handler_bloc.dart';
import 'package:cryptocurrency/features/cryptodetails/api/crypto_details_response.dart';
import 'package:cryptocurrency/features/cryptodetails/api/crypto_details_service.dart';
import 'package:cryptocurrency/features/cryptodetails/models/crypto_details_business_model.dart';
import 'package:cryptocurrency/features/cryptodetails/models/crypto_details_view_model.dart';

class CryptoDetailsBloc extends ResponseHandlerBloc {
  final String cryptoId;
  CryptoDetailsAPIService _getCryptoDetailsService = CryptoDetailsAPIService();

  EventPipe getCryptoInfo = EventPipe();
  BroadcastPipe<CryptoDetailsViewModel> cryptoCurrencyResponsePipe =
      BroadcastPipe<CryptoDetailsViewModel>();

  CryptoDetailsBusinessModel _businessModel = CryptoDetailsBusinessModel();

  CryptoDetailsBloc({
    this.cryptoId,
  }) {
    getCryptoInfo.listen(_getCryptoInfoListener);
    responseHandlerResultPipe.receive.listen((event) {});
  }

  _getCryptoInfoListener() async {
    CryptoDetailsResponse response =
        await _getCryptoDetailsService.fetchCryptoService(
      currencyId: cryptoId,
    );
    _businessModel = CryptoDetailsBusinessModel();
    if (response != null) {
      ///Create a business model
      _businessModel.loadCryptoDetails(response);

      ///Send view model to UI
      cryptoCurrencyResponsePipe.send(
        createCryptoListViewModel(),
      );
    } else {
      cryptoCurrencyResponsePipe.throwError("error");
    }
  }

  CryptoDetailsViewModel createCryptoListViewModel() {
    CryptoDetailsViewModel cryptoDetailsViewModel = CryptoDetailsViewModel();
    if (_businessModel != null) {
      cryptoDetailsViewModel = CryptoDetailsViewModel(
        cryptoName: _businessModel.cryptoName,
        cryptoSymbol: _businessModel.cryptoSymbol,
        cryptoLastHistoryDate: _businessModel.cryptoLastHistoryDate,
        cryptoRank: _businessModel.cryptoRank,
        cryptoSlug: _businessModel.cryptoSlug,
        cryptoVolume: _businessModel.cryptoVolume,
        cryptoId: _businessModel.cryptoId,
        cryptoFirstHistoryDate: _businessModel.cryptoFirstHistoryDate,
        description: _businessModel.description,
        logo: _businessModel.logo,
        pdfInfo: _businessModel.pdfInfo,
        officialWebsite: _businessModel.officialWebsite,
      );
    }

    return cryptoDetailsViewModel;
  }

  @override
  void dispose() {
    getCryptoInfo.dispose();
    cryptoCurrencyResponsePipe.dispose();
    super.dispose();
  }
}
