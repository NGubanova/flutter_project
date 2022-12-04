import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr4/cubit/click_cubit.dart';

import 'cubit/list_cubit.dart';
import 'cubit/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocProvider(
          create: (context) => ClickCubit(),
          child: BlocProvider(
            create: (context) => ListCubit(),
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                if (state is OnThemeClick) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      brightness: context.read<ThemeCubit>().themes,
                      primarySwatch: Colors.indigo,
                    ),
                    home: const MyHomePage(),
                  );
                }

                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    brightness: Brightness.light,
                    primarySwatch: Colors.indigo,
                  ),
                  home: const MyHomePage(),
                );
              },
            ),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Циферка: ',
                  ),
                  BlocBuilder<ClickCubit, ClickState>(
                      builder: (context, state) {
                    if (state is OnClick) {
                      return Text(
                        context.read<ClickCubit>().count.toString(),
                        style: Theme.of(context).textTheme.headline5,
                      );
                    }

                    return Text(
                      "пока 0, нажми на мои кнопочки",
                      style: Theme.of(context).textTheme.headline5,
                    );
                  })
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 15)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Записи',
                  ),
                  BlocBuilder<ListCubit, ListState>(
                    builder: (context, state) {
                      if (state is OnClickAdd) {
                        return SizedBox(
                          height: 450,
                          width: 600,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: context.read<ListCubit>().counts,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Container(
                                      height: 30,
                                      width: 100,
                                      child: Center(
                                          child: Text(
                                              '${(context.read<ListCubit>().elements)[index]}')),
                                    ));
                              }),
                        );
                      }

                      if (state is EmptyList) {
                        return SizedBox(
                          height: 400,
                          width: 600,
                          child: Text(
                            "Пустоватенько",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        );
                      }

                      return Text(
                        "Пустоватенько",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5,
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                if (context.read<ThemeCubit>().themes == Brightness.light) {
                  return FloatingActionButton(
                    onPressed: () {
                      context.read<ClickCubit>().ClickLight();
                      context.read<ListCubit>().ClickAdd(
                          context.read<ClickCubit>().count,
                          context.read<ThemeCubit>().themes);
                    },
                    child: const Icon(Icons.add),
                  );
                } else {
                  return FloatingActionButton(
                    onPressed: () {
                      context.read<ClickCubit>().ClickDark();
                      context.read<ListCubit>().ClickAdd(
                          context.read<ClickCubit>().count,
                          context.read<ThemeCubit>().themes);
                    },
                    child: const Icon(Icons.add),
                  );
                }
              },
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<ThemeCubit>().ThemeClick();
              },
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  if (state is ThemeClick) {
                    context.read<ThemeCubit>().icon;
                  }
                  return
                  context.read<ThemeCubit>().icon;
                },
              ),
            ),
          ],
        ));
  }
}
