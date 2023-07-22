// TextField'daki kutucuğun boş olduğunda hata mesajı çıkması (Form)
// Ek olarak DropDown menü kullanımı

import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});
  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  GlobalKey<FormState> _key = GlobalKey(); // FormState gibi durumları içinde barındırır

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key, // Form ile ilgili her şeyi barındırır (. koyduğunda)
        autovalidateMode: AutovalidateMode.always, // Boş olan her textfield için hata mesajı ver
        child: Column(
          children: [
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            TextFormField(validator: FormFieldValidator().isNotEmpty),

            DropdownButtonFormField<String>(
              validator: FormFieldValidator().isNotEmpty,
              items: const [
                DropdownMenuItem(child: Text('Fıs'), value: 'f'),
                DropdownMenuItem(child: Text('Cıs'), value: 'c'),
                DropdownMenuItem(child: Text('kıps'), value: 'k'),
              ], 
              onChanged: (value) {}),

            ElevatedButton(onPressed: () {
              if (_key.currentState?.validate() ?? false) {
                print('done');
              }
            }, child: Text('save'))
          ],
        ),
      ),
    );
  }
}

// Eğer textfield boş ise _notEmpty (Boş geçilemez!) mesajını ver
class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

// Boş geçilemez mesajı
class ValidatorMessage {
  static const String _notEmpty = 'Bos gecilemez';
}