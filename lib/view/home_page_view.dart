import 'package:bloc_learning/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});
//Blocbuilder ile çizildi
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitClass(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        body: BlocBuilder<CubitClass, int>(
          buildWhen: (previous, current) {
            if (current % 10 == 0) {
              print(current.toString());
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Center(
                child: Text(
                  state.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      widget: const Text('Increment'),
                      onPress: context.watch<CubitClass>().increment,
                    ),
                    CustomButton(
                      widget: const Text('Decrement'),
                      onPress: context.watch<CubitClass>().decrement,
                    ),
                  ],
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.widget,
    required this.onPress,
    Key? key,
  }) : super(key: key);
  final Widget widget;
  VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 120,
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: widget,
      ),
    );
  }
}
