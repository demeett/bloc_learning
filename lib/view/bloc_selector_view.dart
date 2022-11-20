import 'package:bloc_learning/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_view.dart';

class BlocSelectorView extends StatelessWidget {
  const BlocSelectorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocSelector<CubitClass, int, bool>(
        selector: (state) {
          if (state % 3 == 0) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(state.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                      widget: const Text("Increment"),
                      onPress: () {
                        context.watch<CubitClass>().increment;
                      }),
                  CustomButton(
                      widget: const Text("Decrement"),
                      onPress: () {
                        context.watch<CubitClass>().decrement;
                      }),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
