import 'package:exercisesdb2/app_router.dart';
import 'package:exercisesdb2/constants/colors.dart';
import 'package:exercisesdb2/constants/textstyles.dart';
import 'package:exercisesdb2/exercise_api/exercise_api_model.dart';
import 'package:exercisesdb2/exercise_api/exercise_api_repo.dart';
// import 'package:exercisesdb2/features/screens/homescreen.dart';
import 'package:exercisesdb2/logic/providers.dart';
import 'package:exercisesdb2/utils/api_state_folder.dart';
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
    return MaterialApp.router(
      routerConfig: router,
      title: 'ExercisesDB on riverpodapi architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
    // return TestWidget();
    // return MaterialApp(
    //   title: 'ExercisesDB with riverpod and sutt Architecture',
    //   theme: ThemeData(primarySwatch: Colors.blue),
    //   home: HomeScreen(),
    // );
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
    var exerciseRepo = ref.watch(exerciseRepoProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 45,
        title: Text(
              "${ref.watch(bodyPartProvider).toUpperCase()}",
              style: w500.size20.colorWhite,
            ),
      ),
      backgroundColor: BrandColor.blackColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 30),
            
            // const SizedBox(height: 15),
            ApiStateFolder(
              repos: [exerciseRepo],
              buildLoaded: () {
                List<ExerciseModel> foundItem = exerciseRepo.currentResult!;
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: foundItem.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(
                            foundItem[index].name,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            foundItem[index].bodyPart,
                            style: TextStyle(
                                color: Color.fromARGB(255, 239, 228, 73)),
                          ),
                          trailing: Image.network(
                            foundItem[index].gifUrl,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
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
