import 'package:exercisesdb2/constants/colors.dart';
import 'package:exercisesdb2/exercise_api/exercise_api_repo.dart';
import 'package:exercisesdb2/logic/providers.dart';
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
    // return TestWidget();
    return MaterialApp(
      title: 'ExercisesDB with riverpod and sutt Architecture',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TestWidget(),
    );
  }
}

class TestWidget extends ConsumerStatefulWidget {
  const TestWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _TestWidgetState();
  }
}

class _TestWidgetState extends ConsumerState<TestWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(bodyPartProvider.notifier).state = 'chest';
      print(ref.watch(bodyPartProvider));

      print('calling RiverpodAPI now');
      final repo = ref.read(exerciseRepoProvider);
      await repo.execute();
    });
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: BrandColor.blackColor,
      body: Container(),
    );
  }
}

class _TestWidget extends ConsumerWidget {
  // const TestWidget({super.key});

  void updatebodyPartRef(WidgetRef ref) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // updatebodyPartRef(ref);
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      backgroundColor: BrandColor.blackColor,
      body: Container(),
    );
  }
}
