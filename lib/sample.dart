import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(home: MainApp())
);

class Repository {
  static List<EmployeeModel> getAllEmployees() {
    var list = List<EmployeeModel>();

    list.add(EmployeeModel(
      fullName: "Sarah Silverman",
      email: "sara.silverman@gmail.com",
      imgAsset: "assets/img1.jpg"
    ));

    list.add(EmployeeModel(
      fullName: "James Carter",
      email: "james.carter@gmail.com",
      imgAsset: "assets/img2.jpg"
    ));

    list.add(EmployeeModel(
      fullName: "Patrick Swatch",
      email: "pswatch@gmail.com",
      imgAsset: "assets/img3.jpg"
    ));

    list.add(EmployeeModel(
      fullName: "Jena Johnson",
      email: "jena.johnson@gmail.com",
      imgAsset: "assets/img4.jpg"
    ));

     list.add(EmployeeModel(
      fullName: "Ellen Degeneres",
      email: "e.degeneres@gmail.com",
      imgAsset: "assets/img5.jpg"
    ));

     list.add(EmployeeModel(
      fullName: "Dave Matthews",
      email: "dave.matthews@gmail.com",
      imgAsset: "assets/img6.jpg"
    ));

     list.add(EmployeeModel(
      fullName: "Patricia Payton",
      email: "patricia.payton@gmail.com",
      imgAsset: "assets/img7.jpg"
    ));
    return list;
  }
}

class Factory {
  static Widget getEmployeeRow(EmployeeModel e) {
    return InkWell(
                 child:  Container(
                  child: Row(
                    children: <Widget>[
                      Padding(child: ClipOval(child: Image.asset(e.imgAsset,
                       width: 50.0, height: 50.0),
                      ),
                      padding: EdgeInsets.all(20.0)
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Text(e.fullName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                          )),
                          Text(e.email,
                          textAlign: TextAlign.left,)
                        ],
                        ),
                      )
                    ],
                  ),
                )
                ,
                onTap: () {
                  
                },
          );
  }

   static List<Widget> getAllEmployeeRows(List<EmployeeModel> emps) {
    var allRows = List<Widget>();

    for(var i = 0; i < emps.length; i++) {
      allRows.add(Factory.getEmployeeRow(emps[i]));
    }

    return allRows;
  }
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Employee List'),
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.blueAccent,
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          child: Container(
            color: Colors.white,
            child: ListView(
              children: Factory.getAllEmployeeRows(Repository.getAllEmployees())
            ),
          ),
        ),
      )
    );
  }
}

class EmployeeModel {
  String fullName;
  String email;
  String imgAsset;

  EmployeeModel({
    this.fullName, this.email, this.imgAsset
  });
}