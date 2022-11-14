import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'modals/modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed("addcontactpage");
        },
      ),
      appBar: AppBar(
        title: const Text("Contact"),
        leading: null,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (isDark == true) {
                  isDark = false;
                } else {
                  isDark = true;
                }
                print(isDark);
              });
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor:
              Theme
                  .of(context)
                  .appBarTheme
                  .titleTextStyle!
                  .color,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
            ),
            onPressed: () {
              setState(() {});
            },
          )
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          child: (contact.isEmpty)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "You have not contacts yet",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
              : ListView.builder(
            itemCount: contact.length,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed("detailpage", arguments: contact[i]);
                },
                leading: CircleAvatar(
                  radius: 26,
                  backgroundImage: (contact[i].image != null)
                      ? FileImage(contact[i].image!)
                      : null,
                ),
                title: Text(
                    "${contact[i].firstname} ${contact[i].lastname}"),
                subtitle: Text("+88 ${contact[i].phone}"),
                trailing: IconButton(
                  icon: const Icon(Icons.call,
                      color: Colors.green, size: 33),
                  onPressed: () async {
                    String url = "tel:+88${contact[i].phone}";

                    await canLaunch(url);

                    await launch(url);
                  },
                ),
              );
            },
          )),
    );
  }
}