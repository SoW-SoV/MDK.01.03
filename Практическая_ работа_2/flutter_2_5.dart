import 'dart:math';

void main() {
  Character warrior = Warrior("Воин", 1);
  Character mage = Mage("Маг", 1);

  fight(warrior, mage);
}

/// ================= БОЙ =================
void fight(Character a, Character b) {
  int turn = 0;

  while (a.isAlive() && b.isAlive()) {
    if (turn % 2 == 0) {
      int damage = a.attack();
      b.defend(damage);
      print("${a.name} attacks ${b.name} for $damage");
    } else {
      int damage = b.attack();
      a.defend(damage);
      print("${b.name} attacks ${a.name} for $damage");
    }

    print("${a.name}: ${a.health} HP | ${b.name}: ${b.health} HP");
    print("----");

    turn++;
  }

  if (a.isAlive()) {
    print("${a.name} wins");
  } else {
    print("${b.name} wins");
  }
}

/// ================= CHARACTER =================
abstract class Character {
  String name;
  int health;
  int level;

  Character(this.name, {this.level = 1}) : health = 100;

  int attack();

  void defend(int damage);

  bool isAlive() {
    return health > 0;
  }
}

/// ================= WARRIOR =================
class Warrior extends Character {
  Warrior(String name, int level) : super(name, level: level);

  @override
  int attack() {
    return 15 + level * 2;
  }

  @override
  void defend(int damage) {
    int reduced = (damage * 0.8).round();
    health -= reduced;
  }
}

/// ================= MAGE =================
class Mage extends Character {
  Mage(String name, int level) : super(name, level: level);

  @override
  int attack() {
    return 10 + level * 3;
  }

  @override
  void defend(int damage) {
    health -= damage;
    health += 5;
  }
}

/// ================= ROGUE =================
class Rogue extends Character {
  Rogue(String name, int level) : super(name, level: level);

  @override
  int attack() {
    final random = Random();
    bool crit = random.nextDouble() < 0.2;

    int base = 20;
    return crit ? base * 3 : base;
  }

  @override
  void defend(int damage) {
    final random = Random();
    bool dodge = random.nextDouble() < 0.5;

    if (!dodge) {
      health -= damage;
    }
  }
}