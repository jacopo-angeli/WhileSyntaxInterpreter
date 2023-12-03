class ArithmeticExpression {
  final Addition? addition;
  final Subtraction? subtraction;
  final Multiplication? multiplication;

  ArithmeticExpression(
    this.addition,
    this.subtraction,
    this.multiplication,
  );
}

class Addition {
  final ArithmeticExpression leftOperand;
  final ArithmeticExpression rightOperand;

  Addition({
    required this.leftOperand,
    required this.rightOperand,
  });
}

class Subtraction {
  final ArithmeticExpression leftOperand;
  final ArithmeticExpression rightOperand;

  Subtraction({
    required this.leftOperand,
    required this.rightOperand,
  });
}

class Multiplication {
  final ArithmeticExpression leftOperand;
  final ArithmeticExpression rightOperand;

  Multiplication({
    required this.leftOperand,
    required this.rightOperand,
  });
}
