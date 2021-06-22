import 'package:bloc_clean_framework/model.dart';
import 'package:cryptocurrency/features/dashboard/api/crypto_response.dart';
import 'package:cryptocurrency/utils/helper_functions.dart';

class CryptoListBusinessModel extends BusinessModel {
  List<CryptoBusinessModel> cryptoDetailsList = [];
  loadCryptoDetailsList(List<Datum> response) {
    response?.forEach((element) {
      cryptoDetailsList.add(CryptoBusinessModel(
        cryptoFirstHistoryDate:
            stringDateWithFormat(element.dateAdded, 'yyyy-MM-dd'),
        cryptoLastHistoryDate:
            stringDateWithFormat(element.dateAdded, 'yyyy-MM-dd'),
        cryptoSlug: element.slug,
        cryptoName: element.name,
        cryptoSymbol: element.symbol,
        cryptoRank: element.cmcRank,
        cryptoId: element.id,
        cryptoVolume: element.quote.usd.volume24H,
      ));
    });
  }
}

class CryptoBusinessModel extends BusinessModel {
  int cryptoId = -1;
  int cryptoRank = -1;
  double cryptoVolume = 0;
  String cryptoName = '';
  String cryptoSlug = '';
  String cryptoSymbol = '';
  String cryptoFirstHistoryDate = '';
  String cryptoLastHistoryDate = '';

  CryptoBusinessModel({
    this.cryptoId,
    this.cryptoRank,
    this.cryptoVolume,
    this.cryptoName,
    this.cryptoSlug,
    this.cryptoSymbol,
    this.cryptoFirstHistoryDate,
    this.cryptoLastHistoryDate,
  });
}
