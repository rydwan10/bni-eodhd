import 'package:bni_eodhd/utils/utils.dart';
import 'package:equatable/equatable.dart';

class CryptoSocket extends Equatable {
  final String tickerCode;
  final double lastPrice;
  final double quantityOfTrade;
  final double dailyChangePercentage;
  final double dailyDifferencePrice;
  final int time;

  CryptoSocket.initial()
      : tickerCode = '',
        lastPrice = 0.0,
        quantityOfTrade = 0.0,
        dailyChangePercentage = 0.0,
        dailyDifferencePrice = 0.0,
        time = 0;

  CryptoSocket.fromJson(Map<String, dynamic> json)
      : tickerCode = handleNullString(json['s']),
        lastPrice = parseToDouble(json['p']),
        quantityOfTrade = parseToDouble(json['q']),
        dailyChangePercentage = parseToDouble(json['dc']),
        dailyDifferencePrice = parseToDouble(json['dd']),
        time = parseToInt(json['t']);

  @override
  List<Object?> get props => [
        tickerCode,
        lastPrice,
        quantityOfTrade,
        dailyChangePercentage,
        dailyDifferencePrice,
        time,
      ];
}
