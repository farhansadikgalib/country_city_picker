import 'package:country_city_picker/check_data.dart';
import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Country State and City Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? countryValue;
  String? stateValue;
  String? cityValue;
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectState(
              // style: TextStyle(color: Colors.red),
              onCountryChanged: (value) {
                setState(() {
                  countryValue = value;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  stateValue = value;
                });
              },
              onCityChanged: (value) {
                setState(() {
                  cityValue = value;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  print('country selected is $countryValue');
                  print('country selected is $stateValue');
                  print('country selected is $cityValue');

                  if (countryValue!.contains('null') &&
                      stateValue!.contains('null')) {
                    setState(() {
                      visibility = false;
                    });
                  } else {
                    setState(() {
                      visibility = true;
                    });
                  }
                },
                child: const Text('Check Names')),
            SizedBox(height: 20,),
            Visibility(
                visible: visibility,
                child: Text(
                  '$countryValue\n$stateValue\n$cityValue',
                  style: const TextStyle(fontSize: 18),
                )),
            SizedBox(height: 20,),

            Visibility(
              visible: visibility,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CheckData(
                        country: countryValue.toString(),
                        state: stateValue.toString(),
                        city: cityValue.toString(),
                      );
                    }));
                  },
                  child: const Text("Next Page")),
            )
          ],
        ),
      ),
    );
  }
}
