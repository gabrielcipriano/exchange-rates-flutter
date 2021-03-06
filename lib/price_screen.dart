import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  DropdownButton<String> getAndroidDropdownPicker() {
    return DropdownButton<String>(
        value: selectedCurrency,
        onChanged: (c) {
          setState(() {
            selectedCurrency = c;
          });
        },
        items: currenciesList
            .map((c) => DropdownMenuItem(
                  child: Text(c),
                  value: c,
                ))
            .toList());
  }

  CupertinoPicker getiOSpicker() {
    return CupertinoPicker(
      itemExtent: 30,
      magnification: 1.1,
      onSelectedItemChanged: (index) {
        print(index);
      },
      children: currenciesList.map((c) => Text(c)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: Platform.isIOS ? 180.0 : 100.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getiOSpicker() : getAndroidDropdownPicker(),
          ),
        ],
      ),
    );
  }
}
