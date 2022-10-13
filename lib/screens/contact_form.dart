import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  _ContactForm createState() => _ContactForm();
}

class _ContactForm extends State<ContactForm> {
  // Preparando os controllers para receber as informações enviadas de ContactList
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New contact"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: TextField(
                // Incluindo o controller p/ através dele enviar os dados para a ContactsList
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Full name",
                ),
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: TextField(
                controller: _accountController,
                decoration: InputDecoration(
                  labelText: "Account number",
                ),
                style: TextStyle(
                  fontSize: 24,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double
                    .maxFinite, // Aproveita toda o espaço possível do dispositivo
                child: ElevatedButton(
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accountNumber =
                        int.tryParse(_accountController.text) != null
                            ? int.parse(_accountController.text)
                            : 0;
                    final Contact newContact = Contact(0, name, accountNumber);
                    _dao.save(newContact).then(
                          (id) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactsList()),
                          ),
                        );
                  },
                  child: Text("Create"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    primary: Theme.of(context).primaryColor, // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
