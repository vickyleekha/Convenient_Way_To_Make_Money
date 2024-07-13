
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget buildLoading() => const Center(child: CircularProgressIndicator());

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.blueAccent,
      textColor: Colors.white);
}

List<DateTime> calculateDaysInterval(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
  return days;
}








// 1 week data ke liye
// int sales = 0,
//     cash = 0,
//     wallet = 0,
//     other = 0,
//     creditCard = 0,
//     orders = 0,
//     payment = 0;
// void dataAmount(List<SalesReportResponse> salesList) {
//   for (int i = 0; i < salesList.length; i++) {
//     sales = salesList[i].sales + sales;
//     cash = salesList[i].cash + cash;
//     wallet = salesList[i].wallet + wallet;
//     creditCard = salesList[i].creditCard + creditCard;
//     other = salesList[i].others + other;
//     orders = salesList[i].orders + orders;
//   }
// }

// class Utils {
//   static String validateName(String value) {
//     if (value.length < 3) {
//       return 'Name must be more than 2 charater';
//     } else {
//       return "";
//     }
//   }
//
//   static String validateMobile(String value) {
//     if (value.length != 10) {
//       return 'Mobile Number must be of 10 digit';
//     } else {
//       String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//       RegExp regExp = RegExp(patttern);
//       if (value.isEmpty) {
//         return 'Please enter mobile number';
//       } else if (!regExp.hasMatch(value)) {
//         return 'Please enter valid mobile number';
//       }
//
//       if (int.parse(value) < 4000000000) {
//         return 'Please enter valid mobile number';
//       } else {
//         return "";
//       }
//     }
//   }
//
//   static String validateEmail(String value) {
//     String pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = RegExp(pattern);
//     if (!regex.hasMatch(value)) {
//       return 'Enter Valid Email';
//     } else {
//       return "";
//     }
//   }
// }
