import 'package:crypt_ui/src/authentication/authentication.dart';
import 'package:crypt_ui/src/repository/authentication_repository/authentication_repository.dart';
import 'package:crypt_ui/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'src/login/login.dart';
import 'src/home/home.dart';
import 'src/register/register.dart';
import 'src/crypt_file/crypt_file.dart';

final _router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) {
    print(context.read<AuthenticationBloc>().state.authenticationStatus);
    if (context.read<AuthenticationBloc>().state.authenticationStatus ==
        AuthenticationStatus.authenticated) {
      return '/crypt';
    } else {
      return null;
    }
  },
  routes: [
    HomeScreen.route('/'),
    RegisterScreen.route('/register'),
    LoginScreen.route('/login'),
    CryptFileScreen.route('/crypt'),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => AuthenticationRepository(),
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthenticationBloc(
            authenticationRepository: context.read<AuthenticationRepository>()),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'NotoSerifSC',
              primaryColor: Color.fromARGB(89, 229, 127, 3)),
          routerConfig: _router,
        ),
      ),
    );
  }
}
