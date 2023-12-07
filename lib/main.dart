import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_page/common/theme.dart';
import 'package:salon_page/common/theme_mamager.dart';
import 'package:salon_page/screens/list_screen.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: TextTheme()),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("image/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                      ),
                      Image.asset(
                        "image/scissors1removebg.png",
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 17.0)),
                      Text(
                        "Scissor's",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      Text(
                        "Services",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
