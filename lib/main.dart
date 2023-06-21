import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/final_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinalBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BlocBuilder<FinalBloc, FinalState>(
            builder: (context, state) {
              if (state is FinalStateInitial) {
                return SafeArea(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textField('input', state),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              elevatedButton(
                                  () => context.read<FinalBloc>().add(
                                        FinalEvent.onGetResultNumberOne(
                                          int.parse(state.textController.text),
                                        ),
                                      ),
                                  '1'),
                              elevatedButton(
                                  () => context.read<FinalBloc>().add(
                                        FinalEvent.onGetResultNumberTwo(
                                          int.parse(state.textController.text),
                                        ),
                                      ),
                                  '2'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              elevatedButton(
                                  () => context.read<FinalBloc>().add(
                                        FinalEvent.onGetResultNumberThree(
                                          int.parse(state.textController.text),
                                        ),
                                      ),
                                  '3'),
                              elevatedButton(
                                  () => context.read<FinalBloc>().add(
                                        FinalEvent.onGetResultNumberFour(
                                          int.parse(state.textController.text),
                                        ),
                                      ),
                                  '4'),
                            ],
                          ),
                          resultText('Result : '),
                          outputData(state),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

Widget textField(String hintText, FinalStateInitial state) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: TextField(
      controller: state.textController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xffD4D4D4))),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color(0xffD4D4D4),
          ),
        ),
        hintText: hintText,
      ),
    ),
  );
}

Widget elevatedButton(VoidCallback onPressed, String text) {
  return Container(
    margin: const EdgeInsets.only(top: 5, bottom: 5),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(175, 50),
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(text),
    ),
  );
}

Widget resultText(String result) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Text(result),
  );
}

Widget outputData(FinalStateInitial state) {
  return Wrap(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          state.result.join(''),
          style: const TextStyle(fontSize: 25),
        ),
      ),
    ],
  );
}
