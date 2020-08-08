import 'package:flutter/material.dart';
import 'package:provider_demo/services/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/services/counter_notifier.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    //print('build() of HomeScreen called');

    //
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Demo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.brightness_4),
            onPressed: () {
              context.read<ThemeNotifier>().changeTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          context.watch<CounterNotifier>().counter.toString(),
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),

      //
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              context.read<CounterNotifier>().decrement();
            },
          ),

          SizedBox(width: 16),
          //
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              context.read<CounterNotifier>().increment();
            },
          ),
        ],
      ),
    );
  }
}
