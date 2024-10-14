import 'package:flutter/material.dart';
import 'package:midterm_app/ActivityModel.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary of Activities'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Reset History'),
                    content: Text('Are you sure you want to reset the activity history?'),
                    actions: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Reset'),
                        onPressed: () {
                          context.read<ActivityModel>().clearHistory();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ActivityModel>(
          builder: (context, activityModel, child) {
            return activityModel.activityHistory.isEmpty
                ? Center(child: Text('No activity history available.'))
                : ListView.builder(
                    itemCount: activityModel.activityHistory.length,
                    itemBuilder: (context, index) {
                      final activities = activityModel.activityHistory[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('วันที่ ${index + 1}'),
                              Text('Walk or run 10,000 steps: ${activities['walk10kSteps']! ? '✔️' : '❌'}'),
                              Text('Drink at least 2 liters of water: ${activities['drink2LitersWater']! ? '✔️' : '❌'}'),
                              Text('Do 30 minutes of cardio exercise: ${activities['cardio30Mins']! ? '✔️' : '❌'}'),
                              Text('Avoid caffeine after 2 PM: ${activities['avoidCaffeine']! ? '✔️' : '❌'}'),
                              Text('Avoid processed foods and fast food: ${activities['avoidFastFood']! ? '✔️' : '❌'}'),
                              Text('Limit or avoid alcohol consumption: ${activities['limitAlcohol']! ? '✔️' : '❌'}'),
                              Text('Get 7-8 hours of sleep: ${activities['sleep7To8Hours']! ? '✔️' : '❌'}'),
                              Text('Limit screen time, especially before bed: ${activities['limitScreenTime']! ? '✔️' : '❌'}'),
                              Text('Have a healthy breakfast: ${activities['healthyBreakfast']! ? '✔️' : '❌'}'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
