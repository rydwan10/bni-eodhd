import 'package:intl/intl.dart';

double handleNullDouble(num? number) =>
    number == null ? 0.0 : number.toDouble();

String handleNullString(String? string) => string ?? "";

int handleNullInt(int? number) => number ?? 0;

double parseToDouble(dynamic value) {
  if (value == null) {
    return 0.0;
  } else if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  } else if (value is String) {
    return double.tryParse(value) ?? 0.0;
  } else {
    throw ArgumentError("Unsupported type for parsing to double: ${value.runtimeType}");
  }
}

int parseToInt(dynamic value) {
  if (value == null) {
    return 0;
  } else if (value is int) {
    return value;
  } else if (value is double) {
    return value.toInt();
  } else if (value is String) {
    return int.tryParse(value) ?? 0;
  } else {
    throw ArgumentError("Unsupported type for parsing to int: ${value.runtimeType}");
  }
}

String formatUSD(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: '\$',
    decimalDigits: 2,
  );
  return formatter.format(amount);
}