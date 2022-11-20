import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  final pageController = new PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //*AppBar
      appBar: AppBar(
        title: Text('Hola mundo $currentPage'),
        elevation: 0,
      ),
      //? Cambiar pantalla
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CustomScreen(
            color: Colors.lightBlue,
          ),
          CustomScreen(
            color: Colors.pink,
          ),
          CustomScreen(
            color: Colors.indigo,
          ),
        ],
      ),
      //?Metodo dos
      //body: currentPage == 0
      //    ? CustomScreen(color: Colors.pink)
      //    : CustomScreen(color: Colors.indigo),
      //?Metodo 3

      //*tabs
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          currentPage = index;

          pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeOut);

          setState(() {});
        },
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_outlined),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

class CustomScreen extends StatelessWidget {
  final Color color;

  const CustomScreen({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text('Custom Screen'),
      ),
    );
  }
}
