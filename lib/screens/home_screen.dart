import 'package:flutter/material.dart';
import 'package:flutter_api_test/models/data_model.dart';
import 'package:flutter_api_test/networking/networking.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // the code below is used to use the provider to get the data from api
    Provider.of<Networking>(context).getData();
  }

  late Future<List<DataModel>?> dataModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Networking>(context).getData();

    // the below line of code is for debugging purpose
    debugPrint("Test");

    return Scaffold(
      body: FutureBuilder<List<DataModel>?>(
        future: Provider.of<Networking>(context).getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].name.toString()),
                    subtitle: Text(
                        snapshot.data![index].description.toString() +
                            "    " +
                            snapshot.data![index].category.toString()),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
