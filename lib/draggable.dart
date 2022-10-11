import 'package:flutter/material.dart';
import 'dart:async';
import 'package:floating/floating.dart';
import 'package:get/get.dart';

void main()=>runApp(Yap());

class Yap  extends StatefulWidget {
  @override
  _YapState createState() => _YapState();
}

class _YapState extends State<Yap> {
  final floating = Floating();

  @override
  void dispose() {
    floating.dispose();
    super.dispose();
  }

  Future<void> enablePip() async {
    final status = await floating.enable(Rational.landscape());
    debugPrint('PiP enabled? $status');
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Floating example app'),
      ),
      body: Center(
        child: PiPSwitcher(
          childWhenDisabled: const Text('disabled'),
          childWhenEnabled: const Text('enabled'),
        ),
      ),
      floatingActionButton: FutureBuilder<bool>(
        future: floating.isPipAvailable,
        initialData: false,
        builder: (context, snapshot) => snapshot.isNull
            ? PiPSwitcher(
          childWhenDisabled: FloatingActionButton.extended(
            onPressed: enablePip,
            label: const Text('Enable PiP'),
            icon: const Icon(Icons.picture_in_picture),
          ),
          childWhenEnabled: const SizedBox(),
        )
            : const Card(
          child: Text('PiP unavailable'),
        ),
      ),
    ),
  );
}