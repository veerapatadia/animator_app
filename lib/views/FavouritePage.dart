import 'package:animator_app/views/DetailPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favouriteprovider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: true,
      ),
      body: favoritesProvider.favorites.isEmpty
          ? Center(
              child: Text(
                "No favorites yet!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: favoritesProvider.favorites.length,
              itemBuilder: (context, index) {
                final planet = favoritesProvider.favorites[index];

                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      planet['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      planet['description'],
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        favoritesProvider.toggleFavorite(planet);
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(),
                          settings: RouteSettings(arguments: planet),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
