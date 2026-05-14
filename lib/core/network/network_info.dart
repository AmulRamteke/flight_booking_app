import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetworkStatus { connected, disconnected }

class NetworkNotifier extends StateNotifier<NetworkStatus> {
  NetworkNotifier() : super(NetworkStatus.connected) {
    _checkInitialStatus();
    _subscribeToChanges();
  }

  void _checkInitialStatus() async {
    final result = await Connectivity().checkConnectivity();
    _updateStatus(result);
  }

  void _subscribeToChanges() {
    Connectivity().onConnectivityChanged.listen(_updateStatus);
  }

  void _updateStatus(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      state = NetworkStatus.disconnected;
    } else {
      state = NetworkStatus.connected;
    }
  }
}

final networkStatusProvider = StateNotifierProvider<NetworkNotifier, NetworkStatus>((ref) {
  return NetworkNotifier();
});
