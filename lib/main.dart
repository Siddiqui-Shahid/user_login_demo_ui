import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_login_demo_ui/Record.dart';
import 'package:user_login_demo_ui/constant.dart';
import 'package:user_login_demo_ui/nextPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? date = "1";
  String? mon = "Jan";
  String? saal = "1995";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //"Welcome User "
                Text(
                  "Welcome User",
                  style: GoogleFonts.comfortaa(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                //"Distance between Welcome and please statement"
                const SizedBox(
                  height: 8.0,
                ),
                //"Please Enter your details"
                Text(
                  "Please Enter your details",
                  style: GoogleFonts.comfortaa(
                    fontSize: 15.0,
                    color: Colors.black26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // Name text field label
                Text(
                  "Name",
                  style: GoogleFonts.comfortaa(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintStyle: builtTextStyle(size: 15, color: Colors.black12),
                  ),
                  // validator: (name) {
                  //   if ((name == null || name.isEmpty) &&
                  //       name!.trim().length > 3) {
                  //     return "Please Enter Your Name";
                  //   }
                  //   return "";
                  // }
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // Date text field label
                Text(
                  "Birth Date",
                  style: GoogleFonts.comfortaa(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                // The Row which inputs the date.
                Row(
                  children: [
                    // month
                    Expanded(
                      flex: 15,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                            )),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            // hint: Text(
                            //   "Month",
                            //   style: builtTextStyle(
                            //       size: 12.0, color: Colors.black26),
                            // ),
                            items: month.map(buildMenu).toList(),
                            value: mon,
                            onChanged: (Month) {
                              print(Month);
                              setState(() {
                                mon = Month;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    // day
                    Expanded(
                      flex: 12,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Text(
                              "Day",
                              style: builtTextStyle(
                                  size: 12.0, color: Colors.black26),
                            ),
                            items: day.map(buildMenu).toList(),
                            value: date,
                            onChanged: (Date) {
                              print(Date);
                              setState(() {
                                date = Date;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    // year
                    Expanded(
                      flex: 15,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            )),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Text(
                              "Year",
                              style: builtTextStyle(
                                  size: 12.0, color: Colors.black26),
                            ),
                            items: year.map(buildMenu).toList(),
                            value: saal,
                            onChanged: (Saal) {
                              setState(() {
                                saal = Saal;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                // Email id text field label
                Text(
                  "Email ID",
                  style: GoogleFonts.comfortaa(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintStyle: builtTextStyle(size: 15, color: Colors.black12),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: [AutofillHints.email],
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? "Enter a valid Email"
                          : "",
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffff7000)),
                    ),
                    onPressed: () {
                      String name = nameController.text;
                      String email = emailController.text;
                      String date = SelectedDate(
                        day: this.date ?? "-",
                        month: mon ?? "-",
                        year: saal ?? "-",
                      );
                      print("......................" + name);
                      print("......................" + email);
                      print("......................" + date);
                      final add = Rec(name: name, date: date, email: email);
                      print("objectobjectobjectobjectobject$add");
                      recordEntered.add(add);
                      print(recordEntered);
                      for (int i = 0; i < recordEntered.length; i++) {
                        print(recordEntered[i].name);
                        print(recordEntered[i].date);
                        print(recordEntered[i].email);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NextPage(
                                  name: name,
                                  email: email,
                                  birthday: date,
                                )),
                      );
                    },
                    child: Text(
                      "Submit",
                      style: builtTextStyle(size: 15.0, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenu(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: builtTextStyle(size: 15.0),
      ));
}

TextStyle builtTextStyle({double size = 25, Color color = Colors.black}) {
  return GoogleFonts.comfortaa(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w900,
  );
}

String SelectedDate(
    {required String day, required String month, required String year}) {
  if (day == "-") {
    return day;
  }
  String ans = month + " ";
  if (day == "1") {
    ans += "1st";
  } else if (day == "2") {
    ans += "2nd";
  } else if (day == "3") {
    ans += "3rd";
  } else {
    ans += ("${day}th");
  }
  ans += " $year";

  print("......................" + ans);
  return ans;
}
