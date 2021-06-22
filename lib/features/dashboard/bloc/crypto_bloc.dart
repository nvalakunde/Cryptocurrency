import 'package:bloc_clean_framework/bloc/bloc.dart';
import 'package:bloc_clean_framework/bloc/response_handler_bloc.dart';
import 'package:cryptocurrency/features/dashboard/api/crypto_response.dart';
import 'package:cryptocurrency/features/dashboard/api/crypto_service.dart';
import 'package:cryptocurrency/features/dashboard/models/crypto_business_model.dart';
import 'package:cryptocurrency/features/dashboard/models/crypto_view_model.dart';

class CryptoBloc extends ResponseHandlerBloc {
  CryptoAPIService _getCryptoCurrencyService = CryptoAPIService();

  EventPipe getCryptos = EventPipe();
  BroadcastPipe<CryptoListViewModel> cryptoCurrencyResponsePipe =
      BroadcastPipe<CryptoListViewModel>();

  CryptoListBusinessModel _businessModel = CryptoListBusinessModel();

  CryptoBloc() {
    getCryptos.listen(_getCryptoListener);
    responseHandlerResultPipe.receive.listen((event) {});
  }

  _getCryptoListener() async {
    CryptoResponseModel response =
        await _getCryptoCurrencyService.fetchCryptoService();
    _businessModel.cryptoDetailsList = [];
    if (response != null) {
      ///Create a business model
      _businessModel.loadCryptoDetailsList(response.data);

      ///Send view model to UI
      cryptoCurrencyResponsePipe.send(
        createCryptoListViewModel(),
      );
    } else {
      cryptoCurrencyResponsePipe.throwError("error");
    }
  }

  CryptoListViewModel createCryptoListViewModel() {
    List<CryptoViewModel> _cryptoList = [];
    if (_businessModel != null) {
      _businessModel.cryptoDetailsList.forEach((element) {
        _cryptoList.add(
          CryptoViewModel(
            cryptoName: element.cryptoName,
            cryptoSymbol: element.cryptoSymbol,
            cryptoLastHistoryDate: element.cryptoLastHistoryDate,
            cryptoRank: element.cryptoRank,
            cryptoSlug: element.cryptoSlug,
            cryptoVolume: element.cryptoVolume,
            cryptoId: element.cryptoId,
            cryptoFirstHistoryDate: element.cryptoFirstHistoryDate,
          ),
        );
      });
    }
    CryptoListViewModel cryptoListViewModel =
        CryptoListViewModel(cryptoList: _cryptoList);
    return cryptoListViewModel;
  }

  @override
  void dispose() {
    getCryptos.dispose();
    cryptoCurrencyResponsePipe.dispose();
    super.dispose();
  }
}
