f// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting ni
import 'package:flutter/material.dart'; 
 
void main() => runApp(MyApp()); 
 
class MyApp extends StatelessWidget { 
  // This widget is the root of your application. 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Flutter Demo', 
      theme: ThemeData( 
        primarySwatch: Colors.blue, 
      ), 
      home: MyHomePage(title: 'Product layout demo home page'), 
    ); 
  } 
} 
 
class MyHomePage extends StatelessWidget { 
  MyHomePage({Key? key, required this.title}) : super(key: key); 
 
  final String title; 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
        appBar: AppBar(title: Text("Product Listing")), 
        body: ListView( 
        shrinkWrap: true, 
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0), 
        children: <Widget>[ 
        ProductBox( 
        name: "iPhone", 
        description: "iPhone is the stylist phone ever", 
        price: 1000, 
        image: "phone.png"), 
        ProductBox( 
        name: "Pixel", 
        description: "Pixel is the most featureful phone ever", 
        price: 800, 
        image: "pixel.png"), 
        ProductBox( 
        name: "Laptop", 
        description: "Laptop is most productive development tool", 
        price: 2000, 
        image: "laptop.png"), 
        ProductBox( 
        name: "Tablet", 
        description: "Tablet is the most useful device ever for meeting", 
        price: 1500, 
        image: "tablet.png"), 
        ProductBox( 
        name: "Pendrive", 
        description: "iPhone is the stylist phone ever", 
        price: 100, 
        image: "pen.png"), 
        ProductBox( 
        name: "Floppy Drive", 
        description: "iPhone is the stylist phone ever", 
        price: 20, 
        image: "floppy.png"),  
        ], 
        )); 
        } 
        } 
        class RatingBox extends StatefulWidget { 
        @override 
        _RatingBoxState createState() => _RatingBoxState(); 
        } 
        class _RatingBoxState extends State<RatingBox> { 
          int _rating = 0; 
void _setRatingAsOne() { 
setState( () { 
_rating = 1; 
}); 
} 
void _setRatingAsTwo() { 
setState( () { 
_rating = 2; 
}); 
} 
void _setRatingAsThree() { 
setState( () { 
_rating = 3; 
}); 
} 
Widget build(BuildContext context) { 
double _size = 20; 
print(_rating); 
return Row( 
mainAxisAlignment: MainAxisAlignment.end, 
crossAxisAlignment: CrossAxisAlignment.end, 
mainAxisSize: MainAxisSize.max, 
children: <Widget>[ 
Container( 
padding: EdgeInsets.all(0), 
child: IconButton( 
icon: (_rating >= 1 ? Icon(Icons.star, size: _size,) : 
Icon(Icons.star_border, size: _size,)), 
color: Colors.red[500], 
onPressed: _setRatingAsOne, 
iconSize: _size, 
), 
), 
Container( 
padding: EdgeInsets.all(0), 
child: IconButton( 
icon: (_rating >= 2 ? Icon(Icons.star, size: _size,) : 
Icon(Icons.star_border, size: _size,)), 
color: Colors.red[500], 
onPressed: _setRatingAsTwo, 
iconSize: _size, 
), 
), 
Container( 
padding: EdgeInsets.all(0), 
child: IconButton( 
icon: (_rating >= 3 ? Icon(Icons.star, size: _size,) : 
Icon(Icons.star_border, size: _size,)), 
 color: Colors.red[500], 
            onPressed: _setRatingAsThree, 
            iconSize: _size, 
          ), 
        ), 
 
      ], 
    ); 
  } 
} 
 
class ProductBox extends StatelessWidget { 
  ProductBox({Key? key, required this.name, required this.description, required this.price, required this.image}) 
      : super(key: key); 
 
  final String name; 
  final String description; 
  final int price; 
  final String image; 
 
  Widget build(BuildContext context) { 
    return Container( 
        padding: EdgeInsets.all(2), 
        height: 140, 
        child: Card( 
            child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                children: <Widget>[ 
                  Image.asset("assets/appimages/" + image), 
                  Expanded( 
                      child: Container( 
                          padding: EdgeInsets.all(5), 
                          child: Column( 
                            mainAxisAlignment: 
MainAxisAlignment.spaceEvenly, 
                            children: <Widget>[ 
                              Text(this.name, 
                                  style: TextStyle(fontWeight: 
FontWeight.bold)), 
                              Text(this.description), 
                              Text("Price: " + this.price.toString()), 
                              RatingBox(), 
                            ], 
                          ))) 
                ]))); 
  } 
}