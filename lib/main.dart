import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(home: ListPage())
);

class Repository {
  static List<EmployeeModel> getAllEmployees() {
    var list = List<EmployeeModel>();

    list.add(EmployeeModel(
      fullName: "Sarah Silverman",
      email: "sara.silverman@gmail.com",
      imgAsset: "assets/img1.jpg",
      details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    ));

    list.add(EmployeeModel(
      fullName: "James Carter",
      email: "james.carter@gmail.com",
      imgAsset: "assets/img2.jpg",
      details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    ));

    list.add(EmployeeModel(
      fullName: "Patrick Swatch",
      email: "pswatch@gmail.com",
      imgAsset: "assets/img3.jpg"
    ));

    list.add(EmployeeModel(
      fullName: "Jena Johnson",
      email: "jena.johnson@gmail.com",
      imgAsset: "assets/img4.jpg",
      details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    ));

     list.add(EmployeeModel(
      fullName: "Ellen Degeneres",
      email: "e.degeneres@gmail.com",
      imgAsset: "assets/img5.jpg",
      details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    ));

     list.add(EmployeeModel(
      fullName: "Dave Matthews",
      email: "dave.matthews@gmail.com",
      imgAsset: "assets/img6.jpg",
      details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    ));

     list.add(EmployeeModel(
      fullName: "Patricia Payton",
      email: "patricia.payton@gmail.com",
      imgAsset: "assets/img7.jpg",
      details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
    ));
    return list;
  }
}

class Factory {
  static Widget getEmployeeRow({BuildContext context, EmployeeModel employee}) {
    return InkWell(
            child:  Container(
              child: Row(
                children: <Widget>[
                  Padding(child: ClipOval(child: Image.asset(employee.imgAsset,
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
                      Text(employee.fullName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      )),
                      Text(employee.email,
                      textAlign: TextAlign.left,)
                    ],),)
                ],
              ),
            )
            ,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(employee: employee,)),
              );
            },
          );
  }

   static List<Widget> getAllEmployeeRows({BuildContext context, List<EmployeeModel> employeeData}) {
    var allRows = List<Widget>();

    for(var i = 0; i < employeeData.length; i++) {
      allRows.add(Factory.getEmployeeRow(context: context, employee: employeeData[i]));
    }

    return allRows;
  }
}

class ListPage extends StatelessWidget {

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
              children: Factory.getAllEmployeeRows(context: context, employeeData: Repository.getAllEmployees())
            ),
          ),
        ),
      )
    );
  }
}

class DetailsPage extends StatelessWidget {

  EmployeeModel employee;

  DetailsPage({this.employee});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Details"),
        elevation: 0.0,
      ),
      body: Container(
          color: Colors.blueAccent,
          child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Padding(child: ClipOval(child: Image.asset(employee.imgAsset,
                        width: 100.0, height: 100.0),
                      ),
                      padding: EdgeInsets.all(20.0)
                  ),),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(employee.fullName,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                        ),),
                        Text(employee.email,
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold
                        ),),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(employee.details,
                          textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FloatingActionButton(
                                  backgroundColor: Colors.blueAccent,
                                  child: Icon(Icons.phone),
                                  onPressed: () {
                                    
                                  },
                              )
                            ],
                          )
                        )
                        ],
                    )
                  )
              ],
            ),
          ),
        )
      )
    );
  }
}

class EmployeeModel {
  String fullName;
  String email;
  String imgAsset;
  String details;

  EmployeeModel({
    this.fullName, this.email, this.imgAsset, this.details
  });
}