import 'dart:typed_data';

import 'package:crypt_ui/src/authentication/authentication.dart';
import 'package:crypt_ui/src/background/background.dart';
import 'package:crypt_ui/src/crypt_file/crypt_file.dart';
import 'package:crypt_ui/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:download/download.dart';

class CryptFileScreen extends StatelessWidget {
  const CryptFileScreen({super.key});

  static route(String path) {
    return GoRoute(
      path: path,
      builder: (context, state) => const CryptFileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("文件加解密"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Background(child: Builder(builder: (context) {
        if (context.read<AuthenticationBloc>().state.authenticationStatus !=
            AuthenticationStatus.authenticated) {
          return const Center(
              child: Text(
            '没有登录，请登录后进入！',
            style: TextStyle(color: Color.fromRGBO(243, 7, 7, 1), fontSize: 50),
          ));
        }
        return BlocProvider(
          create: (context) => CryptFileBloc(),
          child: BlocListener<CryptFileBloc, CryptFileReady>(
            listenWhen: (previous, current) => previous.time != current.time,
            listener: (context, state) {
              if (state.processedFileBytes != Uint8List(0)) {
                download(Stream.fromIterable(state.processedFileBytes),
                    state.fileName);
              }
            },
            child: const CryptFileForm(),
          ),
        );
      })),
    );
  }
}
