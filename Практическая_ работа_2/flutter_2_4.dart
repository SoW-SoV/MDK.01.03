import 'dart:math';

void main() {
  Bank bank = Bank();

  var acc1 = bank.addAccount("Alice");
  var acc2 = bank.addAccount("Bob");

  acc1.deposit(100);
  acc1.withdraw(30);

  bank.transfer(acc1.accountNumber, acc2.accountNumber, 50);

  acc1.displayBalance();
  acc2.displayBalance();
}

class BankAccount {
  final String accountNumber;
  final String ownerName;
  double balance = 0;

  BankAccount(this.ownerName)
      : accountNumber = _generateAccountNumber();

  void deposit(double amount) {
    if (amount <= 0) {
      print("Invalid deposit amount");
      return;
    }
    balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print("Invalid withdraw amount");
      return;
    }
    if (amount > balance) {
      print("Not enough balance");
      return;
    }
    balance -= amount;
  }

  void displayBalance() {
    print("$ownerName ($accountNumber): $balance");
  }

  static String _generateAccountNumber() {
    final random = Random();
    return List.generate(10, (_) => random.nextInt(10)).join();
  }
}

class Bank {
  final List<BankAccount> accounts = [];

  BankAccount addAccount(String ownerName) {
    final account = BankAccount(ownerName);
    accounts.add(account);
    return account;
  }

  BankAccount? findAccount(String accountNumber) {
    for (var acc in accounts) {
      if (acc.accountNumber == accountNumber) {
        return acc;
      }
    }
    return null;
  }

  void transfer(String fromAccountNumber, String toAccountNumber, double amount) {
    final from = findAccount(fromAccountNumber);
    final to = findAccount(toAccountNumber);

    if (from == null || to == null) {
      print("Account not found");
      return;
    }

    if (amount <= 0) {
      print("Invalid transfer amount");
      return;
    }

    if (from.balance < amount) {
      print("Not enough balance");
      return;
    }

    from.withdraw(amount);
    to.deposit(amount);

    print("Transfer completed");
  }
}