import 'package:flutter/material.dart';
import 'package:sqlite/database_helper.dart';

void main()=>runApp(MaterialApp(home: HomePage(),));

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Sqfilte Example'),),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(onPressed: () async {

              int i = await DatabaseHelper.instance.insert({  //note: await always need async
                DatabaseHelper.columnName : 'Saheb',
              });

              print('the inserted id is $i');

            }, child: Text('insert'),color: Colors.grey[400],),
            FlatButton(onPressed: () async{

              List<Map<String,dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
              print(queryRows);

            }, child: Text('query'),color: Colors.green[400],),
            FlatButton(onPressed: () async{
              int updatedId = await DatabaseHelper.instance.update({
                DatabaseHelper.columnId: 12,
                DatabaseHelper.columnName: 'Mark'
              });

              print(updatedId);

            }, child: Text('update'),color: Colors.blue[400],),
            FlatButton(onPressed: () async{
              int rowsEffected = await DatabaseHelper.instance.delete(13);
              print(rowsEffected);
            }, child: Text('delete'),color: Colors.red[400],),

          ],
        ),
      ),
    );
  }
}