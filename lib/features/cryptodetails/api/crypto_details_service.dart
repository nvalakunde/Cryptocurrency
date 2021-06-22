import 'dart:async';
import 'dart:convert' show json;

import 'package:cryptocurrency/features/cryptodetails/api/crypto_details_response.dart';
import 'package:cryptocurrency/features/dashboard/api/crypto_response.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class CryptoDetailsAPIService {
  final _apiKey = '2592e201-7cb0-41b4-81d5-abacc60ac4ee';
  final _host = 'pro-api.coinmarketcap.com';

  Future<CryptoDetailsResponse> fetchCryptoService({String currencyId}) async {
    final results = await request(
      path: '/v1/cryptocurrency/info',
      parameters: {
        "id":'$currencyId',
      },
    );
    CryptoDetailsResponse detailsResponse = CryptoDetailsResponse.fromJson(results,currencyId);
    return detailsResponse;
  }

  request({@required String path, Map<String, String> parameters}) async {
    final uri = Uri.http(_host, '$path', parameters);
    final results = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Map<String, String> get _headers =>
      {'Accept': 'application/json', 'X-CMC_PRO_API_KEY': _apiKey};
}
