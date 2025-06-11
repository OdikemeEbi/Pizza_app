import 'package:flutter/material.dart';
import 'package:pizaa_app/screens/home_page.dart';
import 'package:pizaa_app/screens/pizza_page.dart';
import 'package:pizaa_app/storage/user_storage.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  UserPreferences.printFunction();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
      /// If the user is Logged in Navigate the PizzaPage, 
      /// Other Navigate to the MyHomePage
      home: UserPreferences.isLoggedIn() ? PizzaPage() :   MyHomePage(),
    );
  }
}
