import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);
  final addtx;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addtx);

  void submitdata() {
    final enteredTitle = titleController.text;
    final enterdAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enterdAmount < 0) {
      return;
    }
    addtx(enteredTitle, enterdAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        // margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitdata(),
              // onChanged: (val) {
              //  titleInput = val;
              //},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) {
              //   amountInput = val;
              //  }
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitdata(),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                child: Text(
                  'Add trasaction',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                onPressed: () => submitdata(),
                //  print(amountController.value);
              ),
            )
          ],
        ),
      ),
    );
  }
}
