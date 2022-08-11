import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'exchangerate/components/exchangerate_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExchangerateViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("환율조회"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  if (_controller.text.isNotEmpty) {
                    viewModel.fetchConversionRates(_controller.text);
                    print(viewModel.conversionRates);
                  }
                },
                child: const Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
