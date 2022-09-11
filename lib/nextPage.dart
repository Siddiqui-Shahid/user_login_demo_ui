import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextPage extends StatefulWidget {
  final String name;
  final String birthday;
  final String email;
  const NextPage(
      {Key? key,
      required this.name,
      required this.birthday,
      required this.email})
      : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(
          top: 100.0,
          bottom: 30.0,
          right: 30.0,
          left: 30.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Registration Successful",
                style: GoogleFonts.comfortaa(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                "Your Details are submitted sucessfullt",
                style: GoogleFonts.comfortaa(
                  fontSize: 15.0,
                  color: Colors.black26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Table(
                border: TableBorder.all(color: Colors.black),
                children: [
                  buildRow(['Name', 'Birthday', 'Email Id']),
                  buildRow([widget.name, widget.birthday, widget.email]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildRow(List<String> list) {
    return TableRow(
      children: list
          .map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(e),
              ))
          .toList(),
    );
  }
}
