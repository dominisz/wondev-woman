import 'dart:io';

class Unit {
  int x;
  int y;
}

class Action {
  String type;
  int unit;
  String move;
  String build;

  Action(this.type, this.unit, this.move, this.build);

  @override
  String toString() {
    return '$type $unit $move $build';
  }

}

int size;
int unitsPerPlayer;
List<Unit> myUnits = [];
List<Unit> enemyUnits = [];
List<Action> legalActions = [];

void initializationInput() {
  size = int.parse(stdin.readLineSync());
  unitsPerPlayer = int.parse(stdin.readLineSync());
  for (int i = 0; i < unitsPerPlayer; i++) {
    myUnits.add(new Unit());
    enemyUnits.add(new Unit());
  }
}

void inputForOneGameTurn() {
  readGrid();
  readUnits(myUnits);
  readUnits(enemyUnits);
  readLegalActions();
}

void readLegalActions() {
  legalActions.clear();
  int legalActionsCount = int.parse(stdin.readLineSync());
  for (int i = 0; i < legalActionsCount; i++) {
    List<String> inputs = stdin.readLineSync().split(' ');
    String type = inputs[0];
    int unit = int.parse(inputs[1]);
    String move = inputs[2];
    String build = inputs[3];
    Action action = new Action(type, unit, move, build);
    legalActions.add(action);
  }
}

void readUnits(List<Unit> units) {
  for (int i = 0; i < unitsPerPlayer; i++) {
    List<String> inputs = stdin.readLineSync().split(' ');
    units[i].x = int.parse(inputs[0]);
    units[i].y = int.parse(inputs[1]);
  }
}

void readGrid() {
  for (int i = 0; i < size; i++) {
    String row = stdin.readLineSync();
    //TODO store rows in list
  }
}

void gameLoop() {
  while (true) {
    inputForOneGameTurn();
    if (legalActions.isNotEmpty) {
      print(legalActions[0]);
    } else {
      print("ACCEPT-DEFEAT Nothing else matters");
    }
  }
}

void main() {
  initializationInput();
  gameLoop();
}
