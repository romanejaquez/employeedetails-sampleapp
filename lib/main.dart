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
      imgAsset: "assets/img3.jpg",
      details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
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

enum SpeechBubbleType {
  Sender,
  Recipient
}

class SpeechBubble extends StatelessWidget {

  SpeechBubbleType type;
  String text;
  Color backgroundColor;
  Color color;
  String messageDate = DateTime.now().toString();

  SpeechBubble({@required SpeechBubbleType type, String text, Color backgroundColor, Color color})
  {
    type = type;
    text = text;
    backgroundColor = backgroundColor == null ? 
      (type == SpeechBubbleType.Sender ? Colors.lightBlueAccent : Colors.grey[300]) : backgroundColor;
    color = color == null ? Colors.white : color;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 10.0, 
                    left: type == SpeechBubbleType.Sender ? 10 : 30, 
                    right: type == SpeechBubbleType.Sender ? 30 : 10, 
                    bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                    color: backgroundColor,
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      text,
                      style: TextStyle(color: color),
                    ),),
                  ),
                ),
                  Positioned(
                    top: 35,
                    left: type == SpeechBubbleType.Sender ? 0 : 25,
                    right: type == SpeechBubbleType.Sender ? 25 : 0,
                    child: Transform.rotate(
                    angle: 40,
                    child: Container(
                      width: 20, height: 20,
                      color: backgroundColor,
                    ),
                  ),
                  )
                ],),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(messageDate, 
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0
                    )),
                )
            ],
          )
        );
  }
}

class ListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.create),
        onPressed: () {
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
        },
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ClipOval(child: Image.asset('assets/roman.jpg',
                    width: 50.0, height: 50.0),
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text("Roman Jaquez",
                    style: TextStyle(fontWeight: FontWeight.bold,
                    )),
                    Text("Software Engineer",
                    style: TextStyle(fontSize: 12.0))
                  ],),
                  ),
                  
              ],),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                        child: Row(children: <Widget>[
                        Icon(Icons.favorite),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text("Favorites"),
                          )
                        ],),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                        child: Row(children: <Widget>[
                        Icon(Icons.group),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text("Social"),
                          )
                        ],),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                        child: Row(children: <Widget>[
                        Icon(Icons.chat),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text("Conversations"),
                          )
                        ],),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                        child: Row(children: <Widget>[
                        Icon(Icons.send),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text("Sent"),
                          )
                        ],),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                        child: Row(children: <Widget>[
                        Icon(Icons.description),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text("Drafts"),
                          )
                        ],),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                        child: Row(children: <Widget>[
                        Icon(Icons.mail),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text("All Mail"),
                          )
                        ],),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
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

enum ChatBubbleType {
  Sender,
  Receiver
}

class ChatBubble extends StatelessWidget {

  ChatBubbleType t;
  String text;
  String messageSent = DateTime.now().toString();
  Color bg;
  Color fg;

  ChatBubble({
    ChatBubbleType type,
    String text,
    Color background,
    Color foreground
  }){
    this.t = type;
    this.text = text;
    this.bg = background == null ? (t == ChatBubbleType.Sender ? Colors.lightBlueAccent : Colors.grey[300]) : background;
    this.fg = foreground == null ? (t == ChatBubbleType.Sender ? Colors.white : Colors.black.withAlpha(200)) : foreground;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(children: <Widget>[
                Align(
                  alignment: t == ChatBubbleType.Sender ? Alignment.bottomRight : Alignment.bottomLeft,
                  child: Container(
                    padding: t == ChatBubbleType.Sender ? EdgeInsets.only(top: 10.0, left: 10, right: 30, bottom: 10)
                    : EdgeInsets.only(top: 10.0, left: 30, right: 10, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                      color: bg,
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        text,
                        style: TextStyle(color: fg),
                      ),),
                    ),
                  ),
                ),
                t == ChatBubbleType.Sender ? Positioned(
                  top: 29,
                  right: 25,
                  child: Transform.rotate(
                  angle: 40,
                  child: Container(
                    width: 20, height: 20,
                    color: bg,
                  ),
                ),
                ) : Positioned(
                    top: 29,
                    left: 25,
                    child: Transform.rotate(
                    angle: 40,
                    child: Container(
                      width: 20, height: 20,
                      color: bg,
                    ),
                  ))
              ],),
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(messageSent, 
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0
                  )),
              ),
            ],
          )
        );
    
  }
}

class ChatPage extends StatelessWidget {

  List<Widget> getAllMessages() {
    return <Widget>[
          ChatBubble(
            type: ChatBubbleType.Receiver,
            text: "Some text text asdfas dfadsf sd fadsfadsf adsfadsf adsfadsf ads fadsf adsf  fadsf adsf"
          ),
          ChatBubble(
            type: ChatBubbleType.Sender,
            text: "Some text text asdfas dfadsf sd fadsfadsf adsfadsf adsfadsf ads fadsf adsf  fadsf adsf"
          ),
          ChatBubble(
            type: ChatBubbleType.Receiver,
            text: "And then some!adsf"
          ),
          ChatBubble(
            type: ChatBubbleType.Sender,
            text: "Just like dsfadsf adsfadsf adsfadsf ads fadsf adsf  fadsf adsf"
          )
        ].toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Chat'),
      ),
      body: Stack(children: <Widget>[
        Positioned(
          top: 0, left: 0, right: 0, bottom: 80,
          child: ListView(
          scrollDirection: Axis.vertical,
          children: getAllMessages().toList()
        )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Container(
                color: Colors.grey[300],
                padding: EdgeInsets.only(top: 10, left: 20, right: 70, bottom: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Say something...'
                  ),
                ),
              ),
            )
          ),
        ),
        Positioned(
          bottom: 14, right: 15,
          child: InkWell(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle
              ),
              child: Icon(Icons.send, color: Colors.white),
            ),
            onTap: () {},
          ),
        )
      ],)
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
        backgroundColor: Colors.blueAccent,
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