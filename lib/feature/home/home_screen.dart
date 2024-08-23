import 'package:bni_eodhd/bloc/crypto_line_chart/crypto_line_chart_cubit.dart';
import 'package:bni_eodhd/bloc/crypto_socket/crypto_socket_cubit.dart';
import 'package:bni_eodhd/bloc/crypto_socket/crypto_socket_state.dart';
import 'package:bni_eodhd/constant/constant.dart';
import 'package:bni_eodhd/data/data/socket_response.dart';
import 'package:bni_eodhd/data/repository/socket_crypto_repository.dart';
import 'package:bni_eodhd/feature/chart/line_chart_crypto.dart';
import 'package:bni_eodhd/feature/shared/card_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoScreen extends StatefulWidget {
  final SocketCryptoRepository cryptoRepository;

  const CryptoScreen({super.key, required this.cryptoRepository});

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  void subscribe() {
    widget.cryptoRepository.connect();
    widget.cryptoRepository.subscribeToSymbols('BTC-USD, ETH-USD');
    widget.cryptoRepository.listen(loadData);
  }

  void loadData(CryptoSocket data) {
    context.read<CryptoSocketCubit>().updateData(data);
  }

  @override
  void initState() {
    subscribe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Crypto Live Data',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        backgroundColor: const Color(0xFFe9eeee),
      ),
      body: BlocBuilder<CryptoSocketCubit, CryptoSocketState>(
        buildWhen: (prev, curr) => true,
        builder: (context, state) {
          if (state is CryptoSocketLoaded) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BlocProvider(
                              create: (context) => CryptoLineChartCubit(),
                              child: LineChartCrypto(
                                data: state.btcLatestData,
                                cryptoRepository: widget.cryptoRepository,
                              ),
                            ),
                      ),
                    );
                  },
                  child: CardCoin(
                    data: state.btcLatestData,
                    iconUrl: BTC_ICON_LINK,
                    coinColor: const Color(0xFFf68828),
                    coinName: 'Bitcoin',
                  ),
                ),
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BlocProvider(
                              create: (context) => CryptoLineChartCubit(),
                              child: LineChartCrypto(
                                data: state.ethLatestData,
                                cryptoRepository: widget.cryptoRepository,
                              ),
                            ),
                      ),
                    );
                  },
                  child: CardCoin(
                    data: state.ethLatestData,
                    iconUrl: ETH_ICON_LINK,
                    coinColor: const Color(0xFF5b78e4),
                    coinName: 'Ethereum',
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: Text(
              'Loading...',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          );
        },
      ),
    );
  }
}