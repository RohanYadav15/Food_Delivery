import 'package:flutter/material.dart';
import 'package:food_delivery/UI%20components/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'logics/providers/cart_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.cyan,
          scaffoldBackgroundColor: Colors.blueGrey[50],
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.grey[600])),
        ),
        //darkTheme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    );
  }
}
