import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favouriteprovider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController rotationAnimationController;

  @override
  void initState() {
    super.initState();
    rotationAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    rotationAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    bool isFavorite = favoritesProvider.isFavorite(data);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${data['name']}",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              favoritesProvider.toggleFavorite(data);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isFavorite
                      ? "Removed from favorites"
                      : "Added to favorites"),
                ),
              );
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 60),
            height: 270,
            width: 300,
            child: RotationTransition(
              turns: rotationAnimationController,
              child: SizedBox(
                height: 270,
                width: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (data['image'] as List).length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            data['image'][i],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 260),
            height: MediaQuery.of(context).size.height / 1.2,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  offset: Offset(0, 0),
                  spreadRadius: 4,
                  blurRadius: 20,
                  color: Colors.white,
                  blurStyle: BlurStyle.outer,
                )
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 350,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0, 0),
                        spreadRadius: 4,
                        blurRadius: 20,
                        color: Colors.white,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Position: ${data['position']}",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 350,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0, 0),
                        spreadRadius: 4,
                        blurRadius: 20,
                        color: Colors.white,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Velocity: ${data['velocity']} km/s",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 350,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0, 0),
                        spreadRadius: 4,
                        blurRadius: 20,
                        color: Colors.white,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Distance: ${data['distance']} Millions km",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 260,
                  width: 350,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0, 0),
                        spreadRadius: 4,
                        blurRadius: 20,
                        color: Colors.white,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 19,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Description: ${data['description']}",
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
