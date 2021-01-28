import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

/* Переход по ссылке, знакомство с виджетами
Установка и использование пакета url_launcher
class MyBody extends StatelessWidget{
  Widget build(BuildContext context) {
    return new Center(child: new Column(
        children: [
          new Text('Здравствуй, мир!'),
          new FlatButton(onPressed: (){}, child: Text('открыть сайт'), color: Colors.indigoAccent, textColor: Colors.black87,)]
    ));
  }
}
void main() {
  runApp(
      new MaterialApp(
          debugShowCheckedModeBanner: false,
          home: new Scaffold(
              appBar: new AppBar(title: new Text('Пример приложения')),
              body: new MyBody()
          )
      )
  );
}
*/

/*
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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
/* использование StatelessWidget
void main() =>  runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(),
            body: new NewsBox('Новый урок по Flutter', '''В новом уроке рассказывается в каких случаях применять класс StatelessWidget и StatefulWidget. Приведены примеры их использования.''',
                imageurl: 'https://flutter.su/favicon.png')
        )
    )
);

class NewsBox extends StatelessWidget {
  final String _title;
  final String _text;
  String _imageurl;

  NewsBox(this._title, this._text, {String imageurl}) {
    _imageurl = imageurl;
  }

  @override
  Widget build(BuildContext context) {
    if (_imageurl != null && _imageurl != '') return new Container(
        color: Colors.black12,
        height: 100.0,
        child: new Row(children: [
          new Image.network(_imageurl, width: 100.0, height: 100.0, fit: BoxFit.cover,),
          new Expanded(child: new Container(padding: new EdgeInsets.all(5.0), child: new Column(children: [
            new Text(_title,  style: new TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
            new Expanded(child:new Text(_text, softWrap: true, textAlign: TextAlign.justify,))
          ]
          ))
          )
        ])
    );

    return new Container(
        color: Colors.black12,
        height: 100.0,
        child: new Row(children: [
          new Expanded(child: new Container(padding: new EdgeInsets.all(5.0), child: new Column(children: [
            new Text(_title, style: new TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
            new Expanded(child:new Text(_text, softWrap: true, textAlign: TextAlign.justify,))
          ]
          ))
          )
        ])
    );
  }
}
*/

/* Использование StatefulWidget
class NewsBoxFavourit extends StatefulWidget {
  final int _num;
  final bool _like;

  NewsBoxFavourit(this._num, this._like);

  @override
  createState() => new NewsBoxFavouritState(_num, _like);
}

class NewsBoxFavouritState extends State<NewsBoxFavourit> {
  int num;
  bool like;

  NewsBoxFavouritState(this.num, this.like);

  void pressButton() {
    setState(() {
      like = !like;

      if(like) num++;
      else num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(children: [
    new Text('В избранном $num', textAlign: TextAlign.center),
    new IconButton(
    icon: new Icon(like ? Icons.star : Icons.star_border, size: 30.0, color: Colors.blue[500]),
    onPressed: pressButton
    )
    ]);
  }
}

class NewsBox extends StatelessWidget {
  final String _title;
  final String _text;
  String _imageurl;
  int _num;
  bool _like;

  NewsBox(this._title, this._text, {String imageurl, int num = 0, bool like = false}) {
    _imageurl = imageurl;
    _num = num;
    _like = like;
  }

  @override
  Widget build(BuildContext context) {
    if (_imageurl != null && _imageurl != '') return new Container(
        color: Colors.black12,
        height: 100.0,
        child: new Row(children: [
          new Image.network(_imageurl, width: 100.0, height: 100.0, fit: BoxFit.cover,),
          new Expanded(child: new Container(padding: new EdgeInsets.all(5.0), child: new Column(children: [
            new Text(_title,  style: new TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
            new Expanded(child:new Text(_text, softWrap: true, textAlign: TextAlign.justify,))
          ]
          ))
          ), new NewsBoxFavourit(_num, _like)
        ])
    );

    return new Container(
        color: Colors.black12,
        height: 100.0,
        child: new Row(children: [
          new Expanded(child: new Container(padding: new EdgeInsets.all(5.0), child: new Column(children: [
            new Text(_title, style: new TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
            new Expanded(child:new Text(_text, softWrap: true, textAlign: TextAlign.justify,))
          ]
          ))
          ),  new NewsBoxFavourit(_num, _like)
        ])
    );
  }
}

void main() =>  runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(),
            body: new NewsBox('Новый урок по Flutter', '''В новом уроке рассказывается, в каких случаях применять класс StatelessWidget и StatefulWidget. Приведены примеры их использования.''',
                imageurl: 'https://flutter.su/favicon.png', num: 10)
        )
    )
);*/

