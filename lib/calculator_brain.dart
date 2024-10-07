

class CalculatorBrain {

  CalculatorBrain({this.height, this.width, this. length});

  final int height;
  final int width;
  final int length;

  int _resin;

  String calculateBMI(){
    _resin = (width*height*length);
    return _resin.toStringAsFixed(0);
  }
}