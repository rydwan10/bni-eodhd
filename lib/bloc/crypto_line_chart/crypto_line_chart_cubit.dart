import 'package:bloc/bloc.dart';
import 'package:bni_eodhd/data/data/socket_response.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';

part 'crypto_line_chart_state.dart';

class CryptoLineChartCubit extends Cubit<CryptoLineChartState> {
  CryptoLineChartCubit() : super(CryptoLineChartInitial());

  void addData(CryptoSocket newData) {
    print('hai');
    final currentState = state;
    if(currentState is CryptoLineChartInitial) {
      emit(CryptoLineChartLoaded(rawData: [newData], spotData: [FlSpot(0, newData.lastPrice / 8000)]));
      return;
    }
    emit(CryptoLineChartOnChange());
    if(currentState is CryptoLineChartLoaded) {
      final currentSpotData = currentState.spotData;
      final currentRawData = currentState.rawData;

      // if(currentRawData.last.time == 0) return;
      final calculateX = ((newData.time - currentRawData.last.time)).abs() / 1200;
      final calculateX2 = (newData.lastPrice - newData.dailyDifferencePrice) / 8000;

      final newSpotData = [...currentSpotData, FlSpot(calculateX, newData.lastPrice/ 8000)];
      final newRawData = [...currentRawData, newData];

      emit(CryptoLineChartLoaded(rawData: newRawData, spotData: newSpotData));
    }
  }

  // double calculateX(SocketResponse socketResponse) {
  //   // print(rawData);
  //   if (rawData.isEmpty) return 0.0;
  //   final lastData = rawData.last;
  //   if (lastData.time == 0) return 0;
  //   // if(lastData.time == 0) return 1;
  //   // print('rydwan');
  //   // print(socketResponse.time);
  //   // print(lastData.time);
  //   final calculate = ((socketResponse.time - lastData.time)).abs() / 1200;
  //   // print(data);
  //   return calculate.toDouble();
  // }
}
