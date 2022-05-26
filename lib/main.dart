import 'dart:convert';

import 'package:cypto_oo/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import 'coinCard.dart';
import 'coinModel.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Coin>> fetchCoins() async {
    coinList = [];
    final response = await http.get(
      Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"),
    );

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = jsonDecode(response.body);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
          }
        }
        setState(() {
          coinList;
        });
      }
    } else {
      throw Exception("Unable to get coins data");
    }
    return coinList;
  }

  @override
  void initState() {
    fetchCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            leading: Transform.scale(
              scale: 0.8,
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/navicon.svg",
                  color: Colors.grey[300],
                ),
              ),
            ),
            title: Text(
              "CRYPTOO BASE",
              style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: coinList.length,
              itemBuilder: (context, index) {
                return coinCard(
                    imgUrl: coinList[index].imgUrl,
                    name: coinList[index].name,
                    symbol: coinList[index].symbol,
                    current_price: coinList[index].current_price.toInt(),
                    changePrice: coinList[index].changePrice.toDouble(),
                    pricePercentage:
                        coinList[index].pricePercentage.toDouble());
              })),
    );
  }
}
