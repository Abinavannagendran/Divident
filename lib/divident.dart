import 'package:divident/DividentController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Divident extends StatefulWidget {
  const Divident({Key? key}) : super(key: key);

  @override
  _DividentState createState() => _DividentState();
}

class _DividentState extends State<Divident> {
  final myController = TextEditingController();
  int count = 0;
  late int title;
  int text = 0;
  List<int> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Divident"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[textField(), listView()],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget textField() {
    return Row(
      children: [
        Expanded(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: myController,
                onChanged: (value) {
                  title = int.parse(value);
                },
              )),
        ),
        submitButton()
      ],
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      child: Text(
        'Submit',
      ),
      onPressed: () {
        Provider.of<DividentController>(context, listen: false)
            .itemCount(title);
      },
    );
  }

  Widget listView() {
    return Selector<DividentController, int>(
        shouldRebuild: (a, b) => true,
        selector: (buildContext, dividentController) =>
            dividentController.count,
        builder: (context, datas, child) {
          text = datas;
          list.clear();
          calculation(text);
          return ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return cardItem(list[index]);
              });
        });
  }

  List<int> calculation(int data) {
    for (int i = 1; i <= data; i++) {
      if (data % i == 0) {
        list.add(i);
      }
    }
    return list;
  }

  Widget cardItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Text("Index $index"),
      ),
    );
  }
}
