import 'package:ecommerce_application_with_flutter_firebase_bloc/blocs/wishlist_bloc.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/config/app_router.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/config/theme.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StarWishList())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Zero to Unicorn",
        theme: customTheme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
        home: HomeScreen(),
      ),
    );
  }
}
