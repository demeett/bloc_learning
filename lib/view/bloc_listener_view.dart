import 'package:bloc_learning/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_view.dart';

class BlocListenerView extends StatelessWidget {
  const BlocListenerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CubitClass, int>(
          listenWhen: (previous, current) {
            if (current % 2 == 0) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            print(state.toString());
            
             Column(
              children: [
                Text(
                  state.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  CustomButton(
                    widget: const Text('Increment'),
                    onPress: context.read<CubitClass>().increment,
                  ),
                  CustomButton(
                    widget: const Text('Decrement'),
                    onPress: context.read<CubitClass>().decrement,
                  )
                ],
              ),
            ],
          )),
    );
  }
}
