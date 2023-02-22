import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/side_menu.dart';
import 'package:flutter_application_1/todo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/todo.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final TextEditingController _inputController = TextEditingController();
  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  List<To_Do> todos = [
    To_Do(data: "study"),
    To_Do(data: 'play'),
    To_Do(data: 'eat')
  ];
  // ignore: unused_field
  late List<To_Do> _forSearch = todos;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 119, 102, 102),
        ),
        drawer: SideMenu(),
        backgroundColor: Color.fromARGB(255, 228, 211, 211),
        body: SafeArea(
            child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                //rows with option button and avatar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Icon(Icons.menu, size: 40),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 15, bottom: 20),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          'https://www.planetsport.com/image-library/square/500/e/erik-ten-hag-ajax-15-april-2022.jpg',
                        ),
                      ),
                    )
                  ],
                ),

                //search button

                Container(
                  padding: EdgeInsets.only(left: 5),
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      // color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(Icons.search),
                      Container(
                        width: 300,
                        height: 50,
                        color: Color.fromARGB(255, 255, 254, 254),
                        child: TextField(
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical(y: -1),
                          onChanged: UpdateList,
                          maxLength: 28,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              counter: Text(''),
                              border: InputBorder.none,
                              hintText: 'Search for todo'),
                        ),
                      )
                      /* Expanded(
                        child: TextField(
                          onChanged: UpdateList,
                          maxLength: 28,
                          decoration: InputDecoration(
                              counter: Text(''),
                              border: InputBorder.none,
                              hintText: 'Search for todo'),
                        ),
                      ) */
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                Text('All ToDos',
                    style: GoogleFonts.spaceMono(
                        fontSize: 30,
                        fontStyle: FontStyle
                            .italic) //TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                    ),
                // all todos text
                SizedBox(
                  height: 20,
                ),
                //todos
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .6,

                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 253, 254),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8,
                            offset: Offset(0, -2),
                            color: Color.fromARGB(255, 214, 214, 214))
                      ]),
                  //  color: Colors.white,
                  padding: EdgeInsets.only(top: 40, left: 20, right: 5),
                  alignment: Alignment.topLeft,
                  child: ListView.builder(
                    itemCount: _forSearch.length,
                    itemBuilder: ((context, index) {
                      return Container(
                          padding:
                              EdgeInsets.only(left: 15, top: 20, right: 10),
                          margin: EdgeInsets.only(right: 15, bottom: 20),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 228, 223, 223),
                              boxShadow: [
                                BoxShadow(blurRadius: 2.0, color: Colors.black)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          width: MediaQuery.of(context).size.height * .52,
                          height: 66,
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //text
                              FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: getText(_forSearch[index])),

                              //check

                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        check(index);
                                      },
                                      child: Icon(
                                        Icons.check_circle_outline_outlined,
                                        color: Color.fromARGB(255, 56, 40, 34),
                                        size: 20,
                                        shadows: [Shadow(blurRadius: 2)],
                                      )),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        DeleteToDo(index);
                                      },
                                      child: Icon(
                                        Icons.restore_from_trash_rounded,
                                        color: Color.fromARGB(255, 56, 40, 34),
                                        size: 20,
                                        shadows: [Shadow(blurRadius: 2)],
                                      )),
                                ],
                              )

                              //remove
                            ],
                          ));
                    }),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 8),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: TextField(
                            controller: _inputController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Add a new todo item'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      InkWell(
                        onTap: () => {
                          CreateToDo(_inputController.text),
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(115, 172, 140, 140),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(45))),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.08,
                            // add todo
                            child: Center(
                                child: Icon(
                              Icons.add,
                              size: 40,
                              color: Color.fromARGB(255, 56, 40, 34),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                /*  BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                      backgroundColor: Colors.red,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business),
                      label: 'Business',
                      backgroundColor: Colors.green,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.school),
                      label: 'School',
                      backgroundColor: Colors.purple,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                  fixedColor: Color.fromARGB(255, 64, 47, 28),
                )
                //texfield to add todos */
              ],
            ),
          ),
        )),
      ),
    );
  }

  Text getText(To_Do list) {
    String data = list.data;
    if (data.length > 32) {
      data = data.substring(0, 32);

      /* if you want to divide the text to diffrent lines ( in my case I want to limit the length)
      for (int i = 30; i < data.length; i = i + 30) {
        data =
            data.substring(i - 30, i) + '\n' + data.substring(i, data.length);
      } */
    }
    if (list.ischecked) {
      return Text(data,
          style: GoogleFonts.lato(
              decoration: TextDecoration.lineThrough,
              decorationThickness: 2.5,
              fontSize: 20,
              fontStyle: FontStyle.italic)
          /*TextStyle(
            decoration: TextDecoration.lineThrough,
            fontSize: 20,
            fontWeight: FontWeight.bold),*/
          );
    } else {
      return Text(data,
          style: GoogleFonts.lato(
              fontSize: 20,
              fontStyle: FontStyle
                  .italic) /*TextStyle(fontSize: 20, fontWeight: FontWeight.bold),*/
          );
    }
  }

  void CreateToDo(String text) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    print('trying to print this one =>${text.length}');
    if (text.length > 0) {
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      setState(() {
        todos.add(To_Do(data: text));
      });
      _inputController.text = "";
      //  _inputController.dispose();
    }
  }

  void DeleteToDo(int index) {
    print('trying to print index number ${index}');

    setState(() {
      todos.remove(todos.elementAt(index));
    });
  }

  void check(int index) {
    setState(() {
      todos[index].check();
    });
  }

  void UpdateList(String search) {
    if (search.length > 0) {
      final suggestions = todos.where((book) {
        final input = search.toLowerCase();
        final text = book.data.toLowerCase();
        return text.contains(input);
      }).toList();

      setState(() {
        _forSearch = suggestions;
      });
    } else {
      setState(() {
        _forSearch = todos;
      });
    }
  }
}
