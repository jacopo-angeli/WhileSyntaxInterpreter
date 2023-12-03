class ProgramState {
  final Map<String, int> _currentState = {};

  ProgramState();

  void set(String variable, int value) {
    _currentState[variable] = value;
  }

  @override
  String toString() {
    return _currentState.toString().replaceAll("{", "[").replaceAll("}", "]");
  }
}
