import 'dart:io';

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  
  final _formKey = GlobalKey<FormState>();

  final TextEditingController f_name = TextEditingController();
  final TextEditingController l_name = TextEditingController();
  final TextEditingController bs = TextEditingController();

  List<String> department = ["Accounting", "Sales", "Management", "Clerk"];

  String? d_list;
  String? gender = "";
  String? m_status = "";

  void clear() {
    _formKey.currentState?.reset();
    f_name.clear();
    l_name.clear();
    bs.clear();
    setState(() {
      gender= null;
      m_status=null;
      d_list=null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                exit(1);
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          title: Text("Salary Calculator"),
          actions: [Icon(Icons.account_box_outlined)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Row(
                  children: [
                    Text("Firstname : "),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: f_name,
                        decoration:
                            InputDecoration(border: UnderlineInputBorder()),
                      ),
                    ))
                  ],
                ),
                Row(
                  children: [
                    Text("Lastname : "),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: l_name,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                        ),
                      ),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Text("department : "),
                    Flexible(
                      child: DropdownButtonFormField(
                          items: department.map((String filtereddepartment) {
                            return DropdownMenuItem(
                              child: Text(filtereddepartment),
                              value: filtereddepartment,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              d_list = value;
                            });
                          }),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Gender : "),
                    SizedBox(
                      width: 28,
                    ),
                    Text("Male"),
                    Radio(
                        value: "male",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        }),
                    Text("Femlae"),
                    Radio(
                        value: "Female",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        }),
                    Text("Other"),
                    Radio(
                        value: "Other",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        })
                  ],
                ),
                Row(
                  children: [
                    Text("Marital  : "),
                    SizedBox(
                      width: 25,
                    ),
                    Text("Single"),
                    Radio(
                        value: "Single",
                        groupValue: m_status,
                        onChanged: (value) {
                          setState(() {
                            m_status = value!;
                          });
                        }),
                    Text("Marrid"),
                    Radio(
                        value: "Marrid",
                        groupValue: m_status,
                        onChanged: (value) {
                          setState(() {
                            m_status = value!;
                          });
                        })
                  ],
                ),
                Row(
                  children: [
                    Text("Salary :"),
                    Flexible(
                        child: TextFormField(
                      controller: bs,
                      decoration:
                          InputDecoration(border: UnderlineInputBorder()),
                    ))
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Submit")),
                      ElevatedButton(
                          onPressed: () {
                            clear();
                          },
                          child: Text("Clear"))
                    ],
                  ),
                ),
                // Expanded(
                //   child: Row(

                //   children: [
                //     Expanded(child: Column(children: [Text("Label"),Text("Label")],)),
                //     Expanded(child: Column(children: [Text("Value"),Text("value")],))
                //   ]
                //                 ),
                // )
              ],
            ),
          ),
        ));
  }
}
