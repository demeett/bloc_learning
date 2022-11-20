import 'package:bloc_learning/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_view.dart';

class BlocConsumerView extends StatelessWidget {
  const BlocConsumerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitClass(),
      child: BlocConsumer<CubitClass, int>(
        buildWhen: (previous, current) {
          if (current.isOdd) {
            print(current.toString());
            return true;
          }
          return false;
        },
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(state.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      widget: const Text('Increment'),
                      onPress: context.watch<CubitClass>().increment,
                    ),
                    CustomButton(
                      widget: const Text('Increment'),
                      onPress: context.watch<CubitClass>().decrement,
                    )
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
