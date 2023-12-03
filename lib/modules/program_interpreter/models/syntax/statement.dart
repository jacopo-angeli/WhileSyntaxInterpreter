import 'package:first_homework/modules/program_interpreter/models/syntax/arithmetic_expression.dart';
import 'package:first_homework/modules/program_interpreter/models/syntax/boolean_expression.dart';

class Statement {
  final Assignment? assignment;
  final Skip? skip;
  final Concatenation? concatenation;
  final IfThenElse? ifThenElse;
  final WhileLoop? whileLoop;
  final RepeatUntilLoop? repeatUntilLoop;
  final ForLoop? forLoop;

  Statement(this.assignment, this.skip, this.concatenation, this.ifThenElse,
      this.whileLoop, this.repeatUntilLoop, this.forLoop);
}

class Assignment {
  final String variable;
  final ArithmeticExpression a;

  Assignment({
    required this.variable,
    required this.a,
  });
}

class Skip {
  final bool skip;

  Skip({required this.skip});
}

class Concatenation {
  final Statement firstStatement;
  final Statement secondStatement;

  Concatenation({
    required this.firstStatement,
    required this.secondStatement,
  });
}

class IfThenElse {
  final BooleanExpression guard;
  final Statement thenBranch;
  final Statement elseBranch;

  IfThenElse({
    required this.guard,
    required this.thenBranch,
    required this.elseBranch,
  });
}

class WhileLoop {
  final BooleanExpression guard;
  final Statement body;

  WhileLoop({
    required this.guard,
    required this.body,
  });
}

class RepeatUntilLoop {
  final BooleanExpression guard;
  final Statement body;

  RepeatUntilLoop({
    required this.guard,
    required this.body,
  });
}

class ForLoop {
  final String x;
  final ArithmeticExpression startValue;
  final ArithmeticExpression endValue;
  final Statement body;

  ForLoop({
    required this.x,
    required this.startValue,
    required this.endValue,
    required this.body,
  });
}
