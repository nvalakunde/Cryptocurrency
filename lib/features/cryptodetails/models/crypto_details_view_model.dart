import 'package:bloc_clean_framework/model.dart';

class CryptoDetailsViewModel extends ViewModel {
  final int cryptoId;
  final int cryptoRank;
  final double cryptoVolume;
  final String cryptoName;
  final String cryptoSymbol;
  final String cryptoSlug;
  final String cryptoFirstHistoryDate;
  final String cryptoLastHistoryDate;
  final String description;
  final String logo;
  final String pdfInfo;
  final String officialWebsite;

  CryptoDetailsViewModel({
    this.description,
    this.logo,
    this.pdfInfo,
    this.officialWebsite,
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
