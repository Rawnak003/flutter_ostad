import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> name = [];
  List<String> phone = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  _addContact() {
    if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty) {
      setState(() {
        name.add(_nameController.text);
        phone.add(_phoneController.text);
        _nameController.clear();
        _phoneController.clear();
      });
    }
  }

  _deleteContact(int index) {
    setState(() {
      name.removeAt(index);
      phone.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Enter Name',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelText: 'Enter Phone Number',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: screenWidth,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    onPressed: () {
                      _addContact();
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: InkWell(
                        splashColor: Colors.grey.shade200,
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    actions: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.not_interested),),
                                      IconButton(
                                          onPressed: () {
                                            _deleteContact(index);
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.delete)),
                                    ],
                                    title: const Text("Confirmation"),
                                    contentPadding: const EdgeInsets.all(20),
                                    content: const Text(
                                        "Are you sure you want to delete?"),
                                  ));
                        },
                        child: ListTile(
                          leading: const Icon(
                            Icons.person,
                            size: 35,
                            color: Colors.deepPurpleAccent,
                          ),
                          title: Text(
                            name[index],
                            style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(phone[index]),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.call,
                              size: 30,
                              color: Colors.deepPurpleAccent,
                            ),
                            onPressed: () {},
                          ),
                          tileColor: Colors.grey.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
