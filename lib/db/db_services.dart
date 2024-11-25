import 'package:sqflite/sqflite.dart';
import 'package:women_safety/model/contractsm.dart';
class DatabaseHelper{

  String contactTable='contact_table';
  String colid='id';
  String colcontactName='name';
  String colcontactNumber='number';

  DatabaseHelper._createInstance();

  static DatabaseHelper? _databasehelper;
  factory DatabaseHelper(){
    if(_databasehelper == null){
      _databasehelper=DatabaseHelper._createInstance();
    }
    return _databasehelper!;
  }

  // initialise databse

static Database? _database;
  Future<Database> get database async {
    if(_database==null){
      _database=await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String directoryPath = await getDatabasesPath();
    String dbLocation = directoryPath + 'contact.db';

    var contactDatabase =
    await openDatabase(dbLocation, version: 1, onCreate: _createDbTable);
    return contactDatabase;
  }

    void _createDbTable(Database db, int newVersion) async {
      await db.execute(
          'CREATE TABLE $contactTable($colid INTEGER PRIMARY KEY AUTOINCREMENT, $colcontactName TEXT, $colcontactNumber TEXT)');
    }

    Future<List<Map<String,dynamic>>> getContactMapList()async{

    Database db = await this.database;
    List<Map<String, dynamic>> result=
        await db.rawQuery('SELECT * FROM $contactTable order by $colid ASC');

    return result;
    }

    // insert a contact object
    Future<int> insertContact(TContact contact) async{

    Database db=await this.database;
    var result=await db.insert(contactTable, contact.toMap());
    return result;
    }

  // update a contact object
  Future<int> updateContact(TContact contact) async {
    Database db = await this.database;
    var result = await db.update(contactTable, contact.toMap(),
        where: '$colid = ?', whereArgs: [contact.id]);
    return result;
  }
  //delete a contact object
  Future<int> deleteContact(int id) async {
    Database db = await this.database;
    int result =
    await db.rawDelete('DELETE FROM $contactTable WHERE $colid = $id');
    // print(await db.query(contactTable));
    return result;
  }

  //get number of contact objects
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
    await db.rawQuery('SELECT COUNT (*) from $contactTable');
    int result = Sqflite.firstIntValue(x)!;
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Contact List' [ List<Contact> ]
  Future<List<TContact>> getContactList() async {
    var contactMapList =
    await getContactMapList(); // Get 'Map List' from database
    int count =
        contactMapList.length; // Count the number of map entries in db table

    List<TContact> contactList = <TContact>[];
    // For loop to create a 'Contact List' from a 'Map List' and fetch the list
    for (int i = 0; i < count; i++) {
      contactList.add(TContact.fromMapObject(contactMapList[i]));
    }

    return contactList;
  }
}











