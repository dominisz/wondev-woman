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
  int score;

  Action(this.type, this.unit, this.move, this.build) : score = 0;

  @override
  String toString() {
    return '$type $unit $move $build $score';
  }
}

int size;
int unitsPerPlayer;
List<Unit> myUnits = [];
List<Unit> enemyUnits = [];
List<Action> legalActions = [];
//TODO looks unused, delete it
List<String> grid = [];
List<List<int>> intGrid = [];

void initializationInput() {
  size = int.parse(stdin.readLineSync());
  unitsPerPlayer = int.parse(stdin.readLineSync());
  for (int i = 0; i < unitsPerPlayer; i++) {
    myUnits.add(new Unit());
    enemyUnits.add(new Unit());
  }
  for (int i = 0; i < size; i++) {
    grid.add("row");
    intGrid.add(new List(size));
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
    legalActions.add(new Action(type, unit, move, build));
  }
}

void computePosition(String direction, int x, int y) {
  if (direction.indexOf('N') > -1) {
    y--;
  }
  if (direction.indexOf('S') > -1) {
    y++;
  }
  if (direction.indexOf('E') > -1) {
    x++;
  }
  if (direction.indexOf('W') > -1) {
    x--;
  }
}

void computeScores() {
  legalActions.forEach((action) {
    computeScore(action);
  });
}

void sortActions() {
  legalActions.sort((actionA, actionB) => actionB.score - actionA.score);
}

void computeScore(Action action) {
  int x = myUnits[action.unit].x;
  int y = myUnits[action.unit].y;

  computePosition(action.move, x, y);
  action.score = intGrid[y][x];

  computePosition(action.build, x, y);
  action.score += intGrid[y][x];
}

void readUnits(List<Unit> units) {
  for (int i = 0; i < unitsPerPlayer; i++) {
    List<String> inputs = stdin.readLineSync().split(' ');
    units[i].x = int.parse(inputs[0]);
    units[i].y = int.parse(inputs[1]);
  }
}

final int dotCharacterCode = '.'.codeUnitAt(0);
final int zeroCharacterCode = '0'.codeUnitAt(0);

void readGrid() {
  for (int i = 0; i < size; i++) {
    grid[i] = stdin.readLineSync();
    for (int j = 0; j < size; j++) {
      int char = grid[i].codeUnitAt(j);
      if (char == dotCharacterCode) {
        intGrid[i][j] = -1;
      } else {
        intGrid[i][j] = grid[i].codeUnitAt(j) - zeroCharacterCode;
      }
    }
  }
}

void gameLoop() {
  while (true) {
    inputForOneGameTurn();
    if (legalActions.isNotEmpty) {
      computeScores();
      sortActions();
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
