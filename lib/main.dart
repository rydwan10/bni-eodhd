import 'package:bni_eodhd/bloc/crypto_line_chart/crypto_line_chart_cubit.dart';
import 'package:bni_eodhd/bloc/crypto_socket/crypto_socket_cubit.dart';
import 'package:bni_eodhd/bloc/crypto_socket/crypto_socket_state.dart';
import 'package:bni_eodhd/feature/home/home_screen.dart';
import 'package:bni_eodhd/feature/shared/card_coin.dart';
import 'package:bni_eodhd/feature/chart/chart_crypto.dart';
import 'package:bni_eodhd/constant/constant.dart';
import 'package:bni_eodhd/data/data/socket_response.dart';
import 'package:bni_eodhd/data/repository/socket_crypto_repository.dart';
import 'package:bni_eodhd/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final cryptoRepository = SocketCryptoRepository(
    url: SOCKET_URL,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CryptoSocketCubit(),
        child: CryptoScreen(
          cryptoRepository: cryptoRepository,
        ),
      ),
    );
  }
}
