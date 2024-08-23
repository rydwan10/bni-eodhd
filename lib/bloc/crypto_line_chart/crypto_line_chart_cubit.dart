import 'package:bloc/bloc.dart';
import 'package:bni_eodhd/data/data/socket_response.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_chart/fl_chart.dart';

part 'crypto_line_chart_state.dart';

class CryptoLineChartCubit extends Cubit<CryptoLineChartState> {
  CryptoLineChartCubit() : super(CryptoLineChartInitial());

  void addData(CryptoSocket newData) {
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

      final newSpotData = [...currentSpotData, FlSpot(calculateX.ceilToDouble(), newData.lastPrice/ 8000)];
      final newRawData = [...currentRawData, newData];

      emit(CryptoLineChartLoaded(rawData: newRawData, spotData: newSpotData));
    }
  }

  void simulateWithDummyData() {
    final dummyFlSpots = [
      FlSpot(0, 3),
      FlSpot(2.6, 2),
      FlSpot(4.9, 5),
    ];
    emit(CryptoLineChartLoaded(spotData: dummyFlSpots, rawData: []));
  }
}
