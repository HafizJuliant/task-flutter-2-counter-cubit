import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/counter_cubit.dart'; // Impor CounterCubit

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: BlocConsumer<CounterCubit, int>(
        listener: (context, state) {
          // Tampilkan Snackbar jika counter kelipatan 5
          if (state % 5 == 0 && state != 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('You got $state!')),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter: $state',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      child: Text('Increment (+1)'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                      },
                      child: Text('Decrement (-1)'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().multiplyByTwo();
                      },
                      child: Text('Multiply by 2'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().reset();
                      },
                      child: Text('Reset'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
