import 'package:flutter/material.dart';
import 'categoryModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SearchBar(),
    );
  }
}

class SearchBar extends StatelessWidget {
  Future<List<Items>> fetchItems(BuildContext context) async {
    final jsonstring =
        await DefaultAssetBundle.of(context).loadString("data/data.json");
    return itemsFromMap(jsonstring);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            leading: IconButton(icon: Icon(Icons.search), onPressed: null),
            title: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search Course',
                  border: InputBorder.none,
                ),
                onTap: () {
                  print('hello');
                },
              ),
            ),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
            ],
          ),
          body: Container(
            child: FutureBuilder(
              future: fetchItems(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      Items items = snapshot.data[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                left: 20.0, bottom: 10.0, top: 15.0),
                            child: Text(
                              'Top Searches',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20.0, bottom: 10.0),
                            child: Wrap(
                              children: [
                                ActionChip(
                                  label: Text('Json'),
                                  onPressed: () {
                                    print('im action');
                                  },
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20.0, bottom: 10.0, top: 15.0),
                            child: Text(
                              'Browse Categories',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(items.img),
                            ),
                            title: Text(items.category),
                            trailing: Icon(Icons.arrow_right),
                            onTap: () {
                              print('im Categoriey');
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}

// class SearchBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.light(),
//       home: DefaultTabController(
//         length: 3,
//         initialIndex: 0,
//         child: Scaffold(
//           appBar: AppBar(
//             iconTheme: new IconThemeData(color: Colors.black),
//             backgroundColor: Colors.white,
//             leading: IconButton(icon: Icon(Icons.search), onPressed: null),
//             title: Center(
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Search Course',
//                   border: InputBorder.none,
//                 ),
//                 onTap: () {
//                   print('hello');
//                 },
//               ),
//             ),
//             actions: <Widget>[
//               IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
//             ],
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.only(left: 20.0, bottom: 10.0, top: 15.0),
//                   child: Text(
//                     'Top Searches',
//                     style: TextStyle(
//                       fontSize: 22.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 20.0, bottom: 10.0),
//                   child: Wrap(
//                     children: [
//                       ActionChip(
//                         label: Text('Json'),
//                         onPressed: () {
//                           print('im action');
//                         },
//                       ),
//                       SizedBox(
//                         width: 20.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 20.0, bottom: 10.0, top: 15.0),
//                   child: Text(
//                     'Browse Categories',
//                     style: TextStyle(
//                       fontSize: 22.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 ListTile(
//                   leading: CircleAvatar(
//                     radius: 20,
//                     backgroundColor: Colors.transparent,
//                     backgroundImage: NetworkImage(
//                         'https://www.pngitem.com/pimgs/m/403-4039144_finance-icon-supply-chain-financing-icon-hd-png.png'),
//                   ),
//                   title: Text('Finance & Accounting'),
//                   trailing: Icon(Icons.arrow_right),
//                   onTap: () {
//                     print('im Categoriey');
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
