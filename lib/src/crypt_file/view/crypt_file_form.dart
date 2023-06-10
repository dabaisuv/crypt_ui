import 'dart:typed_data';

import 'package:crypt_ui/src/crypt_file/crypt_file.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptFileForm extends StatelessWidget {
  const CryptFileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const FractionallySizedBox(
      widthFactor: 0.78,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KeyInputTextField(),
          FilePickerButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [CryptButton(), DecryptButton()],
          )
        ],
      ),
    );
  }
}

class FilePickerButton extends StatelessWidget {
  const FilePickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              Uint8List fileBytes = result.files.first.bytes!;
              String fileName = result.files.first.name;
              context.read<CryptFileBloc>().add(CryptFilePickedFile(
                  fileBytes: fileBytes, fileName: fileName));
            }
          },
          icon: const Icon(
            Icons.smart_button,
            color: Color.fromARGB(253, 152, 105, 5),
          ),
          label: const Text('选取文件')),
    );
  }
}

class KeyInputTextField extends StatelessWidget {
  const KeyInputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(label: Text('密码')),
      onChanged: (key) =>
          context.read<CryptFileBloc>().add(CryptFileKeyChanged(key: key)),
    );
  }
}

class CryptButton extends StatelessWidget {
  const CryptButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Text('加密'),
        onPressed: () => context
            .read<CryptFileBloc>()
            .add(const CryptFileCryptButtonClicked()),
      ),
    );
  }
}

class DecryptButton extends StatelessWidget {
  const DecryptButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Text('解密'),
        onPressed: () => context
            .read<CryptFileBloc>()
            .add(const CryptFileDecryptButtonClicked()),
      ),
    );
  }
}
