import 'package:flutter/material.dart';
import 'package:duasd/app_controller.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://p2.trrsf.com/image/fget/cf/1200/1200/middle/images.terra.com/2023/04/10/super-mario-bros-movie-capa-trrdd8yxo12a.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                accountName: Text('Maicon de Oliveira da SIlva'),
                accountEmail: Text('maicondeoliveiradasilva@gmail.com'),
            ),
            ListTile(
                title: Text('Logout'),
                subtitle: Text('Finalizar Sessão'),
                leading: Container(
                  margin: EdgeInsets.only(left: 9),
                  height: 100,
                  child: Icon(Icons.logout),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                }
            ),
            ListTile(
                title: Text('Tema'),
                subtitle: Text(AppController.instance.themeState == false ? 'Tema Escuro': 'Tema Claro'),
                leading: Container(
                  margin: EdgeInsets.only(left: 9),
                  height: 100,
                  child: AppController.instance.themeState == false ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
                ),
                trailing: Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 100,
                  child: CustomSwitch(),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                }
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomContent(),
            CustomContent(),
            CustomContent(),
            CustomContent(),
            CustomContent(),
            CustomContent(),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              AppController.instance.decrementCounter();
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              AppController.instance.incrementCounter();
            },
          ),
          FloatingActionButton(
            child: CustomSwitch(),
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
            value: AppController.instance.themeState,
            onChanged: (value){
              AppController.instance.changeTheme();
            }
        );
  }
}

class CustomContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width*0.5,
          color: Colors.black,
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: AppController.instance.themeState ? Colors.blue : Colors.red ,
                  borderRadius: BorderRadius.circular(50.0)
              ),
              child: Center(
                child: Text(
                  AppController.instance.counter.toString(),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width*0.5,
          color: AppController.instance.themeState ? Colors.yellow : Colors.green ,
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: AppController.instance.themeState ? Colors.black : Colors.white ,
                  borderRadius: BorderRadius.circular(50.0)
              ),
            ),
          ),
        ),
      ],
    );
  }
}



