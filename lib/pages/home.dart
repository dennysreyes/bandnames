import 'package:band_app/models/band.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Band> bands = [
    Band(id: '1', name: 'Metalica', votes: 5),
    Band(id: '2', name: 'Linkin park', votes: 11),
    Band(id: '3', name: 'Cannons', votes: 8),
    Band(id: '4', name: 'BMTH', votes: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Band Names'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTile(bands[i]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        elevation: 1,
        child: const Icon(Icons.add),
      ),
    );
  }

  addNewBand() {
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('New band name:'),
          content: TextField(
            controller: textController,
          ),
          actions: <Widget>[
            MaterialButton(
              textColor: Colors.blue,
              elevation: 5,
              onPressed: () {
                addBandList(textController.text);
              },
              child: const Text('Add'),
            )
          ],
        );
      },
    );
  }

  void addBandList(String name) {
    if (name.length > 1) {
      bands.add(Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }

    Navigator.pop(context);
  }

  Widget _bandTile(Band bands) {
    return Dismissible(
      key: Key(bands.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        // direction
      },
      background: Container(
        padding: const EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'delete band',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(bands.name.substring(0, 2)),
        ),
        title: Text(bands.name),
        trailing: Text(
          '${bands.votes}',
          style: const TextStyle(fontSize: 20),
        ),
        // onTap: () => ?,
      ),
    );
  }
}
