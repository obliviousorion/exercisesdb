import 'package:exercisesdb2/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return Material.router(
    //   routerConfig: router,
    //   title: 'ExercisesDB on riverpodapi architecture',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    // );
    return TestWidget();
  }
}

class TestWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      backgroundColor: BrandColor.blackColor,
      body: Container(),
    );
  }
}
