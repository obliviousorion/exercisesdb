import 'package:exercisesdb2/features/screens/homescreen.dart';
// import 'package:exercisesdb2/features/screens/exerciseslist_screen.dart';
import 'package:exercisesdb2/features/screens/listscreen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter( routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/list',
    builder: (context, state) => ListScreen(),
  ),

],);
