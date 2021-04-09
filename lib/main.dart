import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.balooTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'BMI Calculator',
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF9fd8df),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("BMI CALCULATOR",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200)),
            Image.asset('assets/indoorbike.png'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => InputPage(),
                ),
              ),
              child: Text(
                'Start',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  Input createState() => Input();
}

class Input extends State<InputPage> {
  double tinggi, berat, hasil = 0.000000000000000;
  String condition = " ";
  String img = " ";
  String caption = " ... ";
  final controllerTinggi = TextEditingController();
  final controllerBerat = TextEditingController();

  @override
  void dispose() {
    controllerBerat.dispose();
    controllerTinggi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF9fd8df),
      body: Center(
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF8ac4d0),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () => Navigator.pop(
                    context,
                  ),
                  child: Text('kembali ke home',
                      style: TextStyle(color: Colors.black)),
                ),
                Text("Masukkan data :",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w200)),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  onChanged: (value) {
                    tinggi = double.parse(value);

                    setState(() {
                      if ((tinggi == 0 || tinggi == null) ||
                          (berat == 0 || berat == null)) {
                        condition = "Lengkapi data terlebih dahulu!";
                        img = "meh.png";
                        caption = "hmmmm";
                      } else {

                        hasil = (berat / ((tinggi / 100) * (tinggi / 100)));

                        if (hasil >= 18.5 && hasil <= 25) {
                          condition = " Normal";
                          img = "normal.png";
                          caption = "Tetap jaga kesehatan!";
                        } else if (hasil > 25 && hasil <= 30) {
                          condition = " Overweight";
                          img = "overweight.png";
                          caption = "Tetap semangat dan jaga pola makan!";
                        } else if (hasil > 30) {
                          condition = " Obesity";
                          img = "obesity.png";
                          caption = "Ayo semangat diet!";
                        } else {
                          condition = " Underweight";
                          img = "underweight.png";
                          caption = "Jangan lupa makan!";
                        }
                        tinggi = 0.0000000000;
                      }
                    });
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Tinggi badan (cm)",
                    filled: true,
                    fillColor: Colors.white60,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  controller: controllerTinggi,
                ),
                SizedBox(height: 20),

                TextField(
                  onChanged: (value) {
                    berat = double.parse(value);

                    setState(() {
                      if ((tinggi == 0 || tinggi == null) ||
                          (berat == 0 || berat == null)) {
                        condition = "Lengkapi data terlebih dahulu!";
                        img = "meh.png";
                        caption = "hmmmm";
                      } else {

                        hasil = (berat / ((tinggi / 100) * (tinggi / 100)));

                        if (hasil >= 18.5 && hasil <= 25) {
                          condition = " Normal";
                          img = "normal.png";
                          caption = "Tetap jaga kesehatan!";
                        } else if (hasil > 25 && hasil <= 30) {
                          condition = " Overweight";
                          img = "overweight.png";
                          caption = "Tetap semangat dan jaga pola makan!";
                        } else if (hasil > 30) {
                          condition = " Obesity";
                          img = "obesity.png";
                          caption = "Ayo semangat diet!";
                        } else {
                          condition = " Underweight";
                          img = "underweight.png";
                          caption = "Jangan lupa makan!";
                        }
                         berat = 0.0000000000;
                      }
                    });
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Berat badan (kg)",
                      filled: true,
                      fillColor: Colors.white60,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                  controller: controllerBerat,
                ),
              ],
            ),
          ),
          RichText(
              text: TextSpan(
            text: "$condition",
          )),
          Container(
            height: 400,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: <Widget>[
                Text(hasil.toStringAsFixed(2)),
                Container(
                  child: Image.asset("assets/$img"),
                ),
                Text(caption),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
