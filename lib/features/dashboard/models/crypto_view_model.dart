import 'package:bloc_clean_framework/model.dart';
class CryptoListViewModel extends ViewModel {
  final List<CryptoViewModel> cryptoList;
  CryptoListViewModel({
    this.cryptoList,
  });
}
class CryptoViewModel extends ViewModel {
  final int cryptoId;
  final int cryptoRank;
  final double cryptoVolume;
  final String cryptoName;
  final String cryptoSymbol;
  final String cryptoSlug;
  final String cryptoFirstHistoryDate;
  final String cryptoLastHistoryDate;

  CryptoViewModel({
    this.cryptoId,
    this.cryptoRank,
    this.cryptoVolume,
    this.cryptoName,
    this.cryptoSymbol,
    this.cryptoSlug,
    this.cryptoFirstHistoryDate,
    this.cryptoLastHistoryDate,
  });
}
