import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/cart_screen.dart';
import './screens/favorites_screen.dart';
import './screens/orders_screens.dart';
import './screens/profile_screen.dart';
import './constants.dart';
import 'prewelcome.dart';
import 'screens/home_screen.dart';
import './screens/login_screen.dart';
import './screens/register_screen.dart';
import './screens/detail_screen.dart';
import 'screens/vendor_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var phoneNumber = prefs.get('mobileNumber');
  runApp(MyApp(phoneNumber));
}

class MyApp extends StatelessWidget {
  MyApp(this.number);
  final String number;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          accentColor: Colors.deepOrange[200],
          textTheme: TextTheme(
              headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))),
      home: number != null ? HomeScreen(number) : PreWelcome(),
      routes: {
        '/login': (ctx) => LoginScreen(),
        '/register': (ctx) => Registerscreen(),
        '/home': (ctx) => HomeScreen(number),
        '/details': (ctx) => DetailsScreen(),
        '/cart': (ctx) => CartScreen(),
        '/profile': (ctx) => ProfileScreen(),
        '/favorites': (ctx) => FavoritesScreen(),
        '/orders': (ctx) => OrdersScreen(),
        '/vendor_screen': (ctx) => VendorScreen(),
      },
    );
  }
}
