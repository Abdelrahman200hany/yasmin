import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yasmin/core/serviecs/bloc_observer/bloc_observer.dart';
import 'package:yasmin/core/serviecs/create_servieces_locator.dart/create_single_ton.dart';
import 'package:yasmin/core/serviecs/shared_prefs/shared_prefs.dart';
import 'package:yasmin/firebase_options.dart';
import 'package:yasmin/yasmin_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.init();
  setupServiceLocator();

  runApp(DevicePreview(enabled: true, builder: (context) => const Yasmin()));
}
