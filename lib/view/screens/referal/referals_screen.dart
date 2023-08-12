import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Referrals extends StatelessWidget {
  const Referrals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Referrals',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color(0xff1C6CC3),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 320,
              width: 330,
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text(
                            "Name",
                            style: TextStyle(
                                color: Color(0xff7EACDD),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                          child: Text(
                            "G BABU",
                            style: TextStyle(
                                color: Color(0xff2E2E2E),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text(
                            "Refferal",
                            style: TextStyle(
                                color: Color(0xff7EACDD),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
                          child: Text(
                            "Karthik",
                            style: TextStyle(
                                color: Color(0xff2E2E2E),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text(
                            "Membership",
                            style: TextStyle(
                                color: Color(0xff7EACDD),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                          child: Text(
                            "GOLD",
                            style: TextStyle(
                                color: Color(0xff2E2E2E),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff1C6CC3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(8, 8, 25, 8),
                                  child: Text(
                                    "Total Ponits",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                              child: Text(
                                "7572.69",
                                style: TextStyle(
                                    color: Color(0xff2E2E2E),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                                child: Text(
                                  "Joined Date",
                                  style: TextStyle(
                                      color: Color(0xff7EACDD),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(45, 5, 0, 0),
                                child: Text(
                                  "28-05-2023",
                                  style: TextStyle(
                                      color: Color(0xff2E2E2E),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            "My Watch Ponits",
                            style: TextStyle(
                                color: Color(0xff7EACDD),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                          child: Text(
                            "5930.0",
                            style: TextStyle(
                                color: Color(0xff2E2E2E),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            "Refferal Ponits",
                            style: TextStyle(
                                color: Color(0xff7EACDD),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                          child: Text(
                            "1400.0",
                            style: TextStyle(
                                color: Color(0xff2E2E2E),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 330,
              height: 50,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
              child: const Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                child: Text(
                  "User43",
                  style: TextStyle(
                      color: Color(0xff2E2E2E),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              width: 330,
              height: 50,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                child: Text(
                  "Sravanan",
                  style: TextStyle(
                      color: Color(0xff2E2E2E),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 85),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    // Action to perform when the button is clicked
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Make the button rounded
                    ),
                  ),
                  child: Text("Share Link", style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
