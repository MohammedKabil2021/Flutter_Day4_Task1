import 'package:flutter/material.dart';
import 'package:flutter_day4_task1/widgets/custom_btn.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;

    if (args == null) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 47, 111, 221),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.white),
              SizedBox(height: 10),
              Text("Loading data...", style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 111, 221),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 30,
                    color: Colors.white,
                  ),

                  SizedBox(width: 8),

                  Flexible(
                    child: Text(
                      args['name'] ?? 'Unknown City',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Text(
                "${args['main']?['feels_like'] ?? '--'}°C",
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              SizedBox(height: 10),
              Text(
                args['weather']?[0]?['description'] ?? 'No description',
                style: TextStyle(color: Colors.white, fontSize: 25),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Min ${args['main']?['temp_min'] ?? '--'} °C',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    SizedBox(width: 10),

                    Flexible(
                      child: Text(
                        'Max ${args['main']?['temp_max'] ?? '--'} °C',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 56, 123, 240),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInfoRow(
                      Icons.cloud,
                      "${args['clouds']?['all'] ?? '--'}%",
                    ),

                    _buildInfoRow(
                      Icons.wind_power,
                      "${args['wind']?['speed'] ?? '--'} m/s",
                    ),

                    _buildInfoRow(
                      Icons.water_drop,
                      "${args['main']?['humidity'] ?? '--'}%",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 56, 123, 240),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "April, 29",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildForecastColumn(
                          "${args['clouds']?['all'] ?? '--'}%",
                          Icons.cloud,
                          "12:00",
                        ),

                        _buildForecastColumn(
                          "${args['wind']?['speed'] ?? '--'} m/s",
                          Icons.wind_power,
                          "15:00",
                        ),

                        _buildForecastColumn(
                          "${args['main']?['temp_max'] ?? '--'} °C",
                          Icons.sunny,
                          "18:00",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              CustomBtn(
                text: "Back to Home",
                width: 150,
                height: 50,
                backgroundColor: Colors.blue[900],
                textColor: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                borderColor: const Color.fromARGB(255, 0, 0, 0),
                borderWidth: 2.0,
                onPressed: () => {Navigator.pushNamed(context, "/")},
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        SizedBox(width: 5),
        Text(text, style: TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }

  Widget _buildForecastColumn(String value, IconData icon, String time) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: Colors.white, fontSize: 14)),
        SizedBox(height: 8),
        Icon(icon, color: Colors.white, size: 30), // حجم أيقونة مناسب
        SizedBox(height: 8),
        Text(time, style: TextStyle(color: Colors.white, fontSize: 14)),
      ],
    );
  }
}
