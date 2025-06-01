import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

class MongoDatabase {
  
  static signUp(String username,String firstName,String lastName,String email,String password) async {
    var db = await Db.create(mongoURL);
    await db.open();
    var collection = db.collection(usersCollectionName);
    await collection.insertOne({
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "weightHistory": [],
      "calorieHistory": [],
      "carbohydrateHistory": [],
      "proteinHistory": [],
      "fatHistory": []
    });
  }

  static logIn(String email, String password) async {
    var db = await Db.create(mongoURL);
    await db.open();
    var collection = db.collection(usersCollectionName);
    if (await collection.findOne(where.eq("email", email).eq("password", password)) == null){
      return false;
      // Login failed
    }

    return true;
    // Login succeeded
  }
}