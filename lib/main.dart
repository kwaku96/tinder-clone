import 'package:flutter/material.dart';
import 'package:tinder_clone/components/DraggableCard.dart';
import 'components/RoundIconButton.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorBrightness: Brightness.light
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_buildAppBar(context),
      bottomNavigationBar: _buildBottomBar(context),
      body: DraggableCard(),
    );
  }

  Widget _buildAppBar(BuildContext context){
    return  AppBar(
      leading: IconButton(
        icon: Icon(Icons.person),
        onPressed: (){},
        color: Colors.grey,
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: FlutterLogo(colors: Colors.red,size: 30.0,),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.chat_bubble),
          onPressed: (){},
          color: Colors.grey,
        )
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context){
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundIconButton.small(
              icon: Icons.refresh,
              iconColor: Colors.orange,
              onPressed: (){},
            ),
            RoundIconButton.large(
              icon:Icons.clear,
              iconColor: Colors.red,
              onPressed: (){},
            ),
            RoundIconButton.small(
              icon: Icons.star,
              iconColor: Colors.blue,
              onPressed: (){},
            ),
            RoundIconButton.large(
              icon:Icons.favorite,
              iconColor: Colors.green,
              onPressed: (){},
            ),
            RoundIconButton.small(
              icon: Icons.lock,
              iconColor: Colors.purple,
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}

