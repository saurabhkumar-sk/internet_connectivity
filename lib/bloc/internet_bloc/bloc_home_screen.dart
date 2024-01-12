import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_view/bloc/internet_bloc/internet_bloc.dart';
import 'package:web_view/bloc/internet_bloc/internet_state.dart';

class BlocHomeScreen extends StatefulWidget {
  const BlocHomeScreen({super.key});

  @override
  State<BlocHomeScreen> createState() => _BlocHomeScreenState();
}

class _BlocHomeScreenState extends State<BlocHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet connected"),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Internet Not connected"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Connected");
            } else if (state is InternetLostState) {
              return const Text("Not Connected");
            } else {
              return const Text("Loading .....");
            }
          },
        )

            // BlocBuilder<InternetBloc, InternetState>(
            //   builder: (context, state) {
            //     if (state is InternetGainedState) {
            //       return const Text("Connected");
            //     } else if (state is InternetLostState) {
            //       return const Text("Not Connected");
            //     } else {
            //       return const Text("Loading .....");
            //     }
            //   },
            // ),
            ),
      ),
    );
  }
}
