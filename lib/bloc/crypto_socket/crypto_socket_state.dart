import 'package:bni_eodhd/data/data/socket_response.dart';
import 'package:equatable/equatable.dart';

abstract class CryptoSocketState extends Equatable {
  @override
  List<Object> get props => [];
}

class CryptoSocketInit extends CryptoSocketState {

}

class CryptoSocketChange extends CryptoSocketState {

}

class CryptoSocketLoaded extends CryptoSocketState {
  final CryptoSocket btcLatestData;
  final CryptoSocket ethLatestData;

  CryptoSocketLoaded({required this.btcLatestData, required this.ethLatestData});

  CryptoSocketLoaded copyWith({CryptoSocket? btcData, CryptoSocket? ethData}) {
    return CryptoSocketLoaded(
      btcLatestData: btcData ?? btcLatestData,
      ethLatestData: ethData ?? ethLatestData,
    );
  }

  @override
  List<Object> get props => [btcLatestData, ethLatestData];
}