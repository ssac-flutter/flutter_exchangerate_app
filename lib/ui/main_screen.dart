import 'package:flutter/material.dart';
import 'package:flutter_exchangerate_app/data/model/exchange_rate.dart';
import 'package:provider/provider.dart';

import 'exchangerate_view_model.dart';

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
    final viewModel = context.watch<ExchangeRateViewModel>();
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
                    viewModel.onSearch(_controller.text);
                    print('clicked ${_controller.text}');
                  }
                },
                child: const Icon(Icons.search),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  color: Colors.blue,
                  child: const Text("국가명"),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  color: Colors.red,
                  child: const Text("통화"),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  color: Colors.amber,
                  child: const Text("환산율"),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: viewModel.exchangeRates.length,
              itemBuilder: (BuildContext context, int index) {
                final item = viewModel.exchangeRates[index];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //국가명
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Container(
                        alignment: Alignment.center,
                        // color: Colors.blue,
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              item.imageUrl,
                              width: 30,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                item.countryName,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //통화코드
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        // color: Colors.red,
                        child: Text(item.currency),
                      ),
                    ),
                    //미화 환산율
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        // color: Colors.amber,
                        child: Text(item.conversionRate.toString()),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
