import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ResponsiveListScreen(),
    );
  }
}

class ResponsiveListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsive List')),
      body: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    // Use MediaQuery to get screen width and determine orientation
    double screenWidth = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    int columnCount = isPortrait ? 1 : 2;

    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
        childAspectRatio: 3, // Adjust aspect ratio as needed
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return NumberListItem(number: index + 1);
      },
    );
  }
}

class NumberListItem extends StatelessWidget {
  final int number;

  const NumberListItem({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(number.toString(), style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
