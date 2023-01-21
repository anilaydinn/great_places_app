import 'package:flutter/material.dart';
import 'package:great_places_app/provider/great_places.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: const Center(
          child: Text("Got no places yet, start adding some!"),
        ),
        builder: (context, greatPlaces, child) {
          return greatPlaces.items.isEmpty
              ? child!
              : ListView.builder(
                  itemCount: greatPlaces.items.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(greatPlaces.items[index].image),
                    ),
                    title: Text(greatPlaces.items[index].title),
                    onTap: () {
                      // Go to detail page
                    },
                  ),
                );
        },
      ),
    );
  }
}
