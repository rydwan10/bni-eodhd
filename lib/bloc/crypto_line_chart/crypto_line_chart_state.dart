part of 'crypto_line_chart_cubit.dart';

sealed class CryptoLineChartState extends Equatable {
  const CryptoLineChartState();
}

final class CryptoLineChartInitial extends CryptoLineChartState {
  @override
  List<Object> get props => [];
}

final class CryptoLineChartOnChange extends CryptoLineChartState {
  @override
  List<Object> get props => [];
}

class CryptoLineChartLoaded extends CryptoLineChartState {
  final List<FlSpot> spotData;
  final List<CryptoSocket> rawData;

  const CryptoLineChartLoaded({required this.spotData, required this.rawData});

  @override
  List<Object> get props => [
    spotData, rawData,
  ];
}
