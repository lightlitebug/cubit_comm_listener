import 'package:cubit_comm_listner/cubit/color/color_cubit.dart';
import 'package:cubit_comm_listner/cubit/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(
          create: (context) => ColorCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc Comm Listener',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int incrementStep = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorCubit, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          incrementStep = 1;
        } else if (state.color == Colors.green) {
          incrementStep = 10;
        } else if (state.color == Colors.blue) {
          incrementStep = 100;
        } else if (state.color == Colors.black) {
          context.read<CounterCubit>().changeCounter(incrementStep * -1);
          incrementStep = -100;
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorCubit>().state.color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Change Color'),
                onPressed: () {
                  context.read<ColorCubit>().changeColor();
                },
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20.0),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                '${context.watch<CounterCubit>().state.counter}',
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Incrment Counter'),
                onPressed: () {
                  context.read<CounterCubit>().changeCounter(incrementStep);
                },
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
