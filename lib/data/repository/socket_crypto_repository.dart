import 'dart:convert';
import 'package:bni_eodhd/data/data/socket_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class SocketCryptoRepository {
  final String url;
  WebSocketChannel? _channel;

  SocketCryptoRepository({required this.url});

  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(url));
  }

  void subscribeToSymbols(String symbols) {
    final request = jsonEncode({
      "action": "subscribe",
      "symbols": symbols,
    });
    _channel?.sink.add(request);
  }

  Stream<CryptoSocket> get stream => _channel!.stream.map((event) {
    final data = jsonDecode(event);
    return CryptoSocket.fromJson(data);
  });

  void listen(Function(CryptoSocket) callback) {
    stream.listen(callback);
  }

  void disconnect() {
    _channel?.sink.close(status.goingAway);
  }
}