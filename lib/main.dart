import 'package:flutter/material.dart';
import 'domain/workout.dart';

void main() => runApp(MaxFitApp());

class MaxFitApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Max Fit',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(title: TextStyle(color: Colors.white))
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(title: Text('Max Fit'), leading: Icon(Icons.fitness_center,)),
        body: WorkoutsList()
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget {

  final workouts = <Workout>[
  Workout(title: 'Test1', author: 'Max1', description: 'Test Workout1', level: 'Beginner'),
  Workout(title: 'Test2', author: 'Max2', description: 'Test Workout2', level: 'Intermediate'),
  Workout(title: 'Test3', author: 'Max3', description: 'Test Workout3', level: 'Advanced'),
  Workout(title: 'Test4', author: 'Max4', description: 'Test Workout4', level: 'Beginner'),
  Workout(title: 'Test5', author: 'Max5', description: 'Test Workout5', level: 'Intermediate'),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: workouts.length,
            itemBuilder: (context, index){
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                decoration: BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(Icons.fitness_center, color: Theme.of(context).textTheme.title.color),
                    decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1, color: Colors.white24))
                    ),
                  ),
                  title: Text(workouts[index].title, style: TextStyle(color: Theme.of(context).textTheme.title.color, fontWeight: FontWeight.bold),),
                  trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).textTheme.title.color),
                  subtitle: subtitle(context, workouts[index]),
                ),
              ),
            );
            }),
      ),
    );
  }
}


Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch(workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'Intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;

  }
  return Row(
    children: <Widget>[
      Expanded(
          flex: 1,
          child: LinearProgressIndicator(
            backgroundColor: Theme.of(context).textTheme.title.color,
            value: indicatorLevel,
            valueColor: AlwaysStoppedAnimation(color),
          )
      ),
      SizedBox(width: 10,),
      Expanded(
        flex: 3,
        child: Text(workout.level, style: TextStyle(color: Theme.of(context).textTheme.title.color)),
      )
    ],
  );
}

