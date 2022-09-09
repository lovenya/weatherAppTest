import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2result = await task2();
  task3();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  String result;
  result = 'test';
  await Future.delayed((Duration(seconds: 3)), (() {
    //future is an asynchronous
    result = 'task 2 data';
    print('Task 2 complete');
  }));

  return result;
}

void task3() {
  String result = 'task 3 data';
  print('Task 3 complete');
}
