import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:zaq_test/app_module/dashboard/models/city.dart';

class SavingDatabase {
  Future<Database> getDatabase() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'zaqtest.db');
      return await openDatabase(path, onCreate: (db, version) async {
        await db.execute('CREATE TABLE IF NOT EXISTS Cities (name TEXT PRIMARY KEY, language TEXT, countryCode TEXT, longitude TEXT, latitude TEXT)');
      }, version: 6);
    }
  

  Future<int> saveDatabase(City city) async{
    final Database db = await getDatabase();
        final Map<String, dynamic> cityMap = Map();
        cityMap['name'] = city.name;
        cityMap['language'] = city.language;
        cityMap['countryCode'] = city.countryCode;
        cityMap['longitude'] = city.longitude;
        cityMap['latitude'] = city.latitude;
        return db.insert('Cities', cityMap);
      }


  Future<List<City>> findAll() async {
    Database database = await getDatabase();
    return database.query('Cities').then((maps) {
      final List<City> cityList = [];
      for (Map<String, dynamic> map in maps) {
        final City city = City(
            name: map['name'],
            language: map['language'],
            countryCode: map['countryCode'],
            longitude: map['longitude'],
            latitude: map['latitude']);
        cityList.add(city);
      }
      return cityList;
    });
  }
}