/* Простой список ListView
void main() =>  runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            body: new ListView(children: [
              new Text('0000'),
              new Divider(),
              new Text('0001'),
              new Divider(),
              new Text('0010'),
            ])// ListView
        )// Scaffold
    )// MaterialApp
);
*/
/* Бесконечный список ListView.builder
void main() =>  runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            body: new ListView.builder(
              itemBuilder: (context, index) {
                return new Text('строка $index');
              },
            )// ListView.builder
        )// Scaffold
    )// MaterialApp
);
*/
/*

class MyBody extends StatefulWidget {
  @override
  createState() => new MyBodyState();
}

class MyBodyState extends State<MyBody> {
  List<String> _array = [];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, i){
      print('num $i : нечетное = ${i.isOdd}');

      if(i.isOdd) return new Divider();

      final int index = i ~/ 2;

      print('index $index');
      print('length ${_array.length}');

      if (index >= _array.length) _array.addAll(['$index', '${index + 1}', '${index + 2}']);

      return new ListTile(title: new Text(_array[index]));
    });
  }
}

void main() =>  runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(body: new Center(child: new MyBody(),))
    )
);
*/
/*
ПРАКТИЧЕСКАЯ ЗАДАЧА ИЗ УРОКА
class MyBody extends StatefulWidget {
  @override
  createState() => new MyBodyState();
}

class MyBodyState extends State<MyBody> {
  List<String> _array = [];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemBuilder: (context, i){
      print('num $i : нечетное = ${i.isOdd}');

      if(i.isOdd) return new Divider();

      final int index = i ~/ 2;

      final int result = pow(2, index);

      print('index $index');
      print('length ${_array.length}');

      if (index >= _array.length) _array.addAll(['2 ^ $index = $result']);

      return new ListTile(title: new Text(_array[index]));
    });
  }
}

void main() =>  runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(body: new Center(child: new MyBody(),))
    )
);
*/

/* Работа с формой
enum GenderList {male, female}

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  GenderList _gender;
  bool _agreement = false;

  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(10.0), child: new Form(key: _formKey, child: new Column(children: <Widget>[
      new Text('Имя пользователя:', style: TextStyle(fontSize: 20.0),),
      new TextFormField(validator: (value){
        if (value.isEmpty) return 'Пожалуйста введите свое имя';
      }),

      new SizedBox(height: 20.0),

      new Text('Контактный E-mail:', style: TextStyle(fontSize: 20.0),),
      new TextFormField(validator: (value){
        if (value.isEmpty) return 'Пожалуйста введите свой Email';

        String p = "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
        RegExp regExp = new RegExp(p);

        if (regExp.hasMatch(value)) return null;

        return 'Это не E-mail';
      }),

      new SizedBox(height: 20.0),

      new Text('Ваш пол:', style: TextStyle(fontSize: 20.0),),

      new RadioListTile(
        title: const Text('Мужской'),
        value: GenderList.male,
        groupValue: _gender,
        onChanged: (GenderList value) {setState(() { _gender = value;});},
      ),

      new RadioListTile(
        title: const Text('Женский'),
        value: GenderList.female,
        groupValue: _gender,
        onChanged: (GenderList value) {setState(() { _gender = value;});},
      ),

      new SizedBox(height: 20.0),

      new CheckboxListTile(
          value: _agreement,
          title: new Text('Я ознакомлен'+(_gender==null?'(а)':_gender==GenderList.male?'':'а')+' с документом "Согласие на обработку персональных данных" и даю согласие на обработку моих персональных данных в соответствии с требованиями "Федерального закона О персональных данных № 152-ФЗ".'),
          onChanged: (bool value) => setState(() => _agreement = value)
      ),

      new SizedBox(height: 20.0),

      new RaisedButton(onPressed: (){
        if(_formKey.currentState.validate()) {
          Color color = Colors.red;
          String text;

          if (_gender == null) text = 'Выберите свой пол';
          else if (_agreement == false) text = 'Необходимо принять условия соглашения';
          else {text = 'Форма успешно заполнена'; color = Colors.green;}

          Scaffold.of(context).showSnackBar(SnackBar(content: Text(text), backgroundColor: color,));
        }
      }, child: Text('Проверить'), color: Colors.blue, textColor: Colors.white,),
    ],)));
  }
}

void main() => runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(title: new Text('Flutter.su - Форма ввода')),
            body: new MyForm()
        )
    )
);*/
/*
Открытие второго окна при помощи Navigator
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Главное окно')),
      body: Center(child: RaisedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
      }, child: Text('Открыть второе окно'))),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Второе окно')),
      body: Center(child: RaisedButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text('Назад'))),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}*/
