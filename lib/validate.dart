// TextField'daki kutucuğun boş olduğunda hata mesajı çıkması (Form)
// Ek olarak DropDown menü kullanımı

// Form doldurma işlemlerinde veya çeşitli üyelik gerektiren uygulamalarda işe yarayabilir.

import 'package:flutter/material.dart';

class ValidateLearn extends StatefulWidget {
  const ValidateLearn({super.key});
  @override
  State<ValidateLearn> createState() => _ValidateLearnState();
}

class _ValidateLearnState extends State<ValidateLearn> {
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

            // save tuşu
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