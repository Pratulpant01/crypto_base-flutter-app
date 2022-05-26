import 'package:flutter/material.dart';

class Coin {
  Coin(
      {required this.imgUrl,
      required this.name,
      required this.symbol,
      required this.current_price,
      required this.changePrice,
      required this.pricePercentage});

  String imgUrl;
  String name;
  String symbol;
  num current_price;
  num changePrice;
  num pricePercentage;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      imgUrl: json["image"],
      name: json["name"],
      symbol: json["symbol"],
      current_price: json["current_price"],
      changePrice: json["price_change_percentage_24h"],
      pricePercentage: json["price_change_24h"],
    );
  }
}

List<Coin> coinList = [];
