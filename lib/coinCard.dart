import 'package:flutter/material.dart';

class coinCard extends StatelessWidget {
  coinCard(
      {required this.imgUrl,
      required this.name,
      required this.symbol,
      required this.current_price,
      required this.changePrice,
      required this.pricePercentage});
  String imgUrl;
  String name;
  String symbol;
  int current_price;
  double changePrice;
  double pricePercentage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 202, 200, 200),
                      offset: Offset(4, 4),
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 236, 235, 235),
                      offset: Offset(-4, -4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    imgUrl,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  symbol,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$" + current_price.toDouble().toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    changePrice.toDouble() < 0
                        ? "-" + changePrice.toDouble().toStringAsFixed(2)
                        : "+" + changePrice.toDouble().toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: changePrice.toDouble() < 0
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                  Text(
                    pricePercentage.toDouble() < 0
                        ? "-" +
                            pricePercentage.toDouble().toStringAsFixed(2) +
                            "%"
                        : "+" +
                            pricePercentage.toDouble().toStringAsFixed(2) +
                            "%",
                    style: TextStyle(
                      color: pricePercentage.toDouble() < 0
                          ? Colors.red
                          : Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
