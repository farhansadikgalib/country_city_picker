import 'package:flutter/material.dart';

class CheckData extends StatefulWidget {
  const CheckData(
      {super.key,
      required this.country,
      required this.state,
      required this.city});

  final String country, state, city;

  @override
  State<CheckData> createState() => _CheckDataState();
}

class _CheckDataState extends State<CheckData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.country,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.state,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.city,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
