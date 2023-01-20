import 'package:mongo_dart/mongo_dart.dart';

Future<void> main(List<String> args) async {
  print('Initializing connection with mongoDb...');

   var db = await Db.create("mongodb+srv://<user>:<password>@localhost/database");
  await db.open();

  print('Success mongo connected...');
  
  var moviesCollection = db.collection('movies');

  print('Selected movies collection');

  print('Finding movie with specific title');

  final movies = await moviesCollection.find({'title': 'Blacksmith Scene'}).toList();

  print('Movie result length ${movies.length}');

  var growableMoviesIdList = [];

  movies.forEach((m) => growableMoviesIdList.add(m['_id'].toString()));

  movies.forEach((m)=> print('wins >> ${m['awards']['wins'].toString()}'));

  print('Printing collected movies id');
  growableMoviesIdList.forEach(print);
  
  await db.close();

  print('Finishing application');
}