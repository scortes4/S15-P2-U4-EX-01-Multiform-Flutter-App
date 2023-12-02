import 'package:flutter/material.dart';

class RegisterActivity extends StatefulWidget {
  @override
  _RegisterActivityState createState() => _RegisterActivityState();
}

class _RegisterActivityState extends State<RegisterActivity> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      bool isValidUser =
          ModalRoute.of(context)?.settings.arguments as bool? ?? false;

      IconData iconData = isValidUser ? Icons.check_circle : Icons.cancel;
      Color iconColor = isValidUser ? Colors.green : Colors.red;
      String dialogMessage =
          isValidUser ? 'Usuario válido' : 'Usuario inválido';

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(iconData, color: iconColor),
                SizedBox(width: 10),
                Text(dialogMessage),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      backgroundColor: Color.fromARGB(255, 142, 116, 237),
    );
  }
}
