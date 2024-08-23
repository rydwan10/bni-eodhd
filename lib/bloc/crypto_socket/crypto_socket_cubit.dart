import 'package:bni_eodhd/bloc/crypto_socket/crypto_socket_state.dart';
import 'package:bni_eodhd/constant/constant.dart';
import 'package:bni_eodhd/data/data/socket_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoSocketCubit extends Cubit<CryptoSocketState> {
  CryptoSocketCubit(): super(CryptoSocketInit());

  void updateData(CryptoSocket socketData) {
    final currentState = state;
    if(currentState is CryptoSocketInit) {
      if(socketData.tickerCode == BTC_USD) {
        emit(CryptoSocketLoaded(btcLatestData: socketData, ethLatestData: CryptoSocket.initial()));
      } else if(socketData.tickerCode == ETH_USD) {
        emit(CryptoSocketLoaded(btcLatestData: CryptoSocket.initial(), ethLatestData: socketData));
      }
    }
    if(currentState is CryptoSocketLoaded) {
      if(socketData.tickerCode == BTC_USD) {
        emit(currentState.copyWith(btcData: socketData));
      } else if(socketData.tickerCode == ETH_USD) {
        emit(currentState.copyWith(ethData: socketData));
      }
    }
  }
}
