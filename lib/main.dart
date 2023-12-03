import 'package:first_homework/modules/application.dart';
import 'package:first_homework/modules/program_interpreter/business/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final mainCubit = MainCubit();

  runApp(BlocProvider(
    create: (_) => mainCubit,
    child: const Application(),
  ));
}
