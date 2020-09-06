
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:max_fit/components/ActiveWorkouts.dart';
import 'package:max_fit/components/workouts-list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super (key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var curvedNavigationBar = CurvedNavigationBar(
        items: const [
          Icon(Icons.fitness_center),
          Icon(Icons.search),
        ],
        index: 0,
        height: 50,
        color: Colors.white.withOpacity(0.5),
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white.withOpacity(0.5),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
                setState(() => sectionIndex = index);
              },


      );
    return Container(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(title: Text('Max Fit //' + (sectionIndex == 0 ? ' Active Worouts' : ' Find Workouts')), leading: Icon(Icons.fitness_center,)),
          body:sectionIndex == 0 ? ActiveWorkouts() : WorkoutsList(),
      bottomNavigationBar: curvedNavigationBar,
      ),
    );
  }
}
