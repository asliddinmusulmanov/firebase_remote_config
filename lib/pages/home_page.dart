import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase_remote_config/data/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final remoteConfig = FirebaseRemoteConfig.instance;
  static Map<String, Color> colors = {
    'red': Colors.red,
    'yellow': Colors.yellow,
    'indigo': Colors.indigo,
  };

  static String backgroundColor = 'white';
  static int fasl = 1;
  // Map<String, dynamic> myapp = {"color": "red", "fasl": "bahor"};
  static String productname = "Sharf";
  static int productcount = 20;

  Future<void> onInit() async {
    remoteConfig.setDefaults({
      'backgroundColor': backgroundColor,
      'fasl': fasl,
      // "myapp": myapp,
      'productname': productname,
      'productcount': productcount,
    });
    await fetch();
    remoteConfig.onConfigUpdated.listen((event) async {
      await fetch();
    });
    setState(() {});
  }

  Future<void> fetch() async {
    await remoteConfig.fetchAndActivate().then(
      (value) {
        backgroundColor = remoteConfig.getString('backgroundColor');
        fasl = remoteConfig.getInt('fasl');
        // myapp = remoteConfig.getAll();
        productname = remoteConfig.getString('productname');
        productcount = remoteConfig.getInt('productcount');
      },
    );
    setState(() {});
  }

  @override
  void initState() {
    onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image.network(
          fasl == 1
              ? "https://wallpapercave.com/uwp/uwp1694908.gif"
              : fasl == 2
                  ? 'https://media3.giphy.com/media/MF1z8yeGEauJfZNwOL/giphy.gif?cid=6c09b952698keejs5zjj8ic2ae9n9b8l89dgs1n7cd8b2574&ep=v1_gifs_search&rid=giphy.gif&ct=g'
                  : fasl == 3
                      ? 'https://i.gifer.com/origin/da/daeff1091515195a5ec9f92ae426c326_w200.gif'
                      : 'https://i.pinimg.com/originals/3a/a5/e9/3aa5e9bec2763e7c57ae74390f3cfedb.gif',
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        // actions: [
        //   Text(
        //     fasl == 1
        //         ? 'Spring'
        //         : fasl == 2
        //             ? 'Summer'
        //             : fasl == 3
        //                 ? 'Autumn'
        //                 : 'Winter',
        //     style: const TextStyle(
        //       fontSize: 34,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemCount: productcount,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                ListTile(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const DetailPage(),
                    //   ),
                    // );
                  },
                  title: Container(
                    alignment: Alignment.center,
                    height: 190,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          productsList[index].image,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      // color: Colors.black,
                    ),
                    child: Text(
                      '\nName: ${productsList[index].name}\nSize: ${productsList[index].size}\nPrice: ${productsList[index].price}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // child: Column(
                    //   children: [
                    //     Expanded(
                    //       flex: 4,
                    //       child: Column(
                    //         children: [
                    //           Text(productsList[index].name),
                    //           Text(productsList[index].size),
                    //           Text(productsList[index].price),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // child:
                  ),
                ),
              ],
            );
          },
        ),
      ),
      // body: Center(
      //   child: Text(myapp['fasl']),
      // ),
      // backgroundColor: BackgroundColor.colors[BackgroundColor.backgroundColor],
      backgroundColor: colors[backgroundColor],
    );
  }
}
