import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';

import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(urls: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urls: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urls: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urls: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urls: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urls: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urls: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(urls: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}')),
              ),
            ),
          );
        },
      ),
    );
  }
}
