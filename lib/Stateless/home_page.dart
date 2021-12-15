import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
   Color selectedColor = Color(0xffc46bae);
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);
  final ValueNotifier<bool> _check = ValueNotifier<bool>(false);
   List<String> texts = [
     "Button1",
     "Button2",
     "Button3",
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Value Notifier'),
        centerTitle: true,

      ),
      body: Column(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, selectedIndex, child) => Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 1.2,
                ),
              ),
              child: Center(
                child: Text(
                  texts[selectedIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: texts
                  .asMap()
                  .entries
                  .map(
                    (mapEntry) => GestureDetector(
                    onTap: () {
                      _selectedIndex.value = mapEntry.key;
                    },
                    child: _buildButton(mapEntry.key, mapEntry.value)),
              )
                  .toList(),
            ),
          ),
          SizedBox(height: 20),
          ValueListenableBuilder<bool>(valueListenable: _check, builder: (context,check,child){
          return MaterialButton(
              color: check ? Colors.green : Colors.red,
              onPressed: ()async{
              _check.value = !_check.value;
              });
          }),

        ],
      ),
    );
  }
   Widget _buildButton(int index, String text) {
     return ValueListenableBuilder<int>(
       valueListenable: _selectedIndex,
       builder: (context, selectedIndex, _) => Container(
         height: 35,
         width: 80,
         alignment: Alignment.center,
         decoration: BoxDecoration(
           color: selectedIndex == index ? selectedColor : Colors.black,
           borderRadius: BorderRadius.circular(20),
         ),
         child: Text(
           texts[index],
           style: TextStyle(
             color: selectedIndex == index ? Colors.black : Colors.white,
           ),
         ),
       ),
     );
   }
}
