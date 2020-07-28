import 'package:flutter_money_formatter/flutter_money_formatter.dart';

String formatNumberToCurrency(double amount) {
  var fmf = FlutterMoneyFormatter(
      amount: amount,
      settings: MoneyFormatterSettings(
        symbol: 'Rp.',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 0,
      ));
  return fmf.output.symbolOnLeft.toString();
}
