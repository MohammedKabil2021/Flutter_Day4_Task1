import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day4_task1/widgets/custom_btn.dart';
import 'package:flutter_day4_task1/widgets/custom_txt_field.dart';
import 'package:flutter_day4_task1/services/dio_service.dart';

class LandingScreen1 extends StatefulWidget {
  const LandingScreen1({super.key});

  @override
  State<LandingScreen1> createState() => _LandingScreen1State();
}

class _LandingScreen1State extends State<LandingScreen1> {
  final DioService _dioService = DioService();
  final TextEditingController _searchController = TextEditingController();
  Map<String, dynamic> _data = {};
  var notFound = "";

  void _navigate() {
    Navigator.pushNamed(context, "/home", arguments: _data);
  }

  void _searchWeather() async {
    String city = _searchController.text;
    try {
      final data = await _dioService.getWeather(city);
      setState(() {
        _data = data;
        notFound = "";
      });
      _navigate();
    } catch (e) {
      setState(() {
        notFound = "City Not Found";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("https://i.ibb.co/zTqxTwsy/w.png", width: 150),
            Image.network("https://i.ibb.co/SgqmJWX/sun.png", width: 350),
            CustomTxtField(
              hintTxt: "Enter a City",
              label: "",
              controller: _searchController,
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: const Color.fromARGB(255, 219, 213, 213),
            ),
            CustomBtn(
              text: "Search",
              width: 300,
              height: 50,
              backgroundColor: Colors.blue[900],
              textColor: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              borderColor: const Color.fromARGB(255, 0, 0, 0),
              borderWidth: 2.0,
              onPressed: () => {_searchWeather()},
            ),
            if (_data.isNotEmpty) ...[
              Text('Temperature: ${_data['main']['temp']}°C'),
              Text('Weather: ${_data['weather'][0]['description']}'),
            ],
            const SizedBox(height: 20),
            Text(
              notFound,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 13, 0),
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
