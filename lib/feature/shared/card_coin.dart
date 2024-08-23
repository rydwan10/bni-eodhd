import 'dart:io';

import 'package:bni_eodhd/data/data/socket_response.dart';
import 'package:bni_eodhd/utils/utils.dart';
import 'package:flutter/material.dart';

class CardCoin extends StatelessWidget {
  final String coinName;
  final CryptoSocket data;
  final String iconUrl;
  final Color coinColor;

  const CardCoin({
    super.key,
    required this.data,
    required this.iconUrl,
    required this.coinColor,
    required this.coinName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(
            color: coinColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          )),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 38,
                height: 38,
                child: Image.network(iconUrl),
              ),
              const SizedBox(width: 6),
              Column(
                children: [
                  Text(
                    '$coinName (${data.tickerCode})',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'Last Price',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    formatUSD(data.lastPrice),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Change',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(data.dailyDifferencePrice.toString())
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Change%',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text('${data.dailyChangePercentage}%')
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