/*
Навигвцияпри помощи маршрутов
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Главное окно')),
      body: Center(child: Column(children: [
        RaisedButton(onPressed: (){Navigator.pushNamed(context, '/second');}, child: Text('Открыть второе окно'))
      ],)),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Второе окно')),
      body: Center(child: RaisedButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text('Назад'))),
    );
  }
}

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => MainScreen(),
        '/second':(BuildContext context) => SecondScreen()
      }
  ));
}
*/

/*
Передача параметров в маршруте с помощью события onGenerateRoute
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Главное окно')),
      body: Center(child: Column(children: [
        RaisedButton(onPressed: (){Navigator.pushNamed(context, '/second');}, child: Text('Открыть второе окно')),
        RaisedButton(onPressed: (){Navigator.pushNamed(context, '/second/123');}, child: Text('Открыть второе окно 123')),
      ],)),
    );
  }
}

class SecondScreen extends StatelessWidget {
  String _id;

  SecondScreen({String id}):_id = id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Второе окно $_id')),
      body: Center(child: RaisedButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text('Назад'))),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(BuildContext context) => MainScreen(),
      '/second':(BuildContext context) => SecondScreen()
    },
    onGenerateRoute: (routeSettings){
      var path = routeSettings.name.split('/');

      if (path[1] == "second") {
        return new MaterialPageRoute(
          builder: (context) => new SecondScreen(id:path[2]),
          settings: routeSettings,
        );
      }
    },
  ));
}*/

/*
Открытие диалогового оокна, его анимирование и возвращение результата из диалогового окна
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Больше или меньше')),
      body: Center(child: Column(children: [
        RaisedButton(onPressed: () async {
          bool value = await Navigator.push(context, PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => MyPopup(),
              transitionsBuilder: (___, Animation<double> animation, ____, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              }
          ));

          if (value) _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Больше'), backgroundColor: Colors.green,));// TRUE
          else _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Меньше'), backgroundColor: Colors.red,));// FALSE
        }, child: Text('Загадать число')),
      ],)),
    );
  }
}

class MyPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ваш ответ:'),
      actions: [
        FlatButton(
          onPressed: () {Navigator.pop(context,true);},
          child: Text('Больше'),
        ),
        FlatButton(
          onPressed: () {Navigator.pop(context,false);},
          child: Text('Меньше'),
        ),
      ],
    );
  }
}

void main() {runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen()));}
*/
class SandGlass {
  int _sand = 0;

  time(){
    return _sand;
  }//time

  Future tick() async {
    _sand = 100;
    print('Start:tick');
    while(_sand > 0) {
      print('tick: _sand');
      _sand--;
      await new Future.delayed(const Duration(milliseconds: 100));
    }//while
    print('End:tick');
  }//tick
}//SandGlass

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State {
  SandGlass clock = SandGlass();

  _reDrawWidget() async {
    if(clock.time() == 0) return;
    await new Future.delayed(const Duration(seconds: 1));
    setState(() {print('reDrawWidget()');});
  }

  @override
  void initState() {
    clock.tick();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _reDrawWidget();

    print('clock.tick: ${clock.time()}');

    return Center(child: Text('time is: ${clock.time()}'));
  }
}

void main() => runApp(new MaterialApp(debugShowCheckedModeBanner: false, home:Scaffold(body: MyApp())));