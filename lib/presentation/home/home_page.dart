import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/presentation/home/cubit/home_cubit.dart';
import 'package:netflix_clone/presentation/home/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchHomeItems(),
      child: const HomeView(),
    );
  }
}
