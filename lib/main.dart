import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_bloc_observer/pretty_bloc_observer.dart';
import 'package:sushi_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:sushi_app/bloc/product_bloc/product_bloc.dart';
import 'package:sushi_app/core/theme/app_theme.dart';
import 'package:sushi_app/pages/home_page.dart';

import 'init_dependencies.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Set Pretty Bloc Observer as the Bloc observer
  Bloc.observer = PrettyBlocObserver();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<ProductBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<CartBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sushi App Demo',
        theme: AppTheme.themeData,

        home: const HomePage(),
      ),
    );
  }
}
