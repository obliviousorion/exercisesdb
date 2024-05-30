import 'package:exercisesdb2/constants/colors.dart';
import 'package:exercisesdb2/constants/textstyles.dart';
import 'package:exercisesdb2/exercise_api/exercise_api_model.dart';
import 'package:exercisesdb2/exercise_api/exercise_api_repo.dart';
// import 'package:exercisesdb2/features/screens/homescreen.dart';
import 'package:exercisesdb2/logic/providers.dart';
import 'package:exercisesdb2/utils/api_state_folder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ListScreen extends ConsumerStatefulWidget {
  const ListScreen({super.key});

  // const TestWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListScreenState();
}

class _ListScreenState extends ConsumerState<ListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final repo = ref.read(exerciseRepoProvider);
      await repo.execute();
    });
  }

  @override
  Widget build(BuildContext) {
    var exerciseRepo = ref.watch(exerciseRepoProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          context.go('/');
        },
      ),
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
