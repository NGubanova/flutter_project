import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr5/second.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit/theme_cubit.dart';

void main() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(sharedPreferences));
}

class MyApp extends StatelessWidget {
  const MyApp(this.sharedPreferences, {super.key});

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
          if (sharedPreferences.getString('text')== null) {
            return MaterialApp(
                  debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: context.read<ThemeCubit>().themes,
                primarySwatch: Colors.deepPurple,
              ),
              home: MyHomePage(
                sharedPreferences,
              ),
            );
          } else { 
            if (sharedPreferences.getString('themes') == 'light'){
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light, 
                primarySwatch: Colors.deepPurple
              ),
              home: Screen(sharedPreferences),
            );
            }else{
              return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                brightness: Brightness.dark, 
                primarySwatch: Colors.deepPurple
              ),
              home: Screen(sharedPreferences),
            );
            }
            
          }
        }));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(this.sharedPreferences, {super.key});
  final SharedPreferences sharedPreferences;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 500,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Введите текст'
                  ),
                  controller: controller,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 50)),
              ElevatedButton(
                  onPressed: () => {
                        widget.sharedPreferences
                            .setString('text', controller.text),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Screen(widget.sharedPreferences),
                            ))
                      },
                  child: const Text('Вторая страница'),
                  ),
              const Padding(padding: EdgeInsets.only(bottom: 50)),
              FloatingActionButton(
                onPressed: () {
                  context.read<ThemeCubit>().ThemeClick();
                  widget.sharedPreferences
                      .setString('themes', context.read<ThemeCubit>().th);
                },
                child: BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    if (state is ThemeClick) {
                      context.read<ThemeCubit>().icon;
                    }
                    return context.read<ThemeCubit>().icon;
                  },
                ),
              )
            ],
          ),
        ));
  }
}
