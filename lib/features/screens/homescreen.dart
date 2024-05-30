import 'package:exercisesdb2/constants/colors.dart';
import 'package:exercisesdb2/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:exercisesdb2/logic/providers.dart';
import 'package:exercisesdb2/bodypart_list_api/bodypart_list_model.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: BrandColor.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: w600.size30.copyWith(
          color: Color.fromARGB(255, 15, 167, 227),
        ),
        title: Text("ExercisesDB"),
        elevation: 20,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: bodyPart.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ref.read(bodyPartProvider.notifier).state = bodyPart[index];
                    print(ref.watch(bodyPartProvider));
                    context.go('/list');
                  },
                  child: GridTile(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            bodyPart[index],
                            style: w400.size30.copyWith(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
