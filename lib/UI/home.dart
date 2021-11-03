import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Api/Api.dart';
import 'package:myapp/Models/InitDeviceModels/InitDeviceResponseModel.dart';
import 'package:myapp/Provider/ChangeUI.dart';
import 'package:myapp/UI/SecondPage.dart';
import 'package:provider/provider.dart';

class HomePageStateless extends StatefulWidget {
  @override
  State<HomePageStateless> createState() => _HomePageStatelessState();
}

class _HomePageStatelessState extends State<HomePageStateless> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  final List<String> images = <String>[
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
  ];

  final List<String> title = <String>[
    'Hello',
    'Hello',
    'Hello',
    'Hello',
    'Hello',
    'Hello',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: Icon(Icons.check),
          backgroundColor: Color(0xFFE57373),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SecondPage()));
          }),
      body: StreamBuilder<InitResponseModel>(
          stream: InitService().initDevice(context).asStream(),
          builder: (context, snapshot) {
            return RefreshIndicator(
              key: refreshKey,
              onRefresh: refreshList,
              child: SafeArea(
                child: Column(
                  children: [
                    snapshot.hasData
                        ? Container(
                            child: Center(
                                child:
                                    Text(snapshot.data.accessToken.toString())),
                            width: MediaQuery.of(context).size.width)
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    Expanded(
                        child: Consumer<UIProvider>(
                      builder: (context, listViewProvider, child) => Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              listViewProvider.toggleView();
                            },
                            icon: Icon(listViewProvider.isListView
                                ? Icons.more_vert
                                : Icons.more_horiz),
                          ),
                          Expanded(
                            child: listViewProvider.isListView
                                ? ListView.builder(
                                    padding: const EdgeInsets.all(8),
                                    itemCount: images.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: ListTile(
                                          leading: Container(
                                            height: Get.height * 0.3,
                                            width: Get.width * 0.25,
                                            child: Image.asset(
                                              images[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          title: Text(title[index]),
                                        ),
                                      );
                                    })
                                : GridView.builder(
                                    itemCount: images.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              images[index],
                                              fit: BoxFit.cover,
                                            ),
                                            Text(title[index])
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future<void> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      InitService().initDevice(context).asStream();
    });
  }
}
