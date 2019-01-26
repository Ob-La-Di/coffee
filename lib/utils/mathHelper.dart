import 'package:math_expressions/math_expressions.dart';

double parseFormula(String input, int volume) {
  ContextModel _contextModel = new ContextModel();
  _contextModel.bindVariableName('VOLUME', new Parser().parse(volume.toString()));

  Parser p = new Parser();
  Expression exp = p.parse(input);
  return exp.evaluate(EvaluationType.REAL, _contextModel);
}