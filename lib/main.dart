

import 'package:convenient_thought/bloc/BlocEvent.dart';
import 'package:convenient_thought/bloc/BlocState.dart';
import 'package:convenient_thought/bloc/TransactionBloc.dart';
import 'package:convenient_thought/ui/Books.dart';
import 'package:convenient_thought/ui/ValueLessons.dart';
import 'package:convenient_thought/ui/content.dart';
import 'package:convenient_thought/utils/Utils.dart';
import 'package:convenient_thought/utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'App DashBoard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TransactionBloc transactionBloc = TransactionBloc();

  @override
  void initState() {
    super.initState();
    transactionBloc.add(GetImages(path: "/Images?pageSize=100&where=type%3D'Quotes'"));
  }

  Widget data() {
    return BlocProvider(
      create: (_) => transactionBloc,
      child: BlocListener<TransactionBloc, BlocState>(
        listener: (context, state) {
          if (state is Error) {
            showToast(state.message!);
          }
        },
        child: BlocBuilder<TransactionBloc, BlocState>(
          builder: (context, state) {
            if (state is Initial) {
              return buildLoading();
            } else if (state is Loading) {
              return Container(child: buildLoading());
            } else if (state is Loaded) {
              return Scaffold(
                body: SafeArea(
                  child: Stack(
                    children: <Widget>[
                      DefaultTabController(
                          length: 4,
                          child: Column(children: <Widget>[
                            Container(
                              color: Colors.grey,
                              child: ButtonsTabBar(
                                backgroundColor: Colors.red,
                                unselectedBackgroundColor: Colors.grey[300],
                                unselectedLabelStyle:
                                    const TextStyle(color: Colors.black),
                                labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                tabs: const [
                                  Tab(
                                    // icon: Icon(Icons.directions_car),
                                    text: "Content of Day",
                                  ),
                                  Tab(
                                    // icon: Icon(Icons.directions_car),
                                    text: "Quotes",
                                  ),
                                  // Tab(
                                  //   icon: Icon(Icons.directions_transit),
                                  //   text: "Stories",
                                  // ),
                                  // Tab(icon: Icon(Icons.directions_bike),  text: "Comics",),
                                  Tab(
                                    // icon: Icon(Icons.directions_car),
                                    text: "Value Lessons",),
                                  Tab(
                                    // icon: Icon(Icons.directions_transit),
                                    text: "Book's Highlight",
                                  ),
                                  // Tab(icon: Icon(Icons.settings),  text: "Settings",),
                                ],
                              ),
                            ),
                     Expanded(
                              child: TabBarView(
                                children: <Widget>[

                                const ContentOfTheDay(),

                                  gridViewImages(state.itemValue),
                                  // const Center(
                                  //   child:  Text("Coming Soon"),
                                  // ),
                                  // const Center(
                                  //   child:  Text("Coming Soon"),
                                  // ),  const Center(
                                  //   child:  Text("Coming Soon"),
                                  // ),
                                const ValueLessons(),
                                  const Books(),
                                  // const SettingPage(),
                                ],
                              ),
                            ),
                          ])),
                    ],
                  ),
                ),
              );
            } else if (state is Error) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return data();
  }
}
