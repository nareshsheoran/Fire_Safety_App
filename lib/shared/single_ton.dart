class Singleton {
  Singleton._private();

  static final Singleton _instance = Singleton._private();

  factory Singleton() {
    return _instance;
  }

  Singleton.private();
}

void main() {
  Singleton mobile = Singleton();
  Singleton password = Singleton();
  print(mobile == password); // true
}
