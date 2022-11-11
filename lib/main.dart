import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'tommy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Meditate extends StatefulWidget {
  const Meditate({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Meditate> createState() => _Meditate();
}

class _Meditate extends State<Meditate> {
  @override
  Widget build(BuildContext context) {
    bool click = true;
    final List<String> names = <String>[
      'all',
      'Bible in a Year',
      'Dailies',
      'Minutes',
      'Novenber'
    ];
    final List<String> name_program = <String>[
      'Sleep Hour',
      'Easy on the Mission',
    ];

    final List<String> name_program_ = <String>[
      'Relax with Me',
      'Sun and Energy'
    ];
    final List<String> Author = <String>['Ashna Mukherjee', 'Peter Mach'];
    final List<String> Author_ = <String>['Amanda James', 'Micheal Hiu'];
    final List<String> image_name = <String>[
      'assets/images/img1.png',
      'assets/images/img3.png'
    ];
    final List<String> image_name_ = <String>[
      'assets/images/img2.png',
      'assets/images/img4.png'
    ];
    final List<String> status = <String>['3 Session', '5 minutes'];
    return Scaffold(
      body: Column(children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: const Text("Meditate",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
            ),
            Container(
              width: 200,
            ),
            Container(
                child: Image.asset(
              'assets/images/loupe.png',
              height: 20,
            ))
          ],
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              itemCount: names.length,
              itemBuilder: (context, int index) {
                return Center(
                    child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        click = !click;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        primary: const Color(0xffE6FEFF),
                        onPrimary: const Color(0xff039EA2)),
                    child: Text('${names[index]}'),
                  ),
                ));
              }),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset('assets/images/big_sun.png'),
            const Text(
              "A Song of Moon",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
            ),
            const Text(
              "Start with the basics",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: Colors.grey),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(right: 7),
                    child: Image.asset(
                      'assets/images/heart.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                  Container(
                    child: const Text('9 Session',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: Colors.grey)),
                  ),
                  Container(
                    width: 160,
                  ),
                  Container(
                    child: const Text('Start',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            color: Colors.grey)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 7),
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/images/arrow.png',
                      width: 15,
                      height: 15,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
        Expanded(
          flex: 3,
          child: ((ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Image.asset(
                          '${image_name[index]}',
                          width: 170,
                          height: 90,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '${name_program[index]}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            '${Author[index]}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          margin: EdgeInsets.only(top: 2),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(right: 7),
                                child: Image.asset(
                                  'assets/images/heart.png',
                                  width: 7,
                                  height: 7,
                                ),
                              ),
                              Container(
                                child: Text('${status[index]}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Colors.grey)),
                              ),
                              Container(
                                width: 60,
                              ),
                              Container(
                                child: const Text('Start',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Colors.grey)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 7),
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  'assets/images/arrow.png',
                                  width: 7,
                                  height: 7,
                                ),
                              ),
                            ],
                          ))
                    ]);
              },
              separatorBuilder: ((context, index) =>
                  Container(height: 1, color: Colors.grey)),
              itemCount: name_program.length))),
        ),
        Expanded(
          flex: 3,
          child: ((ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Image.asset(
                          '${image_name_[index]}',
                          width: 170,
                          height: 90,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '${name_program_[index]}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            '${Author_[index]}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          margin: EdgeInsets.only(top: 2),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(right: 7),
                                child: Image.asset(
                                  'assets/images/heart.png',
                                  width: 7,
                                  height: 7,
                                ),
                              ),
                              Container(
                                child: Text('${status[index]}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Colors.grey)),
                              ),
                              Container(
                                width: 60,
                              ),
                              Container(
                                child: const Text('Start',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Colors.grey)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 7),
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  'assets/images/arrow.png',
                                  width: 7,
                                  height: 7,
                                ),
                              ),
                            ],
                          ))
                    ]);
              },
              separatorBuilder: ((context, index) =>
                  Container(height: 1, color: Colors.grey)),
              itemCount: name_program.length))),
        ),
      ]),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff039EA2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              child: Image.asset(
                'assets/images/medinow.png',
                width: 184,
                height: 30,
              ),
            ),
            const Text(
              "Meditate With Us!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              constraints:
                  const BoxConstraints.tightFor(width: 300, height: 50),
              margin: const EdgeInsets.only(
                  top: 45, left: 24, right: 24, bottom: 6),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 40)),
                  child: const Text("Sign in with Apple")),
            ),
            Container(
              constraints:
                  const BoxConstraints.tightFor(width: 300, height: 50),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    primary: const Color(0xffCDFDFE),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 40),
                  ),
                  child: const Text("Continue with Email or Phone")),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {},
              child: const Text("Continue With Google"),
            ),
            Image.asset(
              'assets/images/people.png',
              width: 377,
              height: 284,
            ),
          ],
        ),
      ),
    );
  }
}
