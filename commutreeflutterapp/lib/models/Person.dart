import 'package:commutreeflutterapp/dbhelper.dart';

class Person {
    int id;
    String name;
    String image;
    String email;
    String password;
    int age;
    String phone;
    String dob;
    String address;
    String city;
    String mrg_status;
    String profession;
    String education;
    Person({
        this.id,
        this.name,
        this.image,
        this.email,
        this.password,
        this.age,
        this.phone,
        this.dob,
        this.address,
        this.city,
        this.mrg_status,
        this.profession,
        this.education,
    });

  // static final columnId = "id";
  // static final columnImage = "image";
  // static final columnName = "name";
  // static String columnEmail = "email";
  // static String columnPassword = "password";
  // static String columnAge = "age";
  // static String columnPhone = "phone";
  // static String columnDob = "dob";
  // static String columnAddress = "address";
  // static String columnCity = "city";
  // static String columnMaritalStatus = "mrg_status";
  // static String columnProfession = "profession";
  // static String columnEducation = "education";
  //  
  
   // int get personId => id;
    // String get personName => name;
    // String get personImage => image;
    // String get personEmail => email;
    // String get personPassword => password;
    // int get personAge => age;
    // String get personPhone =>phone;
    // String get personDob =>dob;
    // String get personAddress =>address;
    // String get personCity =>city;
    // String get personMrgStatus =>mrg_status;
    // String get personProfession =>profession;
    // String get personEducation =>education;

    factory Person.fromJson(Map<String, dynamic> data) => new Person(
        id: data["id"] as int,
        name: data["name"] as String,
        image: data["image"] as String,
        email: data["email"] as String,
        password: data["password"] as String,
        age: data["age"] as int,
        phone: data["phone"] as String,
        dob: data["dob"] as String,
        address: data["address"] as String,
        city: data["city"] as String,
        mrg_status: data["mrg_status"] as String,
        profession: data["profession"] as String,
        education: data["education"] as String,
    );

    Map<String, dynamic> toJson(Person person) => {
        "id": person.id,
        "name": person.name,
        "image": person.image,
        "email": person.email,
        "password": person.password,
        "age": person.age,
        "phone": person.phone,
        "dob": person.dob,
        "address": person.address,
        "city": person.city,
        "mrg_status": person.mrg_status,
        "profession": person.profession,
        "education": person.education,
    };

    List<Person> seedData(){

    //List of users
    List<Person> usersList=new List<Person>();

    usersList.add(new Person(name: "vaimik patel",image: 'assets/user.png',email: 'vaimik@gmail.com',password: 'vaimik',age: 24,dob: '08/29/1994',phone: '+1(437)7716754',address: '1 Lee Centre Drive',city: 'Toronto',profession: 'Student',education: 'Post Graduate'));
    usersList.add(new Person(name: "Milen Louis",image: 'assets/user.png',email: 'milen@gmail.com',password: 'milen',age: 24,dob: '08/29/1994',phone: '+1(437)7716754',address: '1 Lee Centre Drive',city: 'Toronto',profession: 'Student',education: 'Post Graduate'));
    usersList.add(new Person(name: "Kushal Sarawagi",image: 'assets/user.png',email: 'kushal@gmail.com',password: 'kushal',age: 24,dob: '08/29/1994',phone: '+1(437)7716754',address: '1 Lee Centre Drive',city: 'Toronto',profession: 'Student',education: 'Post Graduate'));
    usersList.add(new Person(name: "Akif Shaikh",image: 'assets/user.png',email: 'akif@gmail.com',password: 'akif',age: 24,dob: '08/29/1994',phone: '+1(437)7716754',address: '1 Lee Centre Drive',city: 'Toronto',profession: 'Student',education: 'Post Graduate'));
    usersList.add(new Person(name: "Chirag Vira",image: 'assets/user.png',email: 'chirag@gmail.com',password: 'chirag',age: 24,dob: '08/29/1994',phone: '+1(437)7716754',address: '1 Lee Centre Drive',city: 'Toronto',profession: 'Student',education: 'Post Graduate'));
    usersList.add(new Person(name: "Pooja Patel",image: 'assets/user.png',email: 'pooja@gmail.com',password: 'pooja',age: 24,dob: '08/29/1994',phone: '+1(437)7716754',address: '1 Lee Centre Drive',city: 'Toronto',profession: 'Student',education: 'Post Graduate'));
    usersList.add(new Person(name: "Shreya Patel",image: 'assets/user.png',email: 'shreya@gmail.com',password: 'shreya',age: 24,dob: '08/29/1994',phone: '+1(437)7716754',address: '1 Lee Centre Drive',city: 'Toronto',profession: 'Student',education: 'Post Graduate'));
    usersList.add(new Person(name: "Ami Jani",image: 'assets/user.png',email: 'ami@gmail.com',password: 'ami',age: 24,dob: '08/29/1994',phone: '+1(437)7716754',address: '1 Lee Centre Drive',city: 'Toronto',profession: 'Student',education: 'Post Graduate'));
    usersList.add(new Person(name: "Manthan Jha",image: 'assets/user.png',email: 'manthan@gmail.com',password: 'manthan',age: 24,dob: '08/29/1994',phone: '+1(437)7716754',address: '1 Lee Centre Drive',city: 'Toronto',profession: 'Student',education: 'Post Graduate')); 
    // row to insert
    
    return usersList;
    
   
    }
}