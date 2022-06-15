import 'package:api_to_sqlite/src/providers/db_provider.dart';
import 'package:api_to_sqlite/src/providers/avengers_api_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Avengers List',
          style: TextStyle(color: Colors.white, backgroundColor: Colors.black),
        ),
        centerTitle: true,
        flexibleSpace: Image.network(
          "https://blogdesuperheroes.es/wp-content/plugins/BdSGallery/BdSGaleria/4679.jpg",
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.settings_input_antenna),
              onPressed: () async {
                await _loadFromApi();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await _deleteData();
              },
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildAvengersListView(),
      backgroundColor: Colors.white,
    );
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = AvengersApiProvider();
    await apiProvider.getAllAvengers();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  _deleteData() async {
    setState(() {
      isLoading = true;
    });

    await DBProvider.db.deleteAllAvengers();

    // wait for 1 second to simulate loading of data
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

    // ignore: avoid_print
    print('All avengers deleted');
  }

  _buildAvengersListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllAvengers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.network(
                  "${snapshot.data[index].img}",
                  height: 100,
                  width: 100,
                  fit: BoxFit.scaleDown,
                ),
                title: Text("${snapshot.data[index].nickname}"),
                subtitle: Text(
                    "Name: ${snapshot.data[index].name} ${snapshot.data[index].lastname}"),
              );
            },
          );
        }
      },
    );
  }
}
