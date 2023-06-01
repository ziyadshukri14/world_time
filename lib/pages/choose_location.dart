import 'package:flutter/material.dart';
import 'package:world_time_apps/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        latitude: '6.2088',
        longitude: '106.8456',
        location: 'Jakarta',
        flag: 'indonesia.png'),
    WorldTime(
        latitude: '51.5072',
        longitude: '0.1276',
        location: 'London',
        flag: 'uk.png'),
    WorldTime(
        latitude: '52.5200',
        longitude: '13.4050',
        location: 'Berlin',
        flag: 'germany.png'),
    WorldTime(
        latitude: '30.0444',
        longitude: '31.2357',
        location: 'Cairo',
        flag: 'egypt.png'),
    WorldTime(
        latitude: '1.2921',
        longitude: '36.8219',
        location: 'Nairobi',
        flag: 'kenya.png'),
    WorldTime(
        latitude: '37.0902',
        longitude: '95.7129',
        location: 'United States',
        flag: 'usa.png'),
    WorldTime(
        latitude: '37.5519',
        longitude: '126.9918',
        location: 'Seoul',
        flag: 'south_korea.png'),
    WorldTime(
        latitude: '3.1319',
        longitude: '101.6841',
        location: 'Kuala Lumpur',
        flag: 'malaysia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
