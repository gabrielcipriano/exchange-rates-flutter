import 'network.dart';

//to make it work:
//1. Get your free API key on coinAPI.io
//2. in this same folder make a file called "api_key.dart"
//3. past the line below uncommented:
//const apiKey = 'YOUR coinAPI.io API KEY GOES HERE';
import 'api_key.dart' show apiKey;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String coinAPIurl = 'https://rest.coinapi.io/v1/exchangerate';

  Future<dynamic> getRateData(String coin1, String coin2) async {
    String url = '$coinAPIurl/$coin1/$coin2?apikey=$apiKey';
    Network network = Network(url);
    var coinData = await network.getData();

    return coinData;
  }
}
