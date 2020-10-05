import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(home: HomePage(),));

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Sqfilte Example'),),

      body: Column(
        children: <Widget>[
          FlatButton(onPressed: (){}, child: Text('insert'),color: Colors.grey[400],),
          FlatButton(onPressed: (){}, child: Text('query'),color: Colors.green[400],),
          FlatButton(onPressed: (){}, child: Text('update'),color: Colors.blue[400],),
          FlatButton(onPressed: (){}, child: Text('delete'),color: Colors.red[400],),

        ],
      ),
    );
  }
}