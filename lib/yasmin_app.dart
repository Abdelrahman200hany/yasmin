import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:yasmin/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Yasmin extends StatelessWidget {
  const Yasmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Colors.blue),
        // colorScheme: ColorScheme.light(primary: AppColor.kPrimaryColor),
        scaffoldBackgroundColor: Colors.white,
      ),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'شيشسيشسيش',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
