import 'dart:math';

class CaculatorBrain {
  CaculatorBrain({required this.height, required this.weight});
final int height;
final int weight;

 late double _bmi;


String caculateBMI(){
  _bmi = weight / pow(height/100, 2);
  return _bmi.toStringAsFixed(1);
}

String getResults(){
  if (_bmi >= 25) {
    return 'overweight';
  }else if (_bmi > 18.5) {
    return 'Normal';
  }else{
    return 'UnderWeight';
  }
}

String getInterpretation(){
  if (_bmi >= 25) {
    return 'you have a higher than normal body weight. Try to exercise more';
  }else if (_bmi > 18.5) {
    return 'you have a normal body weight. Good job!';
  }else{
    return 'you have a lower than normal body weight. you can eat a bit more.';
  }
}
}