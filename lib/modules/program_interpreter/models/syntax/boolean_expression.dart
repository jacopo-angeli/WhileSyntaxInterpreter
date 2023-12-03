import 'package:first_homework/modules/program_interpreter/models/syntax/arithmetic_expression.dart';

class BooleanExpression {
  final Comparison? comparison;
  final LessOrEqualTo? lessOrEqualTo;
  final LessThan? lessThan;
  final Negation? negation;
  final And? and;
  final Or? or;

  BooleanExpression(
    this.comparison,
    this.lessOrEqualTo,
    this.lessThan,
    this.negation,
    this.and,
    this.or,
  );
}

class Comparison {
  final ArithmeticExpression leftOperand;
  final ArithmeticExpression rightOperand;

  Comparison({
    required this.leftOperand,
    required this.rightOperand,
  });
}

class LessOrEqualTo {
  final ArithmeticExpression leftOperand;
  final ArithmeticExpression rightOperand;

  LessOrEqualTo({
    required this.leftOperand,
    required this.rightOperand,
  });
}

class LessThan {
  final ArithmeticExpression leftOperand;
  final ArithmeticExpression rightOperand;

  LessThan({
    required this.leftOperand,
    required this.rightOperand,
  });
}

class Negation {
  final BooleanExpression booleanExpression;

  Negation({required this.booleanExpression});
}

class And {
  final ArithmeticExpression leftOperand;
  final ArithmeticExpression rightOperand;

  And({
    required this.leftOperand,
    required this.rightOperand,
  });
}

class Or {
  final ArithmeticExpression leftOperand;
  final ArithmeticExpression rightOperand;

  Or({
    required this.leftOperand,
    required this.rightOperand,
  });
}
