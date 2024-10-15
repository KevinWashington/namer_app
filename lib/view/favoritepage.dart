// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:namer_app/controller/appstate.dart';
import 'package:provider/provider.dart';


class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }
    
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Bordas arredondadas 
            ),
            elevation: 2,
            child: ListTile(
              leading: Icon(Icons.text_fields),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pair.asLowerCase,
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor, 
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero)
                          )
                        ),
                        onPressed: () {
                          appState.toggleFavorite(pair);
                        },
                        child: Icon(Icons.edit, color: Colors.grey,),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.circular(15), bottomRight: Radius.circular(15), bottomLeft: Radius.zero)
                          )
                        ),
                        onPressed: () {
                          appState.removeFavorite(pair);
                        },
                        child: Icon(Icons.delete, color: Colors.red,),
                      ),
                    ],
                  ),
                ],
              ),
              contentPadding: EdgeInsets.only(right: 0, left: 15),
            ),
          ),
      ],
    );
    
  }
}