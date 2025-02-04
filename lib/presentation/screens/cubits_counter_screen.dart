import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitsCounterScreen extends StatelessWidget {
  const CubitsCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text('Cubit counter: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
              onPressed: () => context.read<CounterCubit>().reset(),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        // buildWhen: (previous, current) => current.counter != previous.counter,
        //validacion para saber si el state a cambiado, si cambio, se redibuja
        builder: (context, state) {
          print('Counter cambio');
          return Center(
            child: Text('Counter value: ${state.counter}'),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 3),
            heroTag: '1',
            child: const Text('+3'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context),
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
