import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  Map<String, String> cryptoPrices;
  bool fetchingPrices = false;

  @override
  void initState() {
    super.initState();
    updatePrice(selectedCurrency);
  }

  DropdownButton androidDropDown() {
    List<DropdownMenuItem> dropDownList = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownList.add(newItem);
    }

    return DropdownButton(
      items: dropDownList,
      value: selectedCurrency,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          updatePrice(selectedCurrency);
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerList = [];

    for (String currency in currenciesList) {
      pickerList.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          updatePrice(selectedCurrency);
        });
      },
      children: pickerList,
    );
  }

  void updatePrice(String currency) async {
    fetchingPrices = true;
    try {
      var priceData = await CoinData().getPrices(currency);
      fetchingPrices = false;
      setState(() {
        cryptoPrices = priceData;
      });
    } catch (e) {
      print(e);
    }
  }

  Column makeCards() {
    List<CurrencyCard> cryptoCardList = [];

    for (String crypto in cryptoList) {
      var newCard = CurrencyCard(
        convertedAmount: fetchingPrices ? '?' : cryptoPrices[crypto],
        selectedCurrency: selectedCurrency,
        cryptoCurrency: crypto,
      );

      cryptoCardList.add(newCard);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCardList,
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
            child: makeCards(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropDown(),
          ),
        ],
      ),
    );
  }
}

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    @required this.convertedAmount,
    @required this.selectedCurrency,
    @required this.cryptoCurrency,
  });

  final String convertedAmount;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptoCurrency = $convertedAmount $selectedCurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
