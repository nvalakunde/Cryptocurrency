import 'package:bloc_clean_framework/model.dart';
import 'package:cryptocurrency/features/cryptodetails/api/crypto_details_response.dart';

class CryptoDetailsBusinessModel extends BusinessModel {
  int cryptoId = -1;
  int cryptoRank = -1;
  double cryptoVolume = 0;
  String cryptoName = '';
  String cryptoSlug = '';
  String cryptoSymbol = '';

  String description = '';
  String logo = '';
  String pdfInfo = '';
  String officialWebsite = '';
  String cryptoFirstHistoryDate = '';
  String cryptoLastHistoryDate = '';

  loadCryptoDetails(CryptoDetailsResponse response) {
    cryptoSlug = response.data.the1.slug;
    cryptoName = response.data.the1.name;
    cryptoSymbol = response.data.the1.symbol;
    cryptoId = response.data.the1.id;
    description = response.data.the1.description;
    logo = response.data.the1.logo;
    pdfInfo = response.data.the1.urls.technicalDoc != null &&
            response.data.the1.urls.technicalDoc.isNotEmpty
        ? response.data.the1.urls.technicalDoc[0]
        : '';
    officialWebsite = response.data.the1.urls.website != null &&
            response.data.the1.urls.website.isNotEmpty
        ? response.data.the1.urls.website[0]
        : '';
  }
}
