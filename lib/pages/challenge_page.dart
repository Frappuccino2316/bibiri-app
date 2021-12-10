import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:bibiri_bet/models/record.dart';
import 'package:bibiri_bet/components/button.dart';
import 'package:bibiri_bet/utils.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final formatter = NumberFormat("#,###");

  final Record _record = Record(10000);
  int _maxMoney = 0;
  int? magnification;

  void _setRecord() {
    setState(() {
      int magnification = randomMagnification();
      int newMoney = _record.money * magnification;
      _record.money = newMoney;
    });
  }

  void _drop() {
    setState(() {
      _setMaxMoney(_record.money);
      _record.money = 10000;
    });
  }

  void _setMaxMoney(int money) {
    setState(() {
      if (_maxMoney < money) {
        _maxMoney = money;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bibiri Bet!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('現在の所持金額'),
                if (magnification != null)
                  Text(
                    '×${magnification!}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                Text(
                  "${formatter.format(_record.money)}円",
                  style: Theme.of(context).textTheme.headline4,
                )
              ],
            ),
            Text("最高記録: ${formatter.format(_maxMoney)}円"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  'Challenge!',
                  _setRecord,
                ),
                CustomButton(
                  'Drop',
                  _drop,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
